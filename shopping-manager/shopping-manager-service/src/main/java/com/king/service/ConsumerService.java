package com.king.service;

import java.util.List;

import com.king.pojo.Consumer;

public interface ConsumerService {

	/**
	 * 查询所有记录
	 * @return
	 */
	List<Consumer> selectAll();
	/**
	 * 新增记录
	 */
	Integer	consumerAdd(Consumer consumer);
	/**
	 * 通过id
	 * 查询用户信息
	 */
	Consumer selectById(Integer id);
	/**
	 * 更新用户信息
	 */
	Integer updateConsumer(Consumer consumer);
	/**
	 * 删除用户信息
	 */
	Integer deleteById(Integer id);
	
	List<Consumer> SelectByName(String name);
}
