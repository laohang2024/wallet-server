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
import com.ruoyi.blockchain.domain.UsdtTrade;
import com.ruoyi.blockchain.service.IUsdtTradeService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * USDT交易记录Controller
 * 
 * @author ruoyi
 * @date 2026-03-05
 */
@Controller
@RequestMapping("/blockchain/usdtTrade")
public class UsdtTradeController extends BaseController
{
    private String prefix = "blockchain/usdtTrade";

    @Autowired
    private IUsdtTradeService usdtTradeService;

    @RequiresPermissions("blockchain:usdtTrade:view")
    @GetMapping()
    public String usdtTrade()
    {
        return prefix + "/usdtTrade";
    }

    /**
     * 查询USDT交易记录列表
     */
    @RequiresPermissions("blockchain:usdtTrade:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UsdtTrade usdtTrade)
    {
        startPage();
        List<UsdtTrade> list = usdtTradeService.selectUsdtTradeList(usdtTrade);
        return getDataTable(list);
    }

    /**
     * 导出USDT交易记录列表
     */
    @RequiresPermissions("blockchain:usdtTrade:export")
    @Log(title = "USDT交易记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UsdtTrade usdtTrade)
    {
        List<UsdtTrade> list = usdtTradeService.selectUsdtTradeList(usdtTrade);
        ExcelUtil<UsdtTrade> util = new ExcelUtil<UsdtTrade>(UsdtTrade.class);
        return util.exportExcel(list, "USDT交易记录数据");
    }

    /**
     * 新增USDT交易记录
     */
    @RequiresPermissions("blockchain:usdtTrade:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存USDT交易记录
     */
    @RequiresPermissions("blockchain:usdtTrade:add")
    @Log(title = "USDT交易记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UsdtTrade usdtTrade)
    {
        return toAjax(usdtTradeService.insertUsdtTrade(usdtTrade));
    }

    /**
     * 修改USDT交易记录
     */
    @RequiresPermissions("blockchain:usdtTrade:edit")
    @GetMapping("/edit/{txHash}")
    public String edit(@PathVariable("txHash") String txHash, ModelMap mmap)
    {
        UsdtTrade usdtTrade = usdtTradeService.selectUsdtTradeByTxHash(txHash);
        mmap.put("usdtTrade", usdtTrade);
        return prefix + "/edit";
    }

    /**
     * 修改保存USDT交易记录
     */
    @RequiresPermissions("blockchain:usdtTrade:edit")
    @Log(title = "USDT交易记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UsdtTrade usdtTrade)
    {
        return toAjax(usdtTradeService.updateUsdtTrade(usdtTrade));
    }

    /**
     * 删除USDT交易记录
     */
    @RequiresPermissions("blockchain:usdtTrade:remove")
    @Log(title = "USDT交易记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(usdtTradeService.deleteUsdtTradeByTxHashs(ids));
    }
}
