package com.clive.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clive.bean.TbItem;
import com.clive.common.LayuiTableResult;
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

}
