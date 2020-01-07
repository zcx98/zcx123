package com.clive.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clive.bean.TbItem;
import com.clive.common.LayuiTableResult;
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
}
