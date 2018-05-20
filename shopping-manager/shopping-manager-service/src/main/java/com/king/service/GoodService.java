package com.king.service;

import java.util.List;

import com.king.pojo.Goods;

public interface GoodService {

	/**
	 * 添加商品
	 */
	Integer addGoods(Goods goods);
	/**
	 * 查询所有商品
	 */
	List<Goods> selectAll();
	/**
	 * 根据id查询
	 */
	Goods selectById(Integer id);
	
	/**
	 * 更新商品信息
	 */
	Integer updateGoods(Goods goods);
	
	/**
	 * 搜索
	 */
	List<Goods> selectByName(String name);
	
	/**
	 * 删除
	 */
	int deleteByPrimaryKey(Integer id);
}
