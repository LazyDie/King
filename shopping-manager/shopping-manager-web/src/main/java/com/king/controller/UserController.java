package com.king.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.king.common.utils.FileUpdate;
import com.king.pojo.User;
import com.king.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	

	/**
	 * 注册
	 * @param user
	 * @return
	 */
	@RequestMapping("/zhuce")
	public String register(User user,MultipartFile file,HttpServletRequest request) throws IOException{
		//上传图片
		String pictureName;
		if(file!=null) {
			pictureName =FileUpdate.updatePicture(file, request);
			user.setPath(pictureName);
		 }
		 userService.register(user);
		return "login";
	}
	
	@RequestMapping("/denglu")
	public String login(User user) {
		String pwd = userService.selectByUserName(user.getUsername());
		if(pwd.equals(user.getPwd()))
			return "shouye";
		return "login";
	}
}