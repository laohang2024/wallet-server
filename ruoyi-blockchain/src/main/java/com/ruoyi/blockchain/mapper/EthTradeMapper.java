package com.ruoyi.blockchain.mapper;

import java.util.List;
import com.ruoyi.blockchain.domain.EthTrade;

/**
 * ETH交易记录Mapper接口
 * 
 * @author ruoyi
 * @date 2025-08-24
 */
public interface EthTradeMapper 
{
    /**
     * 查询ETH交易记录
     * 
     * @param txHash ETH交易记录主键
     * @return ETH交易记录
     */
    public EthTrade selectEthTradeByTxHash(String txHash);

    /**
     * 查询ETH交易记录列表
     * 
     * @param ethTrade ETH交易记录
     * @return ETH交易记录集合
     */
    public List<EthTrade> selectEthTradeList(EthTrade ethTrade);

    /**
     * 新增ETH交易记录
     * 
     * @param ethTrade ETH交易记录
     * @return 结果
     */
    public int insertEthTrade(EthTrade ethTrade);

    /**
     * 修改ETH交易记录
     * 
     * @param ethTrade ETH交易记录
     * @return 结果
     */
    public int updateEthTrade(EthTrade ethTrade);

    /**
     * 删除ETH交易记录
     * 
     * @param txHash ETH交易记录主键
     * @return 结果
     */
    public int deleteEthTradeByTxHash(String txHash);

    /**
     * 批量删除ETH交易记录
     * 
     * @param txHashs 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEthTradeByTxHashs(String[] txHashs);
}
