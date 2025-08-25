package com.ruoyi.blockchain.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * USDT交易记录对象 usdt_trade
 * 
 * @author ruoyi
 * @date 2025-08-23
 */
public class UsdtTrade extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 交易哈希 */
    @Excel(name = "交易哈希")
    private String txHash;

    /** 发送者地址 */
    @Excel(name = "发送者地址")
    private String fromAddress;

    /** 接收者地址 */
    @Excel(name = "接收者地址")
    private String toAddress;

    /** 交易金额 */
    @Excel(name = "交易金额")
    private BigDecimal amount;

    /** 合约地址 */
    @Excel(name = "合约地址")
    private String contractAddress;

    /** 交易时间 */
    @Excel(name = "交易时间")
    private Long txTime;

    /** 块ID */
    @Excel(name = "块ID")
    private Long blockNum;

    /** 是否已通知 0-未通知 1-已通知 */
    @Excel(name = "是否已通知 0-未通知 1-已通知")
    private byte isNotify;

    public Integer getNotifyCnt() {
        return notifyCnt;
    }

    public void setNotifyCnt(Integer notifyCnt) {
        this.notifyCnt = notifyCnt;
    }

    private Integer notifyCnt;

    public void setTxHash(String txHash) 
    {
        this.txHash = txHash;
    }

    public String getTxHash() 
    {
        return txHash;
    }

    public void setFromAddress(String fromAddress) 
    {
        this.fromAddress = fromAddress;
    }

    public String getFromAddress() 
    {
        return fromAddress;
    }

    public void setToAddress(String toAddress) 
    {
        this.toAddress = toAddress;
    }

    public String getToAddress() 
    {
        return toAddress;
    }

    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }

    public void setContractAddress(String contractAddress) 
    {
        this.contractAddress = contractAddress;
    }

    public String getContractAddress() 
    {
        return contractAddress;
    }

    public void setTxTime(Long txTime) 
    {
        this.txTime = txTime;
    }

    public Long getTxTime() 
    {
        return txTime;
    }

    public void setBlockNum(Long blockNum) 
    {
        this.blockNum = blockNum;
    }

    public Long getBlockNum() 
    {
        return blockNum;
    }

    public void setIsNotify(byte isNotify)
    {
        this.isNotify = isNotify;
    }

    public byte getIsNotify()
    {
        return isNotify;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("txHash", getTxHash())
            .append("fromAddress", getFromAddress())
            .append("toAddress", getToAddress())
            .append("amount", getAmount())
            .append("contractAddress", getContractAddress())
            .append("txTime", getTxTime())
            .append("blockNum", getBlockNum())
            .append("isNotify", getIsNotify())
            .toString();
    }
}
