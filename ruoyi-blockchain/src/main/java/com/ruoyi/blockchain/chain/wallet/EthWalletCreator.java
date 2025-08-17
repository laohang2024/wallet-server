package com.ruoyi.blockchain.chain.wallet;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.blockchain.chain.core.ChainType;
import com.ruoyi.blockchain.chain.core.WalletModule;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.Keys;
import org.web3j.crypto.Wallet;
import org.web3j.crypto.WalletFile;

import java.math.BigInteger;
import java.util.UUID;

public class EthWalletCreator extends WalletCreator {

    private static final Logger logger = LoggerFactory.getLogger(EthWalletCreator.class);

    public EthWalletCreator(String tokenFilePath) {
        super(tokenFilePath);
        this.tokenFilePath = tokenFilePath + "/ETH";
        this.chainType = ChainType.ETH;
    }


    @Override
    public WalletModule generateWallet() {
        String seed = UUID.randomUUID().toString();
        try {
            ECKeyPair ecKeyPair = Keys.createEcKeyPair();
            BigInteger privateKeyInDec = ecKeyPair.getPrivateKey();
            BigInteger publicKeyInDec = ecKeyPair.getPublicKey();
            WalletModule walletModule = new WalletModule();
            walletModule.setPrivateKey(privateKeyInDec.toString(16));
            walletModule.setPublicKey(publicKeyInDec.toString(16));
            WalletFile aWallet = Wallet.createLight(seed, ecKeyPair);
            walletModule.setAddress("0x" + aWallet.getAddress());
            walletModule.setChainType(this.chainType);
            saveWalletToFile(walletModule);
            return walletModule;
        } catch (Exception e) {
            logger.error("生成ETH钱包失败", e);
            return null;
        }
    }

    public static void main(String[] args) {
        WalletCreator creator = WalletManager.getInstance(ChainType.ETH, "/Users/combo/work/okxe/store/tokens");
        WalletModule walletModule = creator.generateWallet();
        System.out.println(JSON.toJSON(walletModule));
    }
}
