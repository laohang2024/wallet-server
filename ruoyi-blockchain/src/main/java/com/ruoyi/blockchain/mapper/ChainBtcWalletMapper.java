package com.ruoyi.blockchain.mapper;

import java.util.List;
import com.ruoyi.blockchain.domain.ChainBtcWallet;

/**
 * BTC钱包Mapper接口
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
public interface ChainBtcWalletMapper 
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
     * 删除BTC钱包
     * 
     * @param address BTC钱包主键
     * @return 结果
     */
    public int deleteChainBtcWalletByAddress(String address);

    /**
     * 批量删除BTC钱包
     * 
     * @param addresss 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChainBtcWalletByAddresss(String[] addresss);
}
