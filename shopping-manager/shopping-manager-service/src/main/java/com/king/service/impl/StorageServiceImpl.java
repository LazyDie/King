package com.king.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.king.mapper.StorageMapper;
import com.king.pojo.Storage;
import com.king.service.StorageService;

@Service
public class StorageServiceImpl implements StorageService{

	@Autowired
	private StorageMapper storageMapper;
	@Override
	public Integer addStorge(Storage storage) {
		// TODO Auto-generated method stub
		return storageMapper.insert(storage);
	}
	@Override
	public List<Storage> selectAll() {
		// TODO Auto-generated method stub
		return storageMapper.selectAll();
	}
	@Override
	public List<Storage> selectXiaoLiang() {
		// TODO Auto-generated method stub
		return storageMapper.selectXiaoLiang();
	}
	@Override
	public int deleteByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return storageMapper.deleteByPrimaryKey(id);
	}

	
}
