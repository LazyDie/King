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
}
