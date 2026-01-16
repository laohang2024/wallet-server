package com.ruoyi.blockchain.task;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.google.protobuf.Any;
import com.google.protobuf.ByteString;
import com.ruoyi.blockchain.chain.core.ChainType;
import com.ruoyi.blockchain.constant.TronConstants;
import com.ruoyi.blockchain.domain.*;
import com.ruoyi.blockchain.service.*;
import com.ruoyi.blockchain.util.BlockUtil;
import com.ruoyi.blockchain.util.TransactionUtil;
import org.bouncycastle.util.encoders.Hex;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.tron.trident.abi.TypeDecoder;
import org.tron.trident.abi.datatypes.Address;
import org.tron.trident.abi.datatypes.NumericType;
import org.tron.trident.abi.datatypes.generated.Uint256;
import org.tron.trident.core.ApiWrapper;
import org.tron.trident.core.exceptions.IllegalException;
import org.tron.trident.proto.Chain;
import org.tron.trident.proto.Contract;
import org.tron.trident.proto.Response;
import org.tron.trident.utils.Base58Check;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

@Component("blockchainTask")
public class BlockchainTask {
    private static final Logger logger = LoggerFactory.getLogger(BlockchainTask.class);

    @Resource
    private ApiWrapperService apiWrapperService;

    @Resource
    private IUsdtTradeService usdtTradeService;

    @Resource
    private IEthTradeService ethTradeService;

    @Resource
    private IBtcTradeService btcTradeService;

    @Resource
    private IChainTronWalletService chainTronWalletService;

    @Resource
    private IChainEthWalletService chainEthWalletService;

    @Resource
    private IChainBtcWalletService chainBtcWalletService;

    @Resource
    private IChainMonitorInfoService chainMonitorInfoService;


    public void runTronMonitor() {
        String uuid = UUID.randomUUID().toString().replace("-", "");
        logger.info("{} -开始监听TRON链", uuid);
        Map<String, Long> blockMap = getUsdtLastBlockNumber(uuid);
        Long startBlockNum = blockMap.get("startBlockNum");
        Long endBlockNum = blockMap.get("endBlockNum");
        if (startBlockNum <= 0) {
            logger.info("{} - 未找TRON到块高", uuid);
            return;
        }
        for (long blockNum = startBlockNum; blockNum <= endBlockNum; blockNum++) {
            runTron(blockNum, uuid);
        }
    }


    public Map<String, Long> getUsdtLastBlockNumber(String uuid) {
        ApiWrapper apiWrapper = apiWrapperService.create();
        Map<String, Long> resultMap = new HashMap<>();
        resultMap.put("startBlockNum", 0L);
        resultMap.put("endBlockNum", 0L);
        try {
            ChainMonitorInfo chainMonitorInfo = chainMonitorInfoService.selectChainMonitorInfoByChainType(ChainType.TRON.toString().toUpperCase());
            Long startBlockNum = chainMonitorInfo.getBlockNum();
            Chain.Block block = apiWrapper.getNowBlock();
            long lastBlockNum = block.getBlockHeader().getRawData().getNumber();
            if (lastBlockNum <= startBlockNum) {
                logger.info("{} -未有最新的块，暂不处理", uuid);
                return resultMap;
            }

            if (lastBlockNum - startBlockNum > 6) {
                lastBlockNum = startBlockNum + 5;
            }
            startBlockNum += 1;
            logger.info("{} - 需要处理的块 {}", uuid, JSON.toJSONString(resultMap));
            resultMap.put("startBlockNum", startBlockNum);
            resultMap.put("endBlockNum", lastBlockNum);
            chainMonitorInfo.setLastTime(System.currentTimeMillis());
            chainMonitorInfo.setBlockNum(lastBlockNum);
            chainMonitorInfoService.updateChainMonitorInfo(chainMonitorInfo);
            return resultMap;
        } catch (Exception e) {
            logger.error("{} - 获取最新块信息失败{}", uuid, e.getMessage(), e);
            return resultMap;
        } finally {
            apiWrapper.close();
        }
    }

