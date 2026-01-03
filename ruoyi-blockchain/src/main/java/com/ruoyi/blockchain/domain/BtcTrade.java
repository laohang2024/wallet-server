package com.ruoyi.blockchain.domain;

import java.math.BigDecimal;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * BTC交易记录对象 btc_trade
 *
 * @author ruoyi
 * @date 2026-01-02
 */
public class BtcTrade extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 交易哈希
     */
    private String txHash;

    /**
     * 发送者地址
     */
    @Excel(name = "发送者地址")
    private String fromAddress;

    /**
     * 接收者地址
     */
    @Excel(name = "接收者地址")
    private String toAddress;

    /**
     * 交易金额
     */
    @Excel(name = "交易金额")
    private BigDecimal amount;

    /**
     * 交易时间
     */
    @Excel(name = "交易时间")
    private Long txTime;

    /**
     * 块ID
     */
    @Excel(name = "块ID")
    private Long blockNum;

    /**
     * 是否已通知 0-未通知 1-已通知
     */
    @Excel(name = "是否已通知 0-未通知 1-已通知")
    private byte isNotify;

    /**
     * 回调次数
     */
    @Excel(name = "回调次数")
    private Integer notifyCnt;

    public void setTxHash(String txHash) {
        this.txHash = txHash;
    }

    public String getTxHash() {
        return txHash;
    }

    public void setFromAddress(String fromAddress) {
        this.fromAddress = fromAddress;
    }

    public String getFromAddress() {
        return fromAddress;
    }

    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }

    public String getToAddress() {
        return toAddress;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setTxTime(Long txTime) {
        this.txTime = txTime;
    }

    public Long getTxTime() {
        return txTime;
    }

    public void setBlockNum(Long blockNum) {
        this.blockNum = blockNum;
    }

    public Long getBlockNum() {
        return blockNum;
    }

    public void setIsNotify(byte isNotify) {
        this.isNotify = isNotify;
    }

    public byte getIsNotify() {
        return isNotify;
    }

    public void setNotifyCnt(Integer notifyCnt) {
        this.notifyCnt = notifyCnt;
    }

    public Integer getNotifyCnt() {
        return notifyCnt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("txHash", getTxHash())
                .append("fromAddress", getFromAddress())
                .append("toAddress", getToAddress())
                .append("amount", getAmount())
                .append("txTime", getTxTime())
                .append("blockNum", getBlockNum())
                .append("isNotify", getIsNotify())
                .append("notifyCnt", getNotifyCnt())
                .toString();
    }
}
