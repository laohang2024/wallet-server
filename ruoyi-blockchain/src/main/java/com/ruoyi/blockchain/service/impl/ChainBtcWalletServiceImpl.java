package com.ruoyi.blockchain.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blockchain.mapper.ChainBtcWalletMapper;
import com.ruoyi.blockchain.domain.ChainBtcWallet;
import com.ruoyi.blockchain.service.IChainBtcWalletService;
import com.ruoyi.common.core.text.Convert;

/**
 * BTC钱包Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
@Service
public class ChainBtcWalletServiceImpl implements IChainBtcWalletService 
{
    @Autowired
    private ChainBtcWalletMapper chainBtcWalletMapper;

    /**
     * 查询BTC钱包
     * 
     * @param address BTC钱包主键
     * @return BTC钱包
     */
    @Override
    public ChainBtcWallet selectChainBtcWalletByAddress(String address)
    {
        return chainBtcWalletMapper.selectChainBtcWalletByAddress(address);
    }

    /**
     * 查询BTC钱包列表
     * 
     * @param chainBtcWallet BTC钱包
     * @return BTC钱包
     */
    @Override
    public List<ChainBtcWallet> selectChainBtcWalletList(ChainBtcWallet chainBtcWallet)
    {
        return chainBtcWalletMapper.selectChainBtcWalletList(chainBtcWallet);
    }

    /**
     * 新增BTC钱包
     * 
     * @param chainBtcWallet BTC钱包
     * @return 结果
     */
    @Override
    public int insertChainBtcWallet(ChainBtcWallet chainBtcWallet)
    {
        return chainBtcWalletMapper.insertChainBtcWallet(chainBtcWallet);
    }

    /**
     * 修改BTC钱包
     * 
     * @param chainBtcWallet BTC钱包
     * @return 结果
     */
    @Override
    public int updateChainBtcWallet(ChainBtcWallet chainBtcWallet)
    {
        return chainBtcWalletMapper.updateChainBtcWallet(chainBtcWallet);
    }

    /**
     * 批量删除BTC钱包
     * 
     * @param addresss 需要删除的BTC钱包主键
     * @return 结果
     */
    @Override
    public int deleteChainBtcWalletByAddresss(String addresss)
    {
        return chainBtcWalletMapper.deleteChainBtcWalletByAddresss(Convert.toStrArray(addresss));
    }

    /**
     * 删除BTC钱包信息
     * 
     * @param address BTC钱包主键
     * @return 结果
     */
    @Override
    public int deleteChainBtcWalletByAddress(String address)
    {
        return chainBtcWalletMapper.deleteChainBtcWalletByAddress(address);
    }
}
