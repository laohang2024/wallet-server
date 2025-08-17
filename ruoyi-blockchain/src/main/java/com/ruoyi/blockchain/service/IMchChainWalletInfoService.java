package com.ruoyi.blockchain.service;

import java.util.List;
import com.ruoyi.blockchain.domain.MchChainWalletInfo;

/**
 * 商户用户钱包Service接口
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
public interface IMchChainWalletInfoService 
{
    /**
     * 查询商户用户钱包
     * 
     * @param id 商户用户钱包主键
     * @return 商户用户钱包
     */
    public MchChainWalletInfo selectMchChainWalletInfoById(String id);

    /**
     * 查询商户用户钱包列表
     * 
     * @param mchChainWalletInfo 商户用户钱包
     * @return 商户用户钱包集合
     */
    public List<MchChainWalletInfo> selectMchChainWalletInfoList(MchChainWalletInfo mchChainWalletInfo);

    /**
     * 新增商户用户钱包
     * 
     * @param mchChainWalletInfo 商户用户钱包
     * @return 结果
     */
    public int insertMchChainWalletInfo(MchChainWalletInfo mchChainWalletInfo);

    /**
     * 修改商户用户钱包
     * 
     * @param mchChainWalletInfo 商户用户钱包
     * @return 结果
     */
    public int updateMchChainWalletInfo(MchChainWalletInfo mchChainWalletInfo);

    /**
     * 批量删除商户用户钱包
     * 
     * @param ids 需要删除的商户用户钱包主键集合
     * @return 结果
     */
    public int deleteMchChainWalletInfoByIds(String ids);

    /**
     * 删除商户用户钱包信息
     * 
     * @param id 商户用户钱包主键
     * @return 结果
     */
    public int deleteMchChainWalletInfoById(String id);
}
