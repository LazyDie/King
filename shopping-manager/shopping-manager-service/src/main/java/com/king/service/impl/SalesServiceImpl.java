package com.king.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.king.mapper.SalesMapper;
import com.king.pojo.Sales;
import com.king.service.SalesService;

@Service
public class SalesServiceImpl implements SalesService{

	@Autowired
	private SalesMapper salesMapper;

	@Override
	public List<Sales> selectAllSales() {
		// TODO Auto-generated method stub
		return salesMapper.selectAll();
	}

	@Override
	public Integer addSales(Sales sales) {
		// TODO Auto-generated method stub
		return salesMapper.insert(sales);
	}

	@Override
	public List<Sales> selectXiaoLiang() {
		// TODO Auto-generated method stub
		return salesMapper.selectXiaoLiang();
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return salesMapper.deleteByPrimaryKey(id);
	}


	
}
