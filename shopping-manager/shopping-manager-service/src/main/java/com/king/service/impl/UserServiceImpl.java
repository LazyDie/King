package com.king.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.king.mapper.UserMapper;
import com.king.pojo.User;
import com.king.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper; 
	
	/**
	 * 注册
	 */
	@Override
	public void register(User user) {
               
		userMapper.insert(user);
	}
	/**
	 * 查询用户名和密码相同的用户是否存在
	 */


	@Override
	public User selectByNameAndPwd(User user) {
		// TODO Auto-generated method stub
		return userMapper.selectByNameAndPwd(user);
	}
	//根据用户名查询用户信息
	@Override
	public User selectByname(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectByName(username);
	}
	@Override
	public User selectById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}
	
	

	
	
}
