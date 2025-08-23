package com.ruoyi.blockchain.mapper;

import java.util.List;
import com.ruoyi.blockchain.domain.ChainMonitorInfo;

/**
 * 监听进度信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-08-23
 */
public interface ChainMonitorInfoMapper 
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
     * 删除监听进度信息
     * 
     * @param chainType 监听进度信息主键
     * @return 结果
     */
    public int deleteChainMonitorInfoByChainType(String chainType);

    /**
     * 批量删除监听进度信息
     * 
     * @param chainTypes 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChainMonitorInfoByChainTypes(String[] chainTypes);

    public int addBlockNum(String chainType);
}
