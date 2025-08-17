package com.ruoyi.web.controller.blockchain.controller;


import com.ruoyi.blockchain.domain.MchChainWalletInfo;
import com.ruoyi.blockchain.service.InnerBlockchainServer;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/inner/blockchain")
public class InnerBlockchainController extends BaseController {

    @Resource
    InnerBlockchainServer innerBlockchainServer;

    @PostMapping("/generateAddress")
    @ResponseBody
    public Object generateAddress(MchChainWalletInfo mchChainWalletInfo) {
        String mchNo = mchChainWalletInfo.getMchNo();
        if (StringUtils.isEmpty(mchNo)) {
            return AjaxResult.error("商户号不能为空");
        }
        String userId = mchChainWalletInfo.getUserId();
        if (StringUtils.isEmpty(userId)) {
            return AjaxResult.error("用户ID不能为空");
        }
        return AjaxResult.success(innerBlockchainServer.generateBAccountInfo(mchNo, userId));
    }

    @PostMapping("/getUserAccountInfo")
    @ResponseBody
    public Object getUserAccountInfo() {
        return AjaxResult.success();
    }

}
