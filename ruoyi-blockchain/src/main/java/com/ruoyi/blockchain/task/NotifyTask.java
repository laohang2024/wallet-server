package com.ruoyi.blockchain.task;

import cn.hutool.core.lang.Dict;
import cn.hutool.crypto.digest.DigestUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSON;
import com.google.protobuf.Any;
import com.google.protobuf.ByteString;
import com.ruoyi.blockchain.chain.core.ChainType;
import com.ruoyi.blockchain.constant.TronConstants;
import com.ruoyi.blockchain.domain.*;
import com.ruoyi.blockchain.service.*;
import com.ruoyi.blockchain.util.BlockUtil;
import com.ruoyi.blockchain.util.TransactionUtil;
import com.ruoyi.common.utils.DictUtils;
import com.ruoyi.common.utils.http.HttpUtils;
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

@Component("notifyTask")
public class NotifyTask {
    private static final Logger logger = LoggerFactory.getLogger(NotifyTask.class);


    @Resource
    private IUsdtTradeService usdtTradeService;

    @Resource
    private IMchChainWalletInfoService mchChainWalletInfoService;

    @Resource
    private IEthTradeService ethTradeService;

    String url = "https://api.okxetoken.com/api/notify/notify";


    public void runNotify() {
        logger.info("监听待回调");
        try {
            notifyUsdtNotify();
            notifyEthNotify();
        } catch (Exception e) {
            logger.error("监听待回调异常了{}", e.getMessage(), e);
        }
    }

    private void notifyEthNotify() {
        EthTrade query = new EthTrade();
        byte isNotify = 0;
        query.setIsNotify(isNotify);
        List<EthTrade> list = ethTradeService.selectEthTradeList(query);
        for(EthTrade ethTrade : list) {
            try {
                MchChainWalletInfo walletInfo = mchChainWalletInfoService.selectMchChainWalletInfoByAddress(ethTrade.getToAddress(), ChainType.ETH.toString().toUpperCase());
                if (walletInfo == null) {
                    logger.info("未找到商户ETH钱包信息,暂不处理");
                    continue;
                }

                Map<String, Object> param = new HashMap<>();
                param.put("mchNo", walletInfo.getMchNo());
                param.put("userId", walletInfo.getUserId());
                param.put("chainType", ChainType.TRON.toString().toUpperCase());
                param.put("sendAddress", ethTrade.getToAddress());
                param.put("receiveAddress", ethTrade.getToAddress());
                param.put("hashCode", ethTrade.getTxHash());
                param.put("timestamp", ethTrade.getTxTime());
                param.put("amount", ethTrade.getAmount().setScale(18, RoundingMode.HALF_UP));

                String signStr =
                        param.get("mchNo") + "|" + param.get("userId") +
                                "|" + param.get("chainType") + "|" + param.get("sendAddress") + "|" + param.get("receiveAddress") +
                                "|" + param.get("hashCode") + "|" + param.get("timestamp") + "|" + param.get("amount") + "|973174ded83451641b3252695f5191bb";
                param.put("sign", DigestUtil.md5Hex(signStr));
                String request = HttpUtil.post(url, param);
                logger.info("ETH回调返回:{}", request);
            } catch (Exception e) {
                logger.error("回调失败", e);
            }
        }
    }

    private void notifyUsdtNotify() {
        UsdtTrade query = new UsdtTrade();
        byte isNotify = 0;
        query.setIsNotify(isNotify);
        List<UsdtTrade> list = usdtTradeService.selectUsdtTradeList(query);
        for (UsdtTrade usdtTrade : list) {
            try {
                MchChainWalletInfo walletInfo = mchChainWalletInfoService.selectMchChainWalletInfoByAddress(usdtTrade.getToAddress(), ChainType.TRON.toString().toUpperCase());
                if (walletInfo == null) {
                    logger.info("未找到商户USDT钱包信息,暂不处理");
                    continue;
                }

                Map<String, Object> param = new HashMap<>();
                param.put("mchNo", walletInfo.getMchNo());
                param.put("userId", walletInfo.getUserId());
                param.put("chainType", ChainType.TRON.toString().toUpperCase());
                param.put("sendAddress", usdtTrade.getToAddress());
                param.put("receiveAddress", usdtTrade.getToAddress());
                param.put("hashCode", usdtTrade.getTxHash());
                param.put("timestamp", usdtTrade.getTxTime());
                param.put("amount", usdtTrade.getAmount().setScale(6, RoundingMode.HALF_UP));

                String signStr =
                        param.get("mchNo") + "|" + param.get("userId") +
                                "|" + param.get("chainType") + "|" + param.get("sendAddress") + "|" + param.get("receiveAddress") +
                                "|" + param.get("hashCode") + "|" + param.get("timestamp") + "|" + param.get("amount") + "|973174ded83451641b3252695f5191bb";
                param.put("sign", DigestUtil.md5Hex(signStr));
                String request = HttpUtil.post(url, param);
                logger.info("USDT回调返回:{}", request);
            } catch (Exception e) {
                logger.error("回调失败", e);
            }
        }
    }
}
