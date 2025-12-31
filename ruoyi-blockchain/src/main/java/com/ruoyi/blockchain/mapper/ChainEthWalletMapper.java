package com.ruoyi.blockchain.mapper;

import java.util.List;
import com.ruoyi.blockchain.domain.ChainEthWallet;
import com.ruoyi.blockchain.domain.ChainTronWallet;

/**
 * ETH钱包Mapper接口
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
public interface ChainEthWalletMapper 
{
    /**
     * 查询ETH钱包
     * 
     * @param address ETH钱包主键
     * @return ETH钱包
     */
    public ChainEthWallet selectChainEthWalletByAddress(String address);

    /**
     * 查询ETH钱包列表
     * 
     * @param chainEthWallet ETH钱包
     * @return ETH钱包集合
     */
    public List<ChainEthWallet> selectChainEthWalletList(ChainEthWallet chainEthWallet);

    /**
     * 新增ETH钱包
     * 
     * @param chainEthWallet ETH钱包
     * @return 结果
     */
    public int insertChainEthWallet(ChainEthWallet chainEthWallet);

    /**
     * 修改ETH钱包
     * 
     * @param chainEthWallet ETH钱包
     * @return 结果
     */
    public int updateChainEthWallet(ChainEthWallet chainEthWallet);

    /**
     * 删除ETH钱包
     * 
     * @param address ETH钱包主键
     * @return 结果
     */
    public int deleteChainEthWalletByAddress(String address);

    /**
     * 批量删除ETH钱包
     * 
     * @param addresses 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChainEthWalletByAddresses(String[] addresses);

    public List<ChainEthWallet> selectChainEthWalletListByAddresses(String[] addresses);
}
