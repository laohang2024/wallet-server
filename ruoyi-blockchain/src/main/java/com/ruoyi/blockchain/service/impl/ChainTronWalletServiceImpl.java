package com.ruoyi.blockchain.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blockchain.mapper.ChainTronWalletMapper;
import com.ruoyi.blockchain.domain.ChainTronWallet;
import com.ruoyi.blockchain.service.IChainTronWalletService;
import com.ruoyi.common.core.text.Convert;

/**
 * TRON钱包Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
@Service
public class ChainTronWalletServiceImpl implements IChainTronWalletService 
{
    @Autowired
    private ChainTronWalletMapper chainTronWalletMapper;

    /**
     * 查询TRON钱包
     * 
     * @param address TRON钱包主键
     * @return TRON钱包
     */
    @Override
    public ChainTronWallet selectChainTronWalletByAddress(String address)
    {
        return chainTronWalletMapper.selectChainTronWalletByAddress(address);
    }

    /**
     * 查询TRON钱包列表
     * 
     * @param chainTronWallet TRON钱包
     * @return TRON钱包
     */
    @Override
    public List<ChainTronWallet> selectChainTronWalletList(ChainTronWallet chainTronWallet)
    {
        return chainTronWalletMapper.selectChainTronWalletList(chainTronWallet);
    }

    /**
     * 新增TRON钱包
     * 
     * @param chainTronWallet TRON钱包
     * @return 结果
     */
    @Override
    public int insertChainTronWallet(ChainTronWallet chainTronWallet)
    {
        return chainTronWalletMapper.insertChainTronWallet(chainTronWallet);
    }

    /**
     * 修改TRON钱包
     * 
     * @param chainTronWallet TRON钱包
     * @return 结果
     */
    @Override
    public int updateChainTronWallet(ChainTronWallet chainTronWallet)
    {
        return chainTronWalletMapper.updateChainTronWallet(chainTronWallet);
    }

    /**
     * 批量删除TRON钱包
     * 
     * @param addresss 需要删除的TRON钱包主键
     * @return 结果
     */
    @Override
    public int deleteChainTronWalletByAddresss(String addresss)
    {
        return chainTronWalletMapper.deleteChainTronWalletByAddresss(Convert.toStrArray(addresss));
    }

    /**
     * 删除TRON钱包信息
     * 
     * @param address TRON钱包主键
     * @return 结果
     */
    @Override
    public int deleteChainTronWalletByAddress(String address)
    {
        return chainTronWalletMapper.deleteChainTronWalletByAddress(address);
    }


    @Override
    public List<ChainTronWallet> selectChainTronWalletListByAddresses(String[] addresses)
    {
        return chainTronWalletMapper.selectChainTronWalletListByAddresses(addresses);
    }
}
