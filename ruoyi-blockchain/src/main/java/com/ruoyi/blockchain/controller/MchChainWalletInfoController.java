package com.ruoyi.blockchain.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.blockchain.domain.MchChainWalletInfo;
import com.ruoyi.blockchain.service.IMchChainWalletInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商户用户钱包Controller
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
@Controller
@RequestMapping("/blockchain/mchChainWattle")
public class MchChainWalletInfoController extends BaseController
{
    private String prefix = "blockchain/mchChainWattle";

    @Autowired
    private IMchChainWalletInfoService mchChainWalletInfoService;

    @RequiresPermissions("blockchain:mchChainWattle:view")
    @GetMapping()
    public String mchChainWattle()
    {
        return prefix + "/mchChainWattle";
    }

    /**
     * 查询商户用户钱包列表
     */
    @RequiresPermissions("blockchain:mchChainWattle:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MchChainWalletInfo mchChainWalletInfo)
    {
        startPage();
        List<MchChainWalletInfo> list = mchChainWalletInfoService.selectMchChainWalletInfoList(mchChainWalletInfo);
        return getDataTable(list);
    }

    /**
     * 导出商户用户钱包列表
     */
    @RequiresPermissions("blockchain:mchChainWattle:export")
    @Log(title = "商户用户钱包", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MchChainWalletInfo mchChainWalletInfo)
    {
        List<MchChainWalletInfo> list = mchChainWalletInfoService.selectMchChainWalletInfoList(mchChainWalletInfo);
        ExcelUtil<MchChainWalletInfo> util = new ExcelUtil<MchChainWalletInfo>(MchChainWalletInfo.class);
        return util.exportExcel(list, "商户用户钱包数据");
    }

    /**
     * 新增商户用户钱包
     */
    @RequiresPermissions("blockchain:mchChainWattle:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存商户用户钱包
     */
    @RequiresPermissions("blockchain:mchChainWattle:add")
    @Log(title = "商户用户钱包", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MchChainWalletInfo mchChainWalletInfo)
    {
        return toAjax(mchChainWalletInfoService.insertMchChainWalletInfo(mchChainWalletInfo));
    }

    /**
     * 修改商户用户钱包
     */
    @RequiresPermissions("blockchain:mchChainWattle:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap mmap)
    {
        MchChainWalletInfo mchChainWalletInfo = mchChainWalletInfoService.selectMchChainWalletInfoById(id);
        mmap.put("mchChainWalletInfo", mchChainWalletInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存商户用户钱包
     */
    @RequiresPermissions("blockchain:mchChainWattle:edit")
    @Log(title = "商户用户钱包", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MchChainWalletInfo mchChainWalletInfo)
    {
        return toAjax(mchChainWalletInfoService.updateMchChainWalletInfo(mchChainWalletInfo));
    }

    /**
     * 删除商户用户钱包
     */
    @RequiresPermissions("blockchain:mchChainWattle:remove")
    @Log(title = "商户用户钱包", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mchChainWalletInfoService.deleteMchChainWalletInfoByIds(ids));
    }
}
