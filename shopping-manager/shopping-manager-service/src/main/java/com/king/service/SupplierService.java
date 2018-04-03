package com.king.service;

import java.util.List;

import com.king.pojo.Supplier;

public interface SupplierService {
	/**
	 * 查询所有供应商
	 * @return
	 */
	List<Supplier> selectAll();
	/**
	 * 添加供应商
	 */
	String supplierAdd(Supplier supplier);
	
	/**
	 * 根据id查询供应商
	 */
	Supplier selectById(Integer id);
	/**
	 * 更新供应商信息
	 */
	int updateSupplier(Supplier supplier);
	
	/**
	 * 删除供应商
	 * @param id
	 * @return
	 */
	int deleteByPrimaryKey(Integer id);
}
