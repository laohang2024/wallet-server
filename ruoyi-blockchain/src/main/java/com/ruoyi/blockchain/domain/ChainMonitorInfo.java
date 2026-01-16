package com.ruoyi.blockchain.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 监听进度信息对象 chain_monitor_info
 *
 * @author ruoyi
 * @date 2025-08-23
 */
public class ChainMonitorInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 链路类型
     */
    private String chainType;

    /**
     * 块num
     */
    @Excel(name = "块num")
    private Long blockNum;

    private Long lastTime;

    public void setChainType(String chainType) {
        this.chainType = chainType;
    }

    public String getChainType() {
        return chainType;
    }

    public void setBlockNum(Long blockNum) {
        this.blockNum = blockNum;
    }

    public Long getBlockNum() {
        return blockNum;
    }

    public void setLastTime(Long lastTime) {
        this.lastTime = lastTime;
    }

    public Long getLastTime() {
        return this.lastTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("chainType", getChainType())
                .append("blockNum", getBlockNum())
                .append("lastTime", getLastTime())
                .toString();
    }
}
