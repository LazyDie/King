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
	public int selectByNameAndPwd(User user) {
		// TODO Auto-generated method stub
		return userMapper.selectByNameAndPwd(user);
	}

	
	
}
