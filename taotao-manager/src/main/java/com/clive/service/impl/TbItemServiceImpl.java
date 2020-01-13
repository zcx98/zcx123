package com.clive.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clive.bean.TbItem;
import com.clive.common.LayuiTableResult;
import com.clive.common.TaotaoResult;
import com.clive.mapper.TbItemMapper;
import com.clive.service.TbItemService;

@Service
public class TbItemServiceImpl implements TbItemService {
	@Autowired
	private TbItemMapper tbItemMapper;

	@Override
	public TbItem findTbItemById(Long tbItemId) {
		TbItem tbItem = tbItemMapper.findTbItemById(tbItemId);
		return tbItem;
	}

	@Override
	public List<TbItem> findTbItemAll() {
		List<TbItem> tbItems = tbItemMapper.findTbItemAll();
		return tbItems;
	}

	@Override
	public LayuiTableResult findItemByPage(Integer page, Integer limit) {
		LayuiTableResult result = new LayuiTableResult();
		result.setCode(0);
		result.setMsg("");
		result.setCount(tbItemMapper.findTbItemCount());
		List<TbItem> data = tbItemMapper.findItemByPage(((page - 1) * limit), limit);
		result.setData(data);
		return result;
	}

	@Override
	public TaotaoResult deleteItemByIds(List<TbItem> items) {
		List<Long> ids = new ArrayList<Long>();
		for (TbItem tbItem : items) {
			ids.add(tbItem.getId());
		}
		int count = tbItemMapper.deleteItemByIds(ids);
		if (count > 0) {
			return TaotaoResult.ok();
		}
		return TaotaoResult.build(500, "删除有误");
	}

	@Override
	public TaotaoResult updateItems(List<TbItem> items, Integer type, Date date) {
		List<Long> ids = new ArrayList<Long>();
		for (TbItem tbItem : items) {
			ids.add(tbItem.getId());
		}
		int count = tbItemMapper.updateItemByIds(ids, type, date);
		if (count > 0 && type == 1) {
			return TaotaoResult.build(200, "商品上架成功");
		} else if (count > 0 && type == 2) {
			return TaotaoResult.build(200, "商品下架成功");
		} else if (count > 0 && type == 3) {
			return TaotaoResult.build(200, "商品删除成功");
		}
		return TaotaoResult.build(500, "操作有误");
	}

	@Override
	public LayuiTableResult search(String title, String sellPoint, Long price, Integer page, Integer limit) {
		LayuiTableResult result = new LayuiTableResult();
		result.setCode(0);
		result.setMsg("");
		result.setCount(tbItemMapper.findSearchCount(title, sellPoint, price));
		List<TbItem> data = tbItemMapper.findSearchByPage(title, sellPoint, price, ((page - 1) * limit), limit);
		result.setData(data);
		return result;
	}

}
