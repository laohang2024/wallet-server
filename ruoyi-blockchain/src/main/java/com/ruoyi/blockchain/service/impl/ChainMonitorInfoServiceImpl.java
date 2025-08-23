package com.ruoyi.blockchain.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blockchain.mapper.ChainMonitorInfoMapper;
import com.ruoyi.blockchain.domain.ChainMonitorInfo;
import com.ruoyi.blockchain.service.IChainMonitorInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 监听进度信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-08-23
 */
@Service
public class ChainMonitorInfoServiceImpl implements IChainMonitorInfoService 
{
    @Autowired
    private ChainMonitorInfoMapper chainMonitorInfoMapper;

    /**
     * 查询监听进度信息
     * 
     * @param chainType 监听进度信息主键
     * @return 监听进度信息
     */
    @Override
    public ChainMonitorInfo selectChainMonitorInfoByChainType(String chainType)
    {
        return chainMonitorInfoMapper.selectChainMonitorInfoByChainType(chainType);
    }

    /**
     * 查询监听进度信息列表
     * 
     * @param chainMonitorInfo 监听进度信息
     * @return 监听进度信息
     */
    @Override
    public List<ChainMonitorInfo> selectChainMonitorInfoList(ChainMonitorInfo chainMonitorInfo)
    {
        return chainMonitorInfoMapper.selectChainMonitorInfoList(chainMonitorInfo);
    }

    /**
     * 新增监听进度信息
     * 
     * @param chainMonitorInfo 监听进度信息
     * @return 结果
     */
    @Override
    public int insertChainMonitorInfo(ChainMonitorInfo chainMonitorInfo)
    {
        return chainMonitorInfoMapper.insertChainMonitorInfo(chainMonitorInfo);
    }

    /**
     * 修改监听进度信息
     * 
     * @param chainMonitorInfo 监听进度信息
     * @return 结果
     */
    @Override
    public int updateChainMonitorInfo(ChainMonitorInfo chainMonitorInfo)
    {
        return chainMonitorInfoMapper.updateChainMonitorInfo(chainMonitorInfo);
    }

    /**
     * 批量删除监听进度信息
     * 
     * @param chainTypes 需要删除的监听进度信息主键
     * @return 结果
     */
    @Override
    public int deleteChainMonitorInfoByChainTypes(String chainTypes)
    {
        return chainMonitorInfoMapper.deleteChainMonitorInfoByChainTypes(Convert.toStrArray(chainTypes));
    }

    /**
     * 删除监听进度信息信息
     * 
     * @param chainType 监听进度信息主键
     * @return 结果
     */
    @Override
    public int deleteChainMonitorInfoByChainType(String chainType)
    {
        return chainMonitorInfoMapper.deleteChainMonitorInfoByChainType(chainType);
    }

    @Override
    public int addBlockNum(String chainType) {
        return chainMonitorInfoMapper.addBlockNum(chainType);
    }


}
