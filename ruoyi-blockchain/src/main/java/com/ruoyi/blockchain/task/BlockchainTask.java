package com.ruoyi.blockchain.task;

import com.alibaba.fastjson2.JSON;
import com.google.protobuf.Any;
import com.google.protobuf.ByteString;
import com.ruoyi.blockchain.chain.core.ChainType;
import com.ruoyi.blockchain.constant.TronConstants;
import com.ruoyi.blockchain.domain.ChainMonitorInfo;
import com.ruoyi.blockchain.domain.ChainTronWallet;
import com.ruoyi.blockchain.domain.UsdtTrade;
import com.ruoyi.blockchain.service.ApiWrapperService;
import com.ruoyi.blockchain.service.IChainMonitorInfoService;
import com.ruoyi.blockchain.service.IChainTronWalletService;
import com.ruoyi.blockchain.service.IUsdtTradeService;
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
import org.tron.trident.proto.Chain;
import org.tron.trident.proto.Contract;
import org.tron.trident.proto.Response;
import org.tron.trident.utils.Base58Check;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component("blockchainTask")
public class BlockchainTask {
    private static final Logger logger = LoggerFactory.getLogger(BlockchainTask.class);

    @Resource
    private ApiWrapperService apiWrapperService;

    @Resource
    private IUsdtTradeService usdtTradeService;

    @Resource
    private IChainTronWalletService chainTronWalletService;

    @Resource
    private IChainMonitorInfoService chainMonitorInfoService;

    public void runTronMonitor() {
        logger.info("监听TRON链");
        ApiWrapper apiWrapper = apiWrapperService.create();
        try {
            ChainMonitorInfo chainMonitorInfo = chainMonitorInfoService.selectChainMonitorInfoByChainType(ChainType.TRON.toString().toUpperCase());
            long blockNum = chainMonitorInfo.getBlockNum();

            Response.BlockExtention blockExtention = apiWrapper.getBlockByNum(blockNum);
            String blockId = BlockUtil.parseBlockId(blockExtention);
            logger.info("区块高度：{} , 区块ID：{}", blockNum, blockId);
            Map<String, UsdtTrade> usdtTradeMap = new HashMap<>();
            for (Response.TransactionExtention transactionExtention : blockExtention.getTransactionsList()) {
                Chain.Transaction transaction = transactionExtention.getTransaction();
                // 检查交易是否成功
                boolean status = TransactionUtil.isTransactionSuccess(transaction);
                // 交易ID
                String tid = TransactionUtil.getTransactionId(transaction);

                if (!status) {
                    logger.info("交易不成功,不处理 {}", tid);
                    continue;
                }
                Chain.Transaction.Contract.ContractType contractType = transaction.getRawData().getContract(0).getType();
                if (contractType != Chain.Transaction.Contract.ContractType.TriggerSmartContract) {
                    //logger.info("不是USDT交易,不处理 {}", tid);
                    continue;
                }
                logger.info("USDT交易,进行处理 {}", tid);
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
                    logger.info("不是标准转账函数,不处理");
                    continue;
                    //throw new Exception(funcId + "不是标准转账函数！");
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
                usdtTradeMap.put(toAddress, usdtTrade);
                //logger.info("交易信息:{}", JSON.toJSONString(usdtTradeMap));
            }

            List<String> toAddressList = new ArrayList<>(usdtTradeMap.keySet());

            List<ChainTronWallet> walletList = chainTronWalletService.selectChainTronWalletListByAddresss(toAddressList.toArray(new String[0]));
            logger.info("{}", JSON.toJSONString(walletList));

            for (ChainTronWallet chainTronWallet : walletList) {
                UsdtTrade usdtTrade = usdtTradeMap.get(chainTronWallet.getAddress());
                try {
                    usdtTradeService.insertUsdtTrade(usdtTrade);
                } catch (Exception e) {
                    logger.error("插入数据失败,{}", e.getMessage(), e);
                }
            }
            chainMonitorInfoService.addBlockNum(ChainType.TRON.toString().toUpperCase());
        } catch (Exception e) {
            logger.error("监听TRON链异常了{}", e.getMessage(), e);
        }

        apiWrapper.close();

    }
}
