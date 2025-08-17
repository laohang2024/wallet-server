package com.ruoyi.blockchain.chain.wallet;

import com.ruoyi.blockchain.chain.core.ChainType;

import java.util.Objects;

public class WalletManager {


    public static WalletCreator getInstance(ChainType type, String tokenFilePath) {
        if (Objects.requireNonNull(type) == ChainType.TRON) {
            return new TronWalletCreator(tokenFilePath);
        }
        if (Objects.requireNonNull(type) == ChainType.ETH) {
            return new EthWalletCreator(tokenFilePath);
        }

        if (Objects.requireNonNull(type) == ChainType.BTC) {
            return new BtcWalletCreator(tokenFilePath);
        }

        return null;
    }
}
