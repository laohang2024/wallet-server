package com.ruoyi.blockchain.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * ETH钱包对象 chain_eth_wallet
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
public class ChainEthWallet extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 钱包地址 */
    @Excel(name = "钱包地址")
    private String address;

    /** 以太币余额 */
    @Excel(name = "以太币余额")
    private BigDecimal ethBalance;

    /** 数据库更新时间 */
    private Date dbUpdateTime;

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setEthBalance(BigDecimal ethBalance) 
    {
        this.ethBalance = ethBalance;
    }

    public BigDecimal getEthBalance() 
    {
        return ethBalance;
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
            .append("address", getAddress())
            .append("ethBalance", getEthBalance())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("dbUpdateTime", getDbUpdateTime())
            .toString();
    }
}
