package com.clive.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clive.common.EchartsResult;
import com.clive.common.ZTreeNodeResult;
import com.clive.service.TbItemCatService;

@Controller
@RequestMapping("/itemCat")
public class TbItemCatController {
	@Autowired
	private TbItemCatService tbItemCatService;

	@RequestMapping("/showZtree")
	@ResponseBody
	public List<ZTreeNodeResult> showZTreeNode(@RequestParam(value = "id", defaultValue = "0") Long parentId) {
		List<ZTreeNodeResult> result = tbItemCatService.findTbItemCatById(parentId);
		return result;
	}

	@RequestMapping("/statisticsItem")
	@ResponseBody
	public List<EchartsResult> showEcharts() {
		List<EchartsResult> results = tbItemCatService.statisticsItem();
		return results;
	}
}
