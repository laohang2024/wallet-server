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
import com.ruoyi.blockchain.domain.ChainEthWallet;
import com.ruoyi.blockchain.service.IChainEthWalletService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * ETH钱包Controller
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
@Controller
@RequestMapping("/blockchain/ethWattle")
public class ChainEthWalletController extends BaseController
{
    private String prefix = "blockchain/ethWattle";

    @Autowired
    private IChainEthWalletService chainEthWalletService;

    @RequiresPermissions("blockchain:ethWattle:view")
    @GetMapping()
    public String ethWattle()
    {
        return prefix + "/ethWattle";
    }

    /**
     * 查询ETH钱包列表
     */
    @RequiresPermissions("blockchain:ethWattle:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ChainEthWallet chainEthWallet)
    {
        startPage();
        List<ChainEthWallet> list = chainEthWalletService.selectChainEthWalletList(chainEthWallet);
        return getDataTable(list);
    }

    /**
     * 导出ETH钱包列表
     */
    @RequiresPermissions("blockchain:ethWattle:export")
    @Log(title = "ETH钱包", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ChainEthWallet chainEthWallet)
    {
        List<ChainEthWallet> list = chainEthWalletService.selectChainEthWalletList(chainEthWallet);
        ExcelUtil<ChainEthWallet> util = new ExcelUtil<ChainEthWallet>(ChainEthWallet.class);
        return util.exportExcel(list, "ETH钱包数据");
    }

    /**
     * 新增ETH钱包
     */
    @RequiresPermissions("blockchain:ethWattle:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存ETH钱包
     */
    @RequiresPermissions("blockchain:ethWattle:add")
    @Log(title = "ETH钱包", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ChainEthWallet chainEthWallet)
    {
        return toAjax(chainEthWalletService.insertChainEthWallet(chainEthWallet));
    }

    /**
     * 修改ETH钱包
     */
    @RequiresPermissions("blockchain:ethWattle:edit")
    @GetMapping("/edit/{address}")
    public String edit(@PathVariable("address") String address, ModelMap mmap)
    {
        ChainEthWallet chainEthWallet = chainEthWalletService.selectChainEthWalletByAddress(address);
        mmap.put("chainEthWallet", chainEthWallet);
        return prefix + "/edit";
    }

    /**
     * 修改保存ETH钱包
     */
    @RequiresPermissions("blockchain:ethWattle:edit")
    @Log(title = "ETH钱包", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ChainEthWallet chainEthWallet)
    {
        return toAjax(chainEthWalletService.updateChainEthWallet(chainEthWallet));
    }

    /**
     * 删除ETH钱包
     */
    @RequiresPermissions("blockchain:ethWattle:remove")
    @Log(title = "ETH钱包", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(chainEthWalletService.deleteChainEthWalletByAddresss(ids));
    }
}