    public void runTron(long blockNum, String uuid) {
        logger.info("{} -开始处理块-{}", uuid, blockNum);
        ApiWrapper apiWrapper = apiWrapperService.create();
        try {
            Response.BlockExtention blockExtention = apiWrapper.getBlockByNum(blockNum);
            String blockId = BlockUtil.parseBlockId(blockExtention);
            logger.info("{} - 区块高度：{} , 区块ID：{}", uuid, blockNum, blockId);
            Map<String, UsdtTrade> usdtTradeMap = new HashMap<>();
            for (Response.TransactionExtention transactionExtention : blockExtention.getTransactionsList()) {
                UsdtTrade usdtTrade = runTrad(transactionExtention, blockNum, uuid);
                if (usdtTrade != null) {
                    usdtTradeMap.put(usdtTrade.getToAddress(), usdtTrade);
                }
            }

            List<String> toAddressList = new ArrayList<>(usdtTradeMap.keySet());
            if (toAddressList.isEmpty()) {
                logger.info("{} - 未找监听到任何地址", uuid);
                chainMonitorInfoService.addBlockNum(ChainType.TRON.toString().toUpperCase());
                return;
            }
            List<ChainTronWallet> walletList = chainTronWalletService.selectChainTronWalletListByAddresses(toAddressList.toArray(new String[0]));
            logger.info("待处理钱包 - {}", JSON.toJSONString(walletList));

            for (ChainTronWallet chainTronWallet : walletList) {
                UsdtTrade usdtTrade = usdtTradeMap.get(chainTronWallet.getAddress());
                try {
                    usdtTradeService.insertUsdtTrade(usdtTrade);
                } catch (Exception e) {
                    logger.error("{} - 插入数据失败,{}", uuid, e.getMessage(), e);
                }
            }
        } catch (Exception e) {
            logger.error("{} - 监听TRON链异常了{}", uuid, e.getMessage(), e);
        } finally {
            apiWrapper.close();
        }
    }

    public UsdtTrade runTrad(Response.TransactionExtention transactionExtention, Long blockNum, String uuid) {
        try {
            Chain.Transaction transaction = transactionExtention.getTransaction();
            // 检查交易是否成功
            boolean status = TransactionUtil.isTransactionSuccess(transaction);
            // 交易ID
            String tid = TransactionUtil.getTransactionId(transaction);
            if (!status) {
                //logger.info("{} - 交易不成功,不处理 {}", uuid, tid);
                return null;
            }
            Chain.Transaction.Contract.ContractType contractType = transaction.getRawData().getContract(0).getType();
            if (contractType != Chain.Transaction.Contract.ContractType.TriggerSmartContract) {
                //logger.info("不是USDT交易,不处理 {}", tid);
                return null;
            }
            // 合约
            Chain.Transaction.Contract contract = transaction.getRawData().getContract(0);
            // parameter
            Any any = contract.getParameter();
            Contract.TriggerSmartContract transferContract = any.unpack(Contract.TriggerSmartContract.class);

            // 备注
            ByteString memoData = transaction.getRawData().getData();
            // 转账数据：到账地址、交易金额
            String data = Hex.toHexString(transferContract.getData().toByteArray());
            // 函数选择器，必须为【a9059cbb】

            String funcId = data.substring(0, 8);

            if (!TronConstants.TRANSFER_FUNC_ID_BY_KECCAK256.equals(funcId)) {
                //logger.info("{} - 不是标准转账函数,不处理", uuid);
                return null;
            }
            // 收款人地址
            String toAddressStr = data.substring(8, 72);
            Address address = TypeDecoder.decodeAddress(toAddressStr);
            String toAddress = address.getValue();
            // 发送金额
            String amountStr = data.substring(72, 136);
            NumericType numericType = TypeDecoder.decodeNumeric(amountStr, Uint256.class);
            BigDecimal amount = new BigDecimal(numericType.getValue()).divide(new BigDecimal("1000000"), 6, RoundingMode.HALF_UP);
            // 发送人地址
            byte[] fromAddressBs = transferContract.getOwnerAddress().toByteArray();
            String fromAddress = Base58Check.bytesToBase58(fromAddressBs);
            // 合约地址
            byte[] contractAddressBs = transferContract.getContractAddress().toByteArray();
            String contractAddress = Base58Check.bytesToBase58(contractAddressBs);
            //交易时间
            long timestamp = transaction.getRawData().getTimestamp();
            UsdtTrade usdtTrade = new UsdtTrade();
            usdtTrade.setContractAddress(contractAddress);
            usdtTrade.setTxHash(tid);
            usdtTrade.setFromAddress(fromAddress);
            usdtTrade.setToAddress(toAddress);
            usdtTrade.setBlockNum(blockNum);
            usdtTrade.setAmount(amount);
            usdtTrade.setTxTime(timestamp);
            return usdtTrade;
        } catch (Exception e) {
            logger.info("{} - 处理交易失败", uuid);
            return null;
        }
    }


