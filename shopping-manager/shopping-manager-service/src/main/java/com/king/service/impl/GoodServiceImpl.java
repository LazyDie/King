package com.king.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.king.mapper.GoodsMapper;
import com.king.pojo.Goods;
import com.king.service.GoodService;

@Service
public class GoodServiceImpl implements GoodService{

	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public Integer addGoods(Goods goods) {
		return goodsMapper.insert(goods);
	}

	@Override
	public List<Goods> selectAll() {
		return goodsMapper.selectAll();
	}

	@Override
	public Goods selectById(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer updateGoods(Goods goods) {
		// TODO Auto-generated method stub
		return goodsMapper.updateByPrimaryKey(goods);
	}


	
	
}
