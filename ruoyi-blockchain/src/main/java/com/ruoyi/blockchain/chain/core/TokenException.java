package com.ruoyi.blockchain.chain.core;

public class TokenException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    public TokenException(String message) {
        super(message);
    }

    public TokenException(String message, Exception e) {
        super(message, e);
    }

}
