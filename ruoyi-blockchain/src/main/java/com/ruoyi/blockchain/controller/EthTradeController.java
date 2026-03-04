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
import com.ruoyi.blockchain.domain.EthTrade;
import com.ruoyi.blockchain.service.IEthTradeService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * ETH交易记录Controller
 * 
 * @author ruoyi
 * @date 2026-03-05
 */
@Controller
@RequestMapping("/blockchain/ethTrade")
public class EthTradeController extends BaseController
{
    private String prefix = "blockchain/ethTrade";

    @Autowired
    private IEthTradeService ethTradeService;

    @RequiresPermissions("blockchain:ethTrade:view")
    @GetMapping()
    public String ethTrade()
    {
        return prefix + "/ethTrade";
    }

    /**
     * 查询ETH交易记录列表
     */
    @RequiresPermissions("blockchain:ethTrade:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(EthTrade ethTrade)
    {
        startPage();
        List<EthTrade> list = ethTradeService.selectEthTradeList(ethTrade);
        return getDataTable(list);
    }

    /**
     * 导出ETH交易记录列表
     */
    @RequiresPermissions("blockchain:ethTrade:export")
    @Log(title = "ETH交易记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(EthTrade ethTrade)
    {
        List<EthTrade> list = ethTradeService.selectEthTradeList(ethTrade);
        ExcelUtil<EthTrade> util = new ExcelUtil<EthTrade>(EthTrade.class);
        return util.exportExcel(list, "ETH交易记录数据");
    }

    /**
     * 新增ETH交易记录
     */
    @RequiresPermissions("blockchain:ethTrade:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存ETH交易记录
     */
    @RequiresPermissions("blockchain:ethTrade:add")
    @Log(title = "ETH交易记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(EthTrade ethTrade)
    {
        return toAjax(ethTradeService.insertEthTrade(ethTrade));
    }

    /**
     * 修改ETH交易记录
     */
    @RequiresPermissions("blockchain:ethTrade:edit")
    @GetMapping("/edit/{txHash}")
    public String edit(@PathVariable("txHash") String txHash, ModelMap mmap)
    {
        EthTrade ethTrade = ethTradeService.selectEthTradeByTxHash(txHash);
        mmap.put("ethTrade", ethTrade);
        return prefix + "/edit";
    }

    /**
     * 修改保存ETH交易记录
     */
    @RequiresPermissions("blockchain:ethTrade:edit")
    @Log(title = "ETH交易记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(EthTrade ethTrade)
    {
        return toAjax(ethTradeService.updateEthTrade(ethTrade));
    }

    /**
     * 删除ETH交易记录
     */
    @RequiresPermissions("blockchain:ethTrade:remove")
    @Log(title = "ETH交易记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ethTradeService.deleteEthTradeByTxHashs(ids));
    }
}
