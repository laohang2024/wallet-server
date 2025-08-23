package com.ruoyi.blockchain.service;


import com.ruoyi.blockchain.chain.core.ChainType;
import com.ruoyi.blockchain.chain.core.WalletModule;
import com.ruoyi.blockchain.chain.wallet.WalletCreator;
import com.ruoyi.blockchain.chain.wallet.WalletManager;
import com.ruoyi.blockchain.domain.MchChainWalletInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class InnerBlockchainServer {

    @Resource
    IMchChainWalletInfoService mchChainWalletInfoService;

    @Value("${customParam.tokenFilePath}")
    private String tokenFilePath;

    public final static String ENCRYPTION_KEY = "RuoYiApplication";
    public final static String IV_BYTES = "0123456789123456";

    private static final Logger logger = LoggerFactory.getLogger(InnerBlockchainServer.class);

    @Transactional(rollbackFor = Exception.class)
    public List<MchChainWalletInfo> generateBAccountInfo(String mchNo, String userId) {

        List<MchChainWalletInfo> bAccountInfoList = new ArrayList<>();
        for (ChainType chainType : ChainType.values()) {
            WalletCreator walletCreator = WalletManager.getInstance(chainType, this.tokenFilePath);
            if (walletCreator == null) {
                continue;
            }
            String chainTypeName = chainType.toString().toUpperCase();
            WalletModule walletModule = walletCreator.generateWallet();

            MchChainWalletInfo mchChainWalletInfo = new MchChainWalletInfo();
            String id = mchNo + "_" + userId + "_" + chainType.name().toUpperCase();
            mchChainWalletInfo.setId(id);
            mchChainWalletInfo.setMchNo(mchNo);
            mchChainWalletInfo.setUserId(userId);
            mchChainWalletInfo.setChainType(chainTypeName);
            mchChainWalletInfo.setAddress(walletModule.getAddress());
            mchChainWalletInfo.setCreatedTime(System.currentTimeMillis());
            bAccountInfoList.add(mchChainWalletInfo);
            mchChainWalletInfoService.insertMchChainWalletInfo(mchChainWalletInfo);
        }
        return bAccountInfoList;
    }

    public void monitorTron(){
        
    }
}
