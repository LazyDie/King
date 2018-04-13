package com.king.service;

import java.util.List;

import com.king.pojo.Sales;

public interface SalesService {

	List<Sales> selectAllSales();
	
	Integer addSales(Sales sales);
	
	List<Sales> selectXiaoLiang();
}
