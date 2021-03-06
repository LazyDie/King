package com.king.service;

import java.util.List;

import com.king.pojo.Storage;

public interface StorageService {

	/**
	 * 插入入库表
	 * @param storage
	 * @return
	 */
	Integer addStorge(Storage storage);
	/*
	 *查询所有记录 
	 */
	List<Storage> selectAll();
	
	/**
	 * 查询每种商品的销量
	 */
	List<Storage> selectXiaoLiang();
	
	/**
	 * 删除记录
	 */
	int deleteByPrimaryKey(int id);
}
