package com.ruoyi.blockchain.conf;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "btc")
public class BtcConfig {

    private String jsonRpcUrl;

    private boolean monitorSwitch;

    public String getJsonRpcUrl() {
        return jsonRpcUrl;
    }

    public void setJsonRpcUrl(String jsonRpcUrl) {
        this.jsonRpcUrl = jsonRpcUrl;
    }

    public boolean isMonitorSwitch() {
        return monitorSwitch;
    }

    public void setMonitorSwitch(boolean monitorSwitch) {
        this.monitorSwitch = monitorSwitch;
    }
}
