package com.king.service;

import com.king.pojo.User;

public interface UserService {

	//注册
	void register(User user);

	//根据用户名和密码查数据
	User selectByNameAndPwd(User user);
	
	//根据用户名查找用户信息
	User selectByname(String username);
	
	//根据id查询用户信息
	User selectById(Integer id);
}
