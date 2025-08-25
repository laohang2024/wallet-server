package com.ruoyi.blockchain.task;

import cn.hutool.crypto.digest.DigestUtil;
import cn.hutool.http.HttpUtil;
import com.ruoyi.blockchain.chain.core.ChainType;
import com.ruoyi.blockchain.domain.EthTrade;
import com.ruoyi.blockchain.domain.MchChainWalletInfo;
import com.ruoyi.blockchain.domain.UsdtTrade;
import com.ruoyi.blockchain.service.IEthTradeService;
import com.ruoyi.blockchain.service.IMchChainWalletInfoService;
import com.ruoyi.blockchain.service.IUsdtTradeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.RoundingMode;
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
                    byte notifyFlag = 2;
                    ethTrade.setIsNotify(notifyFlag);
                    ethTradeService.updateEthTrade(ethTrade);
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
                Integer notifyCnt = ethTrade.getNotifyCnt();
                if("success".equalsIgnoreCase(request)) {
                    byte notifyFlag = 1;
                    ethTrade.setIsNotify(notifyFlag);
                }else if (!"success".equalsIgnoreCase(request) && notifyCnt >= 6){
                    byte notifyFlag = 2;
                    ethTrade.setIsNotify(notifyFlag);
                }
                ethTrade.setNotifyCnt(notifyCnt + 1);
                ethTradeService.updateEthTrade(ethTrade);
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
                    byte notifyFlag = 2;
                    usdtTrade.setIsNotify(notifyFlag);
                    usdtTradeService.updateUsdtTrade(usdtTrade);
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
                Integer notifyCnt = usdtTrade.getNotifyCnt();
                if("success".equalsIgnoreCase(request)) {
                    byte notifyFlag = 1;
                    usdtTrade.setIsNotify(notifyFlag);
                }else if (!"success".equalsIgnoreCase(request) && notifyCnt >= 6){
                    byte notifyFlag = 2;
                    usdtTrade.setIsNotify(notifyFlag);
                }
                usdtTrade.setNotifyCnt(notifyCnt + 1);
                usdtTradeService.updateUsdtTrade(usdtTrade);
                logger.info("USDT回调返回:{}", request);
            } catch (Exception e) {
                logger.error("回调失败", e);
            }
        }
    }
}
