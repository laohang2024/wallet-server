package com.ruoyi.blockchain.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blockchain.mapper.UsdtTradeMapper;
import com.ruoyi.blockchain.domain.UsdtTrade;
import com.ruoyi.blockchain.service.IUsdtTradeService;
import com.ruoyi.common.core.text.Convert;

/**
 * USDT交易记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-08-23
 */
@Service
public class UsdtTradeServiceImpl implements IUsdtTradeService 
{
    @Autowired
    private UsdtTradeMapper usdtTradeMapper;

    /**
     * 查询USDT交易记录
     * 
     * @param txHash USDT交易记录主键
     * @return USDT交易记录
     */
    @Override
    public UsdtTrade selectUsdtTradeByTxHash(String txHash)
    {
        return usdtTradeMapper.selectUsdtTradeByTxHash(txHash);
    }

    /**
     * 查询USDT交易记录列表
     * 
     * @param usdtTrade USDT交易记录
     * @return USDT交易记录
     */
    @Override
    public List<UsdtTrade> selectUsdtTradeList(UsdtTrade usdtTrade)
    {
        return usdtTradeMapper.selectUsdtTradeList(usdtTrade);
    }

    /**
     * 新增USDT交易记录
     * 
     * @param usdtTrade USDT交易记录
     * @return 结果
     */
    @Override
    public int insertUsdtTrade(UsdtTrade usdtTrade)
    {
        return usdtTradeMapper.insertUsdtTrade(usdtTrade);
    }

    /**
     * 修改USDT交易记录
     * 
     * @param usdtTrade USDT交易记录
     * @return 结果
     */
    @Override
    public int updateUsdtTrade(UsdtTrade usdtTrade)
    {
        return usdtTradeMapper.updateUsdtTrade(usdtTrade);
    }

    /**
     * 批量删除USDT交易记录
     * 
     * @param txHashs 需要删除的USDT交易记录主键
     * @return 结果
     */
    @Override
    public int deleteUsdtTradeByTxHashs(String txHashs)
    {
        return usdtTradeMapper.deleteUsdtTradeByTxHashs(Convert.toStrArray(txHashs));
    }

    /**
     * 删除USDT交易记录信息
     * 
     * @param txHash USDT交易记录主键
     * @return 结果
     */
    @Override
    public int deleteUsdtTradeByTxHash(String txHash)
    {
        return usdtTradeMapper.deleteUsdtTradeByTxHash(txHash);
    }


}
