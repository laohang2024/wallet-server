package com.ruoyi.blockchain.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blockchain.mapper.MchChainWalletInfoMapper;
import com.ruoyi.blockchain.domain.MchChainWalletInfo;
import com.ruoyi.blockchain.service.IMchChainWalletInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 商户用户钱包Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
@Service
public class MchChainWalletInfoServiceImpl implements IMchChainWalletInfoService 
{
    @Autowired
    private MchChainWalletInfoMapper mchChainWalletInfoMapper;

    /**
     * 查询商户用户钱包
     * 
     * @param id 商户用户钱包主键
     * @return 商户用户钱包
     */
    @Override
    public MchChainWalletInfo selectMchChainWalletInfoById(String id)
    {
        return mchChainWalletInfoMapper.selectMchChainWalletInfoById(id);
    }

    /**
     * 查询商户用户钱包列表
     * 
     * @param mchChainWalletInfo 商户用户钱包
     * @return 商户用户钱包
     */
    @Override
    public List<MchChainWalletInfo> selectMchChainWalletInfoList(MchChainWalletInfo mchChainWalletInfo)
    {
        return mchChainWalletInfoMapper.selectMchChainWalletInfoList(mchChainWalletInfo);
    }

    /**
     * 新增商户用户钱包
     * 
     * @param mchChainWalletInfo 商户用户钱包
     * @return 结果
     */
    @Override
    public int insertMchChainWalletInfo(MchChainWalletInfo mchChainWalletInfo)
    {
        return mchChainWalletInfoMapper.insertMchChainWalletInfo(mchChainWalletInfo);
    }

    /**
     * 修改商户用户钱包
     * 
     * @param mchChainWalletInfo 商户用户钱包
     * @return 结果
     */
    @Override
    public int updateMchChainWalletInfo(MchChainWalletInfo mchChainWalletInfo)
    {
        return mchChainWalletInfoMapper.updateMchChainWalletInfo(mchChainWalletInfo);
    }

    /**
     * 批量删除商户用户钱包
     * 
     * @param ids 需要删除的商户用户钱包主键
     * @return 结果
     */
    @Override
    public int deleteMchChainWalletInfoByIds(String ids)
    {
        return mchChainWalletInfoMapper.deleteMchChainWalletInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商户用户钱包信息
     * 
     * @param id 商户用户钱包主键
     * @return 结果
     */
    @Override
    public int deleteMchChainWalletInfoById(String id)
    {
        return mchChainWalletInfoMapper.deleteMchChainWalletInfoById(id);
    }
}
