package com.ruoyi.blockchain.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blockchain.mapper.EthTradeMapper;
import com.ruoyi.blockchain.domain.EthTrade;
import com.ruoyi.blockchain.service.IEthTradeService;
import com.ruoyi.common.core.text.Convert;

/**
 * ETH交易记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-08-24
 */
@Service
public class EthTradeServiceImpl implements IEthTradeService 
{
    @Autowired
    private EthTradeMapper ethTradeMapper;

    /**
     * 查询ETH交易记录
     * 
     * @param txHash ETH交易记录主键
     * @return ETH交易记录
     */
    @Override
    public EthTrade selectEthTradeByTxHash(String txHash)
    {
        return ethTradeMapper.selectEthTradeByTxHash(txHash);
    }

    /**
     * 查询ETH交易记录列表
     * 
     * @param ethTrade ETH交易记录
     * @return ETH交易记录
     */
    @Override
    public List<EthTrade> selectEthTradeList(EthTrade ethTrade)
    {
        return ethTradeMapper.selectEthTradeList(ethTrade);
    }

    /**
     * 新增ETH交易记录
     * 
     * @param ethTrade ETH交易记录
     * @return 结果
     */
    @Override
    public int insertEthTrade(EthTrade ethTrade)
    {
        return ethTradeMapper.insertEthTrade(ethTrade);
    }

    /**
     * 修改ETH交易记录
     * 
     * @param ethTrade ETH交易记录
     * @return 结果
     */
    @Override
    public int updateEthTrade(EthTrade ethTrade)
    {
        return ethTradeMapper.updateEthTrade(ethTrade);
    }

    /**
     * 批量删除ETH交易记录
     * 
     * @param txHashs 需要删除的ETH交易记录主键
     * @return 结果
     */
    @Override
    public int deleteEthTradeByTxHashs(String txHashs)
    {
        return ethTradeMapper.deleteEthTradeByTxHashs(Convert.toStrArray(txHashs));
    }

    /**
     * 删除ETH交易记录信息
     * 
     * @param txHash ETH交易记录主键
     * @return 结果
     */
    @Override
    public int deleteEthTradeByTxHash(String txHash)
    {
        return ethTradeMapper.deleteEthTradeByTxHash(txHash);
    }
}
