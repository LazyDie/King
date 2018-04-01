package com.king.service;

import com.king.pojo.User;

public interface UserService {

	//注册
	void register(User user);
	//查询
	String selectByUserName(String userName);
}
