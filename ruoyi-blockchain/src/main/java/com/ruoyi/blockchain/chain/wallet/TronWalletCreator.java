package com.ruoyi.blockchain.chain.wallet;


import com.alibaba.fastjson2.JSON;
import com.ruoyi.blockchain.chain.core.ChainType;
import com.ruoyi.blockchain.chain.core.WalletModule;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tron.trident.core.key.KeyPair;

public class TronWalletCreator extends WalletCreator {
    private static final Logger logger = LoggerFactory.getLogger(TronWalletCreator.class);

    public TronWalletCreator(String tokenFilePath) {
        super(tokenFilePath);
        this.tokenFilePath = tokenFilePath + "/TRON";
        this.chainType = ChainType.TRON;
    }

    @Override
    public WalletModule generateWallet() {
        KeyPair keyPair = KeyPair.generate();
        WalletModule walletModule = new WalletModule();
        walletModule.setAddress(keyPair.toBase58CheckAddress());
        walletModule.setPrivateKey(keyPair.toPrivateKey());
        walletModule.setPublicKey(keyPair.toPublicKey());
        walletModule.setChainType(this.chainType);
        saveWalletToFile(walletModule);
        return walletModule;
    }


    public static void main(String[] args) {
        WalletCreator creator = WalletManager.getInstance(ChainType.TRON, "/Users/combo/work/okxe/store/tokens");
        WalletModule walletModule = creator.generateWallet();
        System.out.println(JSON.toJSON(walletModule));

    }


}
