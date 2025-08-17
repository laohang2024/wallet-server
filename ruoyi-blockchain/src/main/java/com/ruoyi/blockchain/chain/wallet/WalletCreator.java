package com.ruoyi.blockchain.chain.wallet;

import cn.hutool.crypto.Mode;
import cn.hutool.crypto.Padding;
import cn.hutool.crypto.symmetric.AES;
import com.alibaba.fastjson2.JSON;
import com.ruoyi.blockchain.chain.core.ChainType;
import com.ruoyi.blockchain.chain.core.WalletModule;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public abstract class WalletCreator {

    private static final Logger logger = LoggerFactory.getLogger(WalletCreator.class);

    String tokenFilePath = "";

    ChainType chainType = null;

    private WalletCreator() {
    }

    public WalletCreator(String tokenFilePath) {
        this.tokenFilePath = tokenFilePath;
    }

    //新生成地址
    public abstract WalletModule generateWallet();


    public boolean saveWalletToFile(WalletModule walletModule) {
        String filePath = tokenFilePath + "/" + walletModule.getAddress();
        Path path = Paths.get(filePath);
        boolean result = false;
        if (Files.exists(path)) {
            logger.error("{}文件已存在，无法保存", filePath);
            return result;
        }
        try {
            Files.write(path, JSON.toJSONBytes(walletModule));
            logger.info("保存token成功 ");

        } catch (Exception e) {
            logger.error("保存文件失败", e);
        }
        return result;
    }

    public WalletModule getWalletFromFile(String address, ChainType chainType) {
        String filePath = tokenFilePath + "/" + address;
        try {
            String walletStr = new String(Files.readAllBytes(Paths.get(filePath)));
            return JSON.parseObject(walletStr, WalletModule.class);
        } catch (Exception e) {
            logger.error("读取token失败", e);
        }
        return null;
    }
}
