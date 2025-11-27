package com.ruoyi.blockchain.service;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class TokenViewService {

    private static final Logger logger = LoggerFactory.getLogger(TokenViewService.class);

    @Value("${tokenView.host}")
    String tokenViewHost;

    @Value("${tokenView.apiKey}")
    String apiKey;

    public Integer getBlockTxCnt(String blockNumber, String chainType) {
        String uuid = UUID.randomUUID().toString();
        String url = tokenViewHost + "/vipapi/block/" + chainType + "/" + blockNumber + "?apikey=" + apiKey;
        logger.info("{} - 向{}请求查询块信息", uuid, url);
        String requestStr = HttpUtil.get(url);
        logger.info("{} - 查询块信息返回参数:{}", uuid, requestStr);
        Integer blockTxCnt = 0;
        try {
            JSONObject jsonObject = JSONObject.parseObject(requestStr);
            String code = jsonObject.getString("code");
            if (!code.equals("1")) {
                logger.error("{} - 查询块信息失败", uuid);
            }
            JSONObject data = jsonObject.getJSONArray("data").getJSONObject(0);
            blockTxCnt = data.getInteger("txCnt");
        } catch (Exception e) {
            logger.error("{} 查询块信息失败 ", uuid, e);
        }
        return blockTxCnt;
    }

    public JSONArray getBlockTxList(String blockNumber, String chainType, Integer pageNo, Integer pageSize) {
        String uuid = UUID.randomUUID().toString();
        String url = tokenViewHost + "/vipapi/tx/" + chainType + "/" + blockNumber + "/" + pageNo + "/" + pageSize + "?apikey=" + apiKey;
        logger.info("{} - 向{}请求查询块交易列表", uuid, url);
        String requestStr = HttpUtil.get(url);
        logger.info("{} - 查询块交易列表:{}", uuid, requestStr);
        JSONArray data = new JSONArray();
        try {
            JSONObject jsonObject = JSONObject.parseObject(requestStr);
            String code = jsonObject.getString("code");
            if (!code.equals("1")) {
                logger.error("{} - 查询块交易列表失败", uuid);
            }
            data = jsonObject.getJSONArray("data");
        } catch (Exception e) {
            logger.error("{} 查询块交易列表失败 ", uuid, e);
        }
        return data;
    }
}
