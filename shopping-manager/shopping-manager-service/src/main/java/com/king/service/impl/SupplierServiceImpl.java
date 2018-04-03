package com.king.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.king.mapper.SupplierMapper;
import com.king.pojo.Supplier;
import com.king.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService{

	@Autowired
	private SupplierMapper supplierMapper;
	
	/**
	 * 查询所有批发商
	 */
	@Override
	public List<Supplier> selectAll() {
		return supplierMapper.selectAll();
	}

	@Override
	public String supplierAdd(Supplier supplier) {
		 supplierMapper.insert(supplier);
		 return "success";
	}

	@Override
	public Supplier selectById(Integer id) {
		// TODO Auto-generated method stub
		return supplierMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		return supplierMapper.updateByPrimaryKey(supplier);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return supplierMapper.deleteByPrimaryKey(id);
	}

	
	
	
}
