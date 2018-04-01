package com.king.service;


import java.util.List;

import com.king.pojo.Commodity;

public interface CommodityService {
	//添加商品
	Integer addCommodity(Commodity commodity);
	//查询所有商品
	List<Commodity> selectCommodityAll();
	//
	Commodity selectByPrimaryKey(Integer id);
}
