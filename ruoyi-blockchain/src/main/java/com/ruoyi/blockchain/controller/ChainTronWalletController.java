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
import com.ruoyi.blockchain.domain.ChainTronWallet;
import com.ruoyi.blockchain.service.IChainTronWalletService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * TRON钱包Controller
 * 
 * @author ruoyi
 * @date 2025-08-16
 */
@Controller
@RequestMapping("/blockchain/tronWallet")
public class ChainTronWalletController extends BaseController
{
    private String prefix = "blockchain/tronWallet";

    @Autowired
    private IChainTronWalletService chainTronWalletService;

    @RequiresPermissions("blockchain:tronWallet:view")
    @GetMapping()
    public String tronWallet()
    {
        return prefix + "/tronWallet";
    }

    /**
     * 查询TRON钱包列表
     */
    @RequiresPermissions("blockchain:tronWallet:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ChainTronWallet chainTronWallet)
    {
        startPage();
        List<ChainTronWallet> list = chainTronWalletService.selectChainTronWalletList(chainTronWallet);
        return getDataTable(list);
    }

    /**
     * 导出TRON钱包列表
     */
    @RequiresPermissions("blockchain:tronWallet:export")
    @Log(title = "TRON钱包", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ChainTronWallet chainTronWallet)
    {
        List<ChainTronWallet> list = chainTronWalletService.selectChainTronWalletList(chainTronWallet);
        ExcelUtil<ChainTronWallet> util = new ExcelUtil<ChainTronWallet>(ChainTronWallet.class);
        return util.exportExcel(list, "TRON钱包数据");
    }

    /**
     * 新增TRON钱包
     */
    @RequiresPermissions("blockchain:tronWallet:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存TRON钱包
     */
    @RequiresPermissions("blockchain:tronWallet:add")
    @Log(title = "TRON钱包", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ChainTronWallet chainTronWallet)
    {
        return toAjax(chainTronWalletService.insertChainTronWallet(chainTronWallet));
    }

    /**
     * 修改TRON钱包
     */
    @RequiresPermissions("blockchain:tronWallet:edit")
    @GetMapping("/edit/{address}")
    public String edit(@PathVariable("address") String address, ModelMap mmap)
    {
        ChainTronWallet chainTronWallet = chainTronWalletService.selectChainTronWalletByAddress(address);
        mmap.put("chainTronWallet", chainTronWallet);
        return prefix + "/edit";
    }

    /**
     * 修改保存TRON钱包
     */
    @RequiresPermissions("blockchain:tronWallet:edit")
    @Log(title = "TRON钱包", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ChainTronWallet chainTronWallet)
    {
        return toAjax(chainTronWalletService.updateChainTronWallet(chainTronWallet));
    }

    /**
     * 删除TRON钱包
     */
    @RequiresPermissions("blockchain:tronWallet:remove")
    @Log(title = "TRON钱包", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(chainTronWalletService.deleteChainTronWalletByAddresss(ids));
    }
}
