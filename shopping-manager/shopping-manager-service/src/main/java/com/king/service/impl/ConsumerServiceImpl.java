package com.king.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.king.mapper.ConsumerMapper;
import com.king.pojo.Consumer;
import com.king.service.ConsumerService;

@Service
public class ConsumerServiceImpl implements ConsumerService{

	@Autowired
	private ConsumerMapper consumerMapper;

	@Override
	public List<Consumer> selectAll() {
		// TODO Auto-generated method stub
		return consumerMapper.selectAll();
	}

	@Override
	public Integer consumerAdd(Consumer consumer) {
		// TODO Auto-generated method stub
		return consumerMapper.insert(consumer);
	}

	@Override
	public Consumer selectById(Integer id) {
		// TODO Auto-generated method stub
		return consumerMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer updateConsumer(Consumer consumer) {
		// TODO Auto-generated method stub
		return consumerMapper.updateByPrimaryKey(consumer);
	}

	@Override
	public Integer deleteById(Integer id) {
		// TODO Auto-generated method stub
		return consumerMapper.deleteByPrimaryKey(id);
	}
	
	
	
	
}