    @Resource
    TokenViewService tokenViewService;

    public void runBtcMonitor() {
        String uuid = UUID.randomUUID().toString().replace("-", "");
        logger.info("{} -开始监听BTC链", uuid);
        Map<String, Long> blockMap = getBtcLastBlockNumber(uuid);
        Long startBlockNum = blockMap.get("startBlockNum");
        Long endBlockNum = blockMap.get("endBlockNum");
        if (startBlockNum <= 0) {
            logger.info("{} - 未找BTC块高", uuid);
            return;
        }
        for (long blockNum = startBlockNum; blockNum <= endBlockNum; blockNum++) {
            runBtc(blockNum, uuid);
        }
    }

    public Map<String, Long> getBtcLastBlockNumber(String uuid) {
        Map<String, Long> resultMap = new HashMap<>();
        resultMap.put("startBlockNum", 0L);
        resultMap.put("endBlockNum", 0L);
        try {
            ChainMonitorInfo chainMonitorInfo = chainMonitorInfoService.selectChainMonitorInfoByChainType(ChainType.BTC.toString().toUpperCase());
            Long startBlockNum = chainMonitorInfo.getBlockNum();

            Long lastBlockNum = tokenViewService.getLastBlockNum(ChainType.BTC.toString().toLowerCase());
            if (lastBlockNum <= 0) {
                logger.info("{} - BTC查询最新块高失败 {}", uuid, JSON.toJSONString(resultMap));
                return resultMap;
            }
            lastBlockNum -= 1;
            if (lastBlockNum <= startBlockNum) {
                logger.info("{} - BTC未有新块 {}", uuid, JSON.toJSONString(resultMap));
                return resultMap;
            }
            if (lastBlockNum - startBlockNum > 2) {
                lastBlockNum = startBlockNum + 1;
            }
            startBlockNum += 1;
            logger.info("{} - BTC需要处理的块 {}", uuid, JSON.toJSONString(resultMap));
            resultMap.put("startBlockNum", startBlockNum);
            resultMap.put("endBlockNum", lastBlockNum);
            chainMonitorInfo.setLastTime(System.currentTimeMillis());
            chainMonitorInfo.setBlockNum(lastBlockNum);
            chainMonitorInfoService.updateChainMonitorInfo(chainMonitorInfo);
            return resultMap;
        } catch (Exception e) {
            logger.error("{} - 获取ETH最新块信息失败{}", uuid, e.getMessage(), e);
            return resultMap;
        }
    }

