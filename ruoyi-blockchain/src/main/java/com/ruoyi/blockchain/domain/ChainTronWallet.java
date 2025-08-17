package com.ruoyi.blockchain.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * TRON钱包对象 chain_tron_wallet
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
public class ChainTronWallet extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 钱包地址 */
    private String address;

    /** TRX余额 */
    @Excel(name = "TRX余额")
    private BigDecimal trxBalance;

    /** usdt余额 */
    @Excel(name = "usdt余额")
    private BigDecimal usdtBalance;

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

    public void setTrxBalance(BigDecimal trxBalance) 
    {
        this.trxBalance = trxBalance;
    }

    public BigDecimal getTrxBalance() 
    {
        return trxBalance;
    }

    public void setUsdtBalance(BigDecimal usdtBalance) 
    {
        this.usdtBalance = usdtBalance;
    }

    public BigDecimal getUsdtBalance() 
    {
        return usdtBalance;
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
            .append("trxBalance", getTrxBalance())
            .append("usdtBalance", getUsdtBalance())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("dbUpdateTime", getDbUpdateTime())
            .toString();
    }
}
