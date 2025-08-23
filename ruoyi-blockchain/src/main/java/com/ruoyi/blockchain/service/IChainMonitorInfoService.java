package com.ruoyi.blockchain.service;

import java.util.List;
import com.ruoyi.blockchain.domain.ChainMonitorInfo;

/**
 * 监听进度信息Service接口
 * 
 * @author ruoyi
 * @date 2025-08-23
 */
public interface IChainMonitorInfoService 
{
    /**
     * 查询监听进度信息
     * 
     * @param chainType 监听进度信息主键
     * @return 监听进度信息
     */
    public ChainMonitorInfo selectChainMonitorInfoByChainType(String chainType);

    /**
     * 查询监听进度信息列表
     * 
     * @param chainMonitorInfo 监听进度信息
     * @return 监听进度信息集合
     */
    public List<ChainMonitorInfo> selectChainMonitorInfoList(ChainMonitorInfo chainMonitorInfo);

    /**
     * 新增监听进度信息
     * 
     * @param chainMonitorInfo 监听进度信息
     * @return 结果
     */
    public int insertChainMonitorInfo(ChainMonitorInfo chainMonitorInfo);

    /**
     * 修改监听进度信息
     * 
     * @param chainMonitorInfo 监听进度信息
     * @return 结果
     */
    public int updateChainMonitorInfo(ChainMonitorInfo chainMonitorInfo);

    /**
     * 批量删除监听进度信息
     * 
     * @param chainTypes 需要删除的监听进度信息主键集合
     * @return 结果
     */
    public int deleteChainMonitorInfoByChainTypes(String chainTypes);

    /**
     * 删除监听进度信息信息
     * 
     * @param chainType 监听进度信息主键
     * @return 结果
     */
    public int deleteChainMonitorInfoByChainType(String chainType);

    public int addBlockNum(String chainType);
}
