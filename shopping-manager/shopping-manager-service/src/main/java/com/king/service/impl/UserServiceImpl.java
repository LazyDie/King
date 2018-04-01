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
	 * 查询用户名是否存在
	 */
	@Override
	public String selectByUserName(String userName) {
		// TODO Auto-generated method stub
		String pwdString = userMapper.selectByUserName(userName);
		return pwdString;
	}

	
	
}
