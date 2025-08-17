package com.ruoyi.blockchain.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * BTC钱包对象 chain_btc_wallet
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
public class ChainBtcWallet extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 钱包地址 */
    @Excel(name = "钱包地址")
    private String address;

    /** 比特币余额 */
    @Excel(name = "比特币余额")
    private BigDecimal btcBalance;

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

    public void setBtcBalance(BigDecimal btcBalance) 
    {
        this.btcBalance = btcBalance;
    }

    public BigDecimal getBtcBalance() 
    {
        return btcBalance;
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
            .append("btcBalance", getBtcBalance())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("dbUpdateTime", getDbUpdateTime())
            .toString();
    }
}
