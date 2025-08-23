package com.ruoyi.blockchain.mapper;

import java.util.List;
import com.ruoyi.blockchain.domain.UsdtTrade;

/**
 * USDT交易记录Mapper接口
 * 
 * @author ruoyi
 * @date 2025-08-23
 */
public interface UsdtTradeMapper 
{
    /**
     * 查询USDT交易记录
     * 
     * @param txHash USDT交易记录主键
     * @return USDT交易记录
     */
    public UsdtTrade selectUsdtTradeByTxHash(String txHash);

    /**
     * 查询USDT交易记录列表
     * 
     * @param usdtTrade USDT交易记录
     * @return USDT交易记录集合
     */
    public List<UsdtTrade> selectUsdtTradeList(UsdtTrade usdtTrade);

    /**
     * 新增USDT交易记录
     * 
     * @param usdtTrade USDT交易记录
     * @return 结果
     */
    public int insertUsdtTrade(UsdtTrade usdtTrade);

    /**
     * 修改USDT交易记录
     * 
     * @param usdtTrade USDT交易记录
     * @return 结果
     */
    public int updateUsdtTrade(UsdtTrade usdtTrade);

    /**
     * 删除USDT交易记录
     * 
     * @param txHash USDT交易记录主键
     * @return 结果
     */
    public int deleteUsdtTradeByTxHash(String txHash);

    /**
     * 批量删除USDT交易记录
     * 
     * @param txHashs 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUsdtTradeByTxHashs(String[] txHashs);
}
