package com.ruoyi.blockchain.service;

import cn.hutool.core.util.StrUtil;
import com.ruoyi.blockchain.conf.TronConfig;
import org.springframework.stereotype.Service;
import org.tron.trident.core.ApiWrapper;

import javax.annotation.Resource;

@Service
public class ApiWrapperService {

    @Resource
    TronConfig tronConfig;

    public ApiWrapper create() {
        return ApiWrapper.ofMainnet(tronConfig.getPrivateKey(), tronConfig.getApiKey());
    }

    public ApiWrapper create(String privateKey) {
        return ApiWrapper.ofMainnet(privateKey, tronConfig.getApiKey());
    }

}
