package com.ruoyi.blockchain.chain.wallet;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.blockchain.chain.core.ChainType;
import com.ruoyi.blockchain.chain.core.WalletModule;
import org.bitcoinj.core.Address;
import org.bitcoinj.core.ECKey;
import org.bitcoinj.core.NetworkParameters;
import org.bitcoinj.core.SegwitAddress;
import org.bitcoinj.params.MainNetParams;
import org.bitcoinj.script.ScriptBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.SecureRandom;

public class BtcWalletCreator extends WalletCreator {

    private static final Logger logger = LoggerFactory.getLogger(BtcWalletCreator.class);

    public BtcWalletCreator(String tokenFilePath) {
        super(tokenFilePath);
        this.tokenFilePath = tokenFilePath + "/BTC";
        this.chainType = ChainType.BTC;
    }

    @Override
    public WalletModule generateWallet() {
        // 1. 获取网络参数 (主网或测试网)
        NetworkParameters params = MainNetParams.get(); // 或者 TestNet3Params.get()

        // 2. 生成随机私钥
        SecureRandom secureRandom = new SecureRandom();
        ECKey key = new ECKey(secureRandom);

        // 4. 生成 Taproot 地址
        SegwitAddress segwitAddress = SegwitAddress.fromKey(MainNetParams.get(), key);

        WalletModule walletModule = new WalletModule();
        walletModule.setAddress(segwitAddress.toBech32());
        walletModule.setPrivateKey(key.getPrivKey().toString(16));
        walletModule.setPublicKey(key.getPublicKeyAsHex());
        walletModule.setChainType(this.chainType);
        saveWalletToFile(walletModule);
        return walletModule;
    }

    public static void main(String[] args) {
        WalletCreator creator = WalletManager.getInstance(ChainType.BTC, "/Users/combo/work/okxe/store/tokens");
        WalletModule walletModule = creator.generateWallet();
        System.out.println(JSON.toJSON(walletModule));
    }
}
