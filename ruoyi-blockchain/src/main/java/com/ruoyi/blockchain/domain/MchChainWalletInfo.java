package com.ruoyi.blockchain.domain;

import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商户用户钱包对象 mch_chain_wallet_info
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
public class MchChainWalletInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 用户标识 */
    private String id;

    /** 商户号 */
    @Excel(name = "商户号")
    private String mchNo;

    /** 用户ID */
    @Excel(name = "用户ID")
    private String userId;

    /** 钱包类型 */
    @Excel(name = "钱包类型")
    private String chainType;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 创建时间 */
    private Long createdTime;

    /** 数据库更新时间 */
    private Date dbUpdateTime;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }

    public void setMchNo(String mchNo) 
    {
        this.mchNo = mchNo;
    }

    public String getMchNo() 
    {
        return mchNo;
    }

    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }

    public void setChainType(String chainType) 
    {
        this.chainType = chainType;
    }

    public String getChainType() 
    {
        return chainType;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setCreatedTime(Long createdTime) 
    {
        this.createdTime = createdTime;
    }

    public Long getCreatedTime() 
    {
        return createdTime;
    }

    public void setDbUpdateTime(Date dbUpdateTime) 
    {
        this.dbUpdateTime = dbUpdateTime;
    }

    public Date getDbUpdateTime() 
    {
        return dbUpdateTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("mchNo", getMchNo())
            .append("userId", getUserId())
            .append("chainType", getChainType())
            .append("address", getAddress())
            .append("createdTime", getCreatedTime())
            .append("dbUpdateTime", getDbUpdateTime())
            .toString();
    }
}
