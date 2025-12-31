package com.ruoyi.blockchain.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blockchain.mapper.ChainEthWalletMapper;
import com.ruoyi.blockchain.domain.ChainEthWallet;
import com.ruoyi.blockchain.service.IChainEthWalletService;
import com.ruoyi.common.core.text.Convert;

/**
 * ETH钱包Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
@Service
public class ChainEthWalletServiceImpl implements IChainEthWalletService 
{
    @Autowired
    private ChainEthWalletMapper chainEthWalletMapper;

    /**
     * 查询ETH钱包
     * 
     * @param address ETH钱包主键
     * @return ETH钱包
     */
    @Override
    public ChainEthWallet selectChainEthWalletByAddress(String address)
    {
        return chainEthWalletMapper.selectChainEthWalletByAddress(address);
    }

    /**
     * 查询ETH钱包列表
     * 
     * @param chainEthWallet ETH钱包
     * @return ETH钱包
     */
    @Override
    public List<ChainEthWallet> selectChainEthWalletList(ChainEthWallet chainEthWallet)
    {
        return chainEthWalletMapper.selectChainEthWalletList(chainEthWallet);
    }

    /**
     * 新增ETH钱包
     * 
     * @param chainEthWallet ETH钱包
     * @return 结果
     */
    @Override
    public int insertChainEthWallet(ChainEthWallet chainEthWallet)
    {
        return chainEthWalletMapper.insertChainEthWallet(chainEthWallet);
    }

    /**
     * 修改ETH钱包
     * 
     * @param chainEthWallet ETH钱包
     * @return 结果
     */
    @Override
    public int updateChainEthWallet(ChainEthWallet chainEthWallet)
    {
        return chainEthWalletMapper.updateChainEthWallet(chainEthWallet);
    }

    /**
     * 批量删除ETH钱包
     * 
     * @param addresss 需要删除的ETH钱包主键
     * @return 结果
     */
    @Override
    public int deleteChainEthWalletByAddresss(String addresss)
    {
        return chainEthWalletMapper.deleteChainEthWalletByAddresses(Convert.toStrArray(addresss));
    }

    /**
     * 删除ETH钱包信息
     * 
     * @param address ETH钱包主键
     * @return 结果
     */
    @Override
    public int deleteChainEthWalletByAddress(String address)
    {
        return chainEthWalletMapper.deleteChainEthWalletByAddress(address);
    }

    @Override
    public List<ChainEthWallet> selectChainEthWalletListByAddresses(String[] addresses) {
        return chainEthWalletMapper.selectChainEthWalletListByAddresses(addresses);
    }


}
