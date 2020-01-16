package com.clive.service;

import java.util.Date;
import java.util.List;

import com.clive.bean.TbItem;
import com.clive.common.LayuiTableResult;
import com.clive.common.TaotaoResult;

public interface TbItemService {
	/**
	 * 根据商品id查询商品指定信息
	 * 
	 * @param tbItemId
	 *            商品id
	 * @return 指定商品id的商品信息
	 */
	TbItem findTbItemById(Long tbItemId);

	/**
	 * 查询所有商品信息
	 * 
	 * @return 一个集合 包含所有商品信息
	 */
	List<TbItem> findTbItemAll();

	/**
	 * 分页显示商品信息
	 * 
	 * @param page
	 *            当前页 需要计算索引的
	 * @param limit
	 *            每一页显示的条数
	 * @return layui指定的json格式
	 */
	LayuiTableResult findItemByPage(Integer page, Integer limit);

	TaotaoResult deleteItemByIds(List<TbItem> items);

	/**
	 * 上架下架方法和删除方法 但是 不是真的删除数据 而是修改商品的状态
	 * 
	 * @param items
	 * @param type
	 *            1代表上架 2下架 3删除
	 * @return
	 */
	TaotaoResult updateItems(List<TbItem> items, Integer type, Date date);

	/**
	 * 根据商品名称 或者 商品卖点 或者 商品价格查询商品信息
	 * 
	 * @param title
	 * @param sellPoint
	 * @param price
	 * @return
	 */
	LayuiTableResult search(String title, Integer priceMin, Integer priceMax, Long cId, Integer page, Integer limit);

}
