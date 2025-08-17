package com.ruoyi.blockchain.mapper;

import java.util.List;
import com.ruoyi.blockchain.domain.ChainTronWallet;

/**
 * TRON钱包Mapper接口
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
public interface ChainTronWalletMapper 
{
    /**
     * 查询TRON钱包
     * 
     * @param address TRON钱包主键
     * @return TRON钱包
     */
    public ChainTronWallet selectChainTronWalletByAddress(String address);

    /**
     * 查询TRON钱包列表
     * 
     * @param chainTronWallet TRON钱包
     * @return TRON钱包集合
     */
    public List<ChainTronWallet> selectChainTronWalletList(ChainTronWallet chainTronWallet);

    /**
     * 新增TRON钱包
     * 
     * @param chainTronWallet TRON钱包
     * @return 结果
     */
    public int insertChainTronWallet(ChainTronWallet chainTronWallet);

    /**
     * 修改TRON钱包
     * 
     * @param chainTronWallet TRON钱包
     * @return 结果
     */
    public int updateChainTronWallet(ChainTronWallet chainTronWallet);

    /**
     * 删除TRON钱包
     * 
     * @param address TRON钱包主键
     * @return 结果
     */
    public int deleteChainTronWalletByAddress(String address);

    /**
     * 批量删除TRON钱包
     * 
     * @param addresss 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChainTronWalletByAddresss(String[] addresss);
}
