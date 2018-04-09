package com.king.service;

import com.king.pojo.User;

public interface UserService {

	//注册
	void register(User user);

	//根据用户名和密码查数据
	int selectByNameAndPwd(User user);
}