    public void runBtc(Long blockNum, String uuid) {
        try {
            Integer txCnt = tokenViewService.getBlockTxCnt(blockNum + "", ChainType.BTC.toString().toLowerCase());
            logger.info("{} - BTC区块[{}]交易数{}", uuid, blockNum, txCnt);
            if (txCnt == 0) {
                logger.info("{} - BTC区块查询失败,暂不处理", uuid);
                return;
            }
            int pageCnt = 1;
            int pageSize = 50;
            int maxPageCnt = (txCnt / pageSize) + (txCnt % pageSize == 0 ? 0 : 1);
            logger.info("共{}页", maxPageCnt);
            List<String> toAddressList = new ArrayList<>();
            Map<String, BtcTrade> btcTradeMap = new HashMap<>();
            for (; pageCnt <= maxPageCnt; pageCnt++) {
                JSONArray jsonArray = tokenViewService.getBlockTxList(blockNum + "", ChainType.BTC.toString().toLowerCase(), pageCnt, pageSize);

                for (Object obj : jsonArray) {
                    JSONObject jsonObject = (JSONObject) obj;
                    JSONArray inputs = jsonObject.getJSONArray("inputs");
                    JSONObject inputInfo = inputs.getJSONObject(0);
                    String fromAddress = inputInfo.getString("address");

                    JSONArray outputs = jsonObject.getJSONArray("outputs");
                    for (int i = 0; i < outputs.size(); i++) {
                        JSONObject jObject = outputs.getJSONObject(i);
                        String toAddress = jObject.getString("address");
                        toAddressList.add(toAddress);

                        BtcTrade btcTrade = new BtcTrade();
                        btcTrade.setTxHash(jsonObject.getString("txid"));
                        btcTrade.setAmount(jObject.getBigDecimal("value"));
                        btcTrade.setBlockNum(jsonObject.getLong("block_no"));
                        btcTrade.setTxTime(jsonObject.getLong("time") * 1000);
                        btcTrade.setFromAddress(fromAddress);
                        btcTrade.setToAddress(toAddress);
                        btcTradeMap.put(toAddress, btcTrade);
                    }
                }

                if (toAddressList.isEmpty()) {
                    logger.info("{} - 未找监听到BTC任何地址", uuid);
                    continue;
                }

                List<ChainBtcWallet> walletList = chainBtcWalletService.selectChainBtcWalletListByAddresses(toAddressList.toArray(new String[0]));
                logger.info("找到符合条件的BTC地址{}", JSON.toJSONString(walletList));
                for (ChainBtcWallet chainEthWallet : walletList) {
                    BtcTrade btcTrade = btcTradeMap.get(chainEthWallet.getAddress());
                    try {
                        btcTradeService.insertBtcTrade(btcTrade);
                    } catch (Exception e) {
                        logger.error("{} - 插入数据失败,{}", uuid, e.getMessage(), e);
                    }
                }
            }

        } catch (Exception e) {
            logger.error("{} - 监听BTC链异常了{}", uuid, e.getMessage(), e);
        }
    }


    public void runEthMonitor() {
        String uuid = UUID.randomUUID().toString().replace("-", "");
        logger.info("{} -开始监听ETH链", uuid);
        Map<String, Long> blockMap = getEthLastBlockNumber(uuid);
        Long startBlockNum = blockMap.get("startBlockNum");
        Long endBlockNum = blockMap.get("endBlockNum");
        if (startBlockNum <= 0) {
            logger.info("{} - 未找ETH到块高", uuid);
            return;
        }
        for (long blockNum = startBlockNum; blockNum <= endBlockNum; blockNum++) {
            runEth(blockNum, uuid);
        }
    }

