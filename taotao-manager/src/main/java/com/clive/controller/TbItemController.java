package com.clive.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clive.bean.TbItem;
import com.clive.common.LayuiTableResult;
import com.clive.common.TaotaoResult;
import com.clive.service.TbItemService;

@Controller
@RequestMapping("/item")
public class TbItemController {
	@Autowired
	private TbItemService tbItemService;

	@RequestMapping("/{itemId}")
	@ResponseBody
	public TbItem findTbItemById(@PathVariable Long itemId) {
		TbItem tbItem = tbItemService.findTbItemById(itemId);
		return tbItem;
	}

	@RequestMapping("/showItem")
	public String findTbItemAll(Model model) {
		List<TbItem> tbItemAll = tbItemService.findTbItemAll();
		model.addAttribute("tbItemAll", tbItemAll);
		return "showItem";
	}

	@RequestMapping("/showItemPage")
	@ResponseBody
	public LayuiTableResult findItemByPage(Integer page, Integer limit) {
		LayuiTableResult result = tbItemService.findItemByPage(page, limit);
		return result;
	}

	@RequestMapping("/itemDelete")
	@ResponseBody
	public TaotaoResult deleteItemById(@RequestBody List<TbItem> items) {
		Date date = new Date();
		TaotaoResult result = tbItemService.updateItems(items, 3, date);
		return result;
	}

	@RequestMapping("/commodityUpperShelves")
	@ResponseBody
	public TaotaoResult commodityUpperShelves(@RequestBody List<TbItem> items) {
		Date date = new Date();
		TaotaoResult result = tbItemService.updateItems(items, 1, date);
		return result;
	}

	@RequestMapping("/commodityLowerShelves")
	@ResponseBody
	public TaotaoResult commodityLowerShelves(@RequestBody List<TbItem> items) {
		Date date = new Date();
		TaotaoResult result = tbItemService.updateItems(items, 2, date);
		return result;
	}

	@RequestMapping("/search")
	@ResponseBody
	public LayuiTableResult search(String title, String sellPoint, Long price, Integer page, Integer limit)
			throws UnsupportedEncodingException {
		title = new String(title.getBytes("ISO-8859-1"), "UTF-8");
		sellPoint = new String(sellPoint.getBytes("ISO-8859-1"), "UTF-8");
		LayuiTableResult result = tbItemService.search(title, sellPoint, price, page, limit);
		return result;
	}
}
