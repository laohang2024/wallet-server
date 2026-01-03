package com.ruoyi.blockchain.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blockchain.mapper.BtcTradeMapper;
import com.ruoyi.blockchain.domain.BtcTrade;
import com.ruoyi.blockchain.service.IBtcTradeService;
import com.ruoyi.common.core.text.Convert;

/**
 * BTC交易记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-01-02
 */
@Service
public class BtcTradeServiceImpl implements IBtcTradeService 
{
    @Autowired
    private BtcTradeMapper btcTradeMapper;

    /**
     * 查询BTC交易记录
     * 
     * @param txHash BTC交易记录主键
     * @return BTC交易记录
     */
    @Override
    public BtcTrade selectBtcTradeByTxHash(String txHash)
    {
        return btcTradeMapper.selectBtcTradeByTxHash(txHash);
    }

    /**
     * 查询BTC交易记录列表
     * 
     * @param btcTrade BTC交易记录
     * @return BTC交易记录
     */
    @Override
    public List<BtcTrade> selectBtcTradeList(BtcTrade btcTrade)
    {
        return btcTradeMapper.selectBtcTradeList(btcTrade);
    }

    /**
     * 新增BTC交易记录
     * 
     * @param btcTrade BTC交易记录
     * @return 结果
     */
    @Override
    public int insertBtcTrade(BtcTrade btcTrade)
    {
        return btcTradeMapper.insertBtcTrade(btcTrade);
    }

    /**
     * 修改BTC交易记录
     * 
     * @param btcTrade BTC交易记录
     * @return 结果
     */
    @Override
    public int updateBtcTrade(BtcTrade btcTrade)
    {
        return btcTradeMapper.updateBtcTrade(btcTrade);
    }

    /**
     * 批量删除BTC交易记录
     * 
     * @param txHashs 需要删除的BTC交易记录主键
     * @return 结果
     */
    @Override
    public int deleteBtcTradeByTxHashs(String txHashs)
    {
        return btcTradeMapper.deleteBtcTradeByTxHashs(Convert.toStrArray(txHashs));
    }

    /**
     * 删除BTC交易记录信息
     * 
     * @param txHash BTC交易记录主键
     * @return 结果
     */
    @Override
    public int deleteBtcTradeByTxHash(String txHash)
    {
        return btcTradeMapper.deleteBtcTradeByTxHash(txHash);
    }
}
