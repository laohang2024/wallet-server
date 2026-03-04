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
import com.ruoyi.blockchain.domain.BtcTrade;
import com.ruoyi.blockchain.service.IBtcTradeService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * BTC交易记录Controller
 * 
 * @author ruoyi
 * @date 2026-03-05
 */
@Controller
@RequestMapping("/blockchain/btcTrade")
public class BtcTradeController extends BaseController
{
    private String prefix = "blockchain/btcTrade";

    @Autowired
    private IBtcTradeService btcTradeService;

    @RequiresPermissions("blockchain:btcTrade:view")
    @GetMapping()
    public String btcTrade()
    {
        return prefix + "/btcTrade";
    }

    /**
     * 查询BTC交易记录列表
     */
    @RequiresPermissions("blockchain:btcTrade:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BtcTrade btcTrade)
    {
        startPage();
        List<BtcTrade> list = btcTradeService.selectBtcTradeList(btcTrade);
        return getDataTable(list);
    }

    /**
     * 导出BTC交易记录列表
     */
    @RequiresPermissions("blockchain:btcTrade:export")
    @Log(title = "BTC交易记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BtcTrade btcTrade)
    {
        List<BtcTrade> list = btcTradeService.selectBtcTradeList(btcTrade);
        ExcelUtil<BtcTrade> util = new ExcelUtil<BtcTrade>(BtcTrade.class);
        return util.exportExcel(list, "BTC交易记录数据");
    }

    /**
     * 新增BTC交易记录
     */
    @RequiresPermissions("blockchain:btcTrade:add")
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存BTC交易记录
     */
    @RequiresPermissions("blockchain:btcTrade:add")
    @Log(title = "BTC交易记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BtcTrade btcTrade)
    {
        return toAjax(btcTradeService.insertBtcTrade(btcTrade));
    }

    /**
     * 修改BTC交易记录
     */
    @RequiresPermissions("blockchain:btcTrade:edit")
    @GetMapping("/edit/{txHash}")
    public String edit(@PathVariable("txHash") String txHash, ModelMap mmap)
    {
        BtcTrade btcTrade = btcTradeService.selectBtcTradeByTxHash(txHash);
        mmap.put("btcTrade", btcTrade);
        return prefix + "/edit";
    }

    /**
     * 修改保存BTC交易记录
     */
    @RequiresPermissions("blockchain:btcTrade:edit")
    @Log(title = "BTC交易记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BtcTrade btcTrade)
    {
        return toAjax(btcTradeService.updateBtcTrade(btcTrade));
    }

    /**
     * 删除BTC交易记录
     */
    @RequiresPermissions("blockchain:btcTrade:remove")
    @Log(title = "BTC交易记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(btcTradeService.deleteBtcTradeByTxHashs(ids));
    }
}
