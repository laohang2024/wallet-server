package com.ruoyi.blockchain.service;

import java.util.List;
import com.ruoyi.blockchain.domain.ChainBtcWallet;
import com.ruoyi.blockchain.domain.ChainEthWallet;

/**
 * BTC钱包Service接口
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
public interface IChainBtcWalletService 
{
    /**
     * 查询BTC钱包
     * 
     * @param address BTC钱包主键
     * @return BTC钱包
     */
    public ChainBtcWallet selectChainBtcWalletByAddress(String address);

    /**
     * 查询BTC钱包列表
     * 
     * @param chainBtcWallet BTC钱包
     * @return BTC钱包集合
     */
    public List<ChainBtcWallet> selectChainBtcWalletList(ChainBtcWallet chainBtcWallet);

    /**
     * 新增BTC钱包
     * 
     * @param chainBtcWallet BTC钱包
     * @return 结果
     */
    public int insertChainBtcWallet(ChainBtcWallet chainBtcWallet);

    /**
     * 修改BTC钱包
     * 
     * @param chainBtcWallet BTC钱包
     * @return 结果
     */
    public int updateChainBtcWallet(ChainBtcWallet chainBtcWallet);

    /**
     * 批量删除BTC钱包
     * 
     * @param addresss 需要删除的BTC钱包主键集合
     * @return 结果
     */
    public int deleteChainBtcWalletByAddresss(String addresss);

    /**
     * 删除BTC钱包信息
     * 
     * @param address BTC钱包主键
     * @return 结果
     */
    public int deleteChainBtcWalletByAddress(String address);


    public List<ChainBtcWallet> selectChainBtcWalletListByAddresses(String[] addresses);

}
