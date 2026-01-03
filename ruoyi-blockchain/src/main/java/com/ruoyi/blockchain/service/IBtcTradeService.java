package com.ruoyi.blockchain.service;

import java.util.List;
import com.ruoyi.blockchain.domain.BtcTrade;

/**
 * BTC交易记录Service接口
 * 
 * @author ruoyi
 * @date 2026-01-02
 */
public interface IBtcTradeService 
{
    /**
     * 查询BTC交易记录
     * 
     * @param txHash BTC交易记录主键
     * @return BTC交易记录
     */
    public BtcTrade selectBtcTradeByTxHash(String txHash);

    /**
     * 查询BTC交易记录列表
     * 
     * @param btcTrade BTC交易记录
     * @return BTC交易记录集合
     */
    public List<BtcTrade> selectBtcTradeList(BtcTrade btcTrade);

    /**
     * 新增BTC交易记录
     * 
     * @param btcTrade BTC交易记录
     * @return 结果
     */
    public int insertBtcTrade(BtcTrade btcTrade);

    /**
     * 修改BTC交易记录
     * 
     * @param btcTrade BTC交易记录
     * @return 结果
     */
    public int updateBtcTrade(BtcTrade btcTrade);

    /**
     * 批量删除BTC交易记录
     * 
     * @param txHashs 需要删除的BTC交易记录主键集合
     * @return 结果
     */
    public int deleteBtcTradeByTxHashs(String txHashs);

    /**
     * 删除BTC交易记录信息
     * 
     * @param txHash BTC交易记录主键
     * @return 结果
     */
    public int deleteBtcTradeByTxHash(String txHash);
}
