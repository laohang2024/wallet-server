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
import com.ruoyi.blockchain.domain.ChainBtcWallet;
import com.ruoyi.blockchain.service.IChainBtcWalletService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * BTC钱包Controller
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
@Controller
@RequestMapping("/blockchain/btcWattle")
public class ChainBtcWalletController extends BaseController
{
    private String prefix = "blockchain/btcWattle";

    @Autowired
    private IChainBtcWalletService chainBtcWalletService;

    @RequiresPermissions("blockchain:btcWattle:view")
    @GetMapping()
    public String btcWattle()
    {
        return prefix + "/btcWattle";
    }

    /**
     * 查询BTC钱包列表
     */
    @RequiresPermissions("blockchain:btcWattle:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ChainBtcWallet chainBtcWallet)
    {
        startPage();
        List<ChainBtcWallet> list = chainBtcWalletService.selectChainBtcWalletList(chainBtcWallet);
        return getDataTable(list);
    }

    /**
     * 导出BTC钱包列表
     */
    @RequiresPermissions("blockchain:btcWattle:export")
    @Log(title = "BTC钱包", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ChainBtcWallet chainBtcWallet)
    {
        List<ChainBtcWallet> list = chainBtcWalletService.selectChainBtcWalletList(chainBtcWallet);
        ExcelUtil<ChainBtcWallet> util = new ExcelUtil<ChainBtcWallet>(ChainBtcWallet.class);
        return util.exportExcel(list, "BTC钱包数据");
    }

    /**
     * 新增BTC钱包
     */
    @RequiresPermissions("blockchain:btcWattle:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存BTC钱包
     */
    @RequiresPermissions("blockchain:btcWattle:add")
    @Log(title = "BTC钱包", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ChainBtcWallet chainBtcWallet)
    {
        return toAjax(chainBtcWalletService.insertChainBtcWallet(chainBtcWallet));
    }

    /**
     * 修改BTC钱包
     */
    @RequiresPermissions("blockchain:btcWattle:edit")
    @GetMapping("/edit/{address}")
    public String edit(@PathVariable("address") String address, ModelMap mmap)
    {
        ChainBtcWallet chainBtcWallet = chainBtcWalletService.selectChainBtcWalletByAddress(address);
        mmap.put("chainBtcWallet", chainBtcWallet);
        return prefix + "/edit";
    }

    /**
     * 修改保存BTC钱包
     */
    @RequiresPermissions("blockchain:btcWattle:edit")
    @Log(title = "BTC钱包", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ChainBtcWallet chainBtcWallet)
    {
        return toAjax(chainBtcWalletService.updateChainBtcWallet(chainBtcWallet));
    }

    /**
     * 删除BTC钱包
     */
    @RequiresPermissions("blockchain:btcWattle:remove")
    @Log(title = "BTC钱包", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(chainBtcWalletService.deleteChainBtcWalletByAddresss(ids));
    }
}