    public Map<String, Long> getEthLastBlockNumber(String uuid) {
        Map<String, Long> resultMap = new HashMap<>();
        resultMap.put("startBlockNum", 0L);
        resultMap.put("endBlockNum", 0L);
        try {
            ChainMonitorInfo chainMonitorInfo = chainMonitorInfoService.selectChainMonitorInfoByChainType(ChainType.ETH.toString().toUpperCase());
            Long startBlockNum = chainMonitorInfo.getBlockNum();


            Long lastBlockNum = tokenViewService.getLastBlockNum(ChainType.ETH.toString().toLowerCase());
            if (lastBlockNum <= 0) {
                logger.info("{} - ETH查询最新块高失败 {}", uuid, JSON.toJSONString(resultMap));
                return resultMap;
            }
            if (lastBlockNum <= startBlockNum) {
                logger.info("{} - ETH未有新块 {}", uuid, JSON.toJSONString(resultMap));
                return resultMap;
            }
            if (lastBlockNum - startBlockNum > 6) {
                lastBlockNum = startBlockNum + 5;
            }
            startBlockNum += 1;
            logger.info("{} - ETH需要处理的块 {}", uuid, JSON.toJSONString(resultMap));
            resultMap.put("startBlockNum", startBlockNum);
            resultMap.put("endBlockNum", lastBlockNum);
            chainMonitorInfo.setLastTime(System.currentTimeMillis());
            chainMonitorInfo.setBlockNum(lastBlockNum);
            chainMonitorInfoService.updateChainMonitorInfo(chainMonitorInfo);
            return resultMap;
        } catch (Exception e) {
            logger.error("{} - 获取ETH最新块信息失败{}", uuid, e.getMessage(), e);
            return resultMap;
        }
    }

    public void runEth(Long blockNum, String uuid) {
        try {
            Integer txCnt = tokenViewService.getBlockTxCnt(blockNum + "", ChainType.ETH.toString().toLowerCase());
            logger.info("{} - ETH区块[{}]交易数{}", uuid, blockNum, txCnt);
            if (txCnt == 0) {
                logger.info("{} - ETH区块查询失败,暂不处理", uuid);
                return;
            }
            int pageCnt = 1;
            int pageSize = 50;
            int maxPageCnt = (txCnt / pageSize) + (txCnt % pageSize == 0 ? 0 : 1);
            for (; pageCnt <= maxPageCnt; pageCnt++) {
                JSONArray jsonArray = tokenViewService.getBlockTxList(blockNum + "", ChainType.ETH.toString().toLowerCase(), pageCnt, pageSize);
                List<String> toAddressList = new ArrayList<>();
                Map<String, EthTrade> ethTradeMap = new HashMap<>();
                for (Object obj : jsonArray) {
                    JSONObject jsonObject = (JSONObject) obj;
                    String toAddress = jsonObject.getString("to");
                    toAddressList.add(toAddress);
                    EthTrade ethTrade = new EthTrade();
                    ethTrade.setTxHash(jsonObject.getString("txid"));
                    ethTrade.setAmount(jsonObject.getBigDecimal("value"));
                    ethTrade.setBlockNum(jsonObject.getLong("block_no"));
                    ethTrade.setTxTime(jsonObject.getLong("time") * 1000);
                    ethTrade.setFromAddress(jsonObject.getString("from"));
                    ethTrade.setToAddress(toAddress);
                    ethTradeMap.put(toAddress, ethTrade);
                }
                if (toAddressList.isEmpty()) {
                    logger.info("{} - 未找监听到ETH任何地址", uuid);
                    continue;
                }
                List<ChainEthWallet> walletList = chainEthWalletService.selectChainEthWalletListByAddresses(toAddressList.toArray(new String[0]));
                logger.info("找到符合条件的ETH地址{}", JSON.toJSONString(walletList));
                logger.info("共{}页", maxPageCnt);
                for (ChainEthWallet chainEthWallet : walletList) {

                    EthTrade ethTrade = ethTradeMap.get(chainEthWallet.getAddress());
                    try {

                        ethTradeService.insertEthTrade(ethTrade);
                    } catch (Exception e) {
                        logger.error("{} - 插入数据失败,{}", uuid, e.getMessage(), e);
                    }
                }
            }
        } catch (Exception e) {
            logger.error("{} - 监听ETH链异常了{}", uuid, e.getMessage(), e);
        }
    }
}
