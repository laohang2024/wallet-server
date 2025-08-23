package com.ruoyi.blockchain.util;

import cn.hutool.core.util.StrUtil;

/**
 * 进制转换
 *
 * @version 1.0
 * @time 2022-03-25 16:10
 */
public class BaseConvert {

    /**
     * 转16进制补零
     *
     * @param value 10 进制
     * @return 16
     */
    public static String toBase16StringWithZero(long value) {
        String blockIdStart = Long.toHexString(value);
        String zeros = StrUtil.repeat('0',16 - blockIdStart.length());
        return zeros + blockIdStart;
    }

    /**
     * 将16进制字符串转换为10进制的Long
     *
     * @param hexString 16进制字符串
     * @return 10进制的Long值
     */
    public static long hexStringToLong(String hexString) {
        // 去掉可能的前缀 "0x" 或 "0X"
        if (hexString.startsWith("0x") || hexString.startsWith("0X")) {
            hexString = hexString.substring(2);
        }
        // 使用 Long.parseLong 将16进制字符串转换为Long
        return Long.parseLong(hexString, 16);
    }

    public static void main(String[] args) {


        System.out.println(BaseConvert.toBase16StringWithZero(10));
    }
}
