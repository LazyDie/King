package com.king.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.king.mapper.CommodityMapper;
import com.king.pojo.Commodity;
import com.king.service.CommodityService;

@Service
public class CommodityServiceImpl implements CommodityService{

	@Autowired
	private CommodityMapper commodityMapper;
	/**
	 * 添加商品
	 */
	@Override
	public Integer addCommodity(Commodity commodity) {
		// TODO Auto-generated method stub
		int result = commodityMapper.insert(commodity);
		return result;
	}
	/**
	 * 查询所有商品
	 */
	@Override
	public List<Commodity> selectCommodityAll() {
		List<Commodity> results = commodityMapper.selectAll();
		return results;
	}
	@Override
	public Commodity selectByPrimaryKey(Integer id) {
		Commodity commodity = commodityMapper.selectByPrimaryKey(id);
		return commodity;
	}

	
	
	
	
}
