package com.king.controller;

import java.awt.image.BufferedImage;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.king.common.pojo.Msg;
import com.king.common.utils.CommonUtil;
import com.king.common.utils.ShiroUtils;
import com.king.common.utils.VerifyCode;
import com.king.pojo.User;
import com.king.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private UserService userService;
	/**
	 * 验证码
	 * 
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping("/sys/vcode")
	public void vcode(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		VerifyCode vc = new VerifyCode();
		BufferedImage image = vc.getImage();// 获取一次性验证码图片
		// 该方法必须在getImage()方法之后来调用
		System.out.println("验证码图片上的文本:"+vc.getText());//获取图片上的文本
		// 把文本保存到session中，为验证做准备
		HttpSession session = req.getSession(); 
		session.setAttribute("vcode", vc.getText());
		//保存到shiro session
		//自己把SessionID保存在cookie中  
	    Cookie cookie=new Cookie("JSESSIONID", session.getId());  
	    //设置cookie保存时间  
	    cookie.setMaxAge(60*20);  
	    //被创建的cookie返回浏览器  
	    resp.addCookie(cookie);  
		//ShiroUtils.setSessionAttribute("kaptcha", vc.getText());
		VerifyCode.output(image, resp.getOutputStream());// 把图片写到指定流中
	}
	/**
	 * 登陆验证
	 */
	@RequestMapping(value="/sys/login",method=RequestMethod.POST)
	@ResponseBody
	public Msg login(HttpServletRequest req, String username, String password, String vcode) {
		/*if(StringUtils.isEmpty(vcode)||StringUtils.isEmpty(username)||StringUtils.isEmpty(password)){
			throw new RRException("参数不能为空");
		}*/
		
		String kaptcha = (String) req.getSession().getAttribute("vcode");
		kaptcha = kaptcha.toLowerCase();
		if(!vcode.toLowerCase().equals(kaptcha)){
			return Msg.fail().add("key", "验证码错误");
		}
		User user = new User();
		user.setUsername(username);
		user.setPwd(password);
		user = userService.selectByNameAndPwd(user);
		if(CommonUtil.isEmpty(user))
			return Msg.fail().add("key", "用户名或密码不存在");
		else{
			
			//user = userService.selectByname(username);
			System.out.println(user.getName());
			System.out.println(user.getPath());
			System.out.println(user.getId());
			HttpSession session = req.getSession();
			session.setAttribute("id", user.getId());
			if(!CommonUtil.isEmpty(user.getName())){
				session.setAttribute("name", user.getName());
			}else {
				session.setAttribute("name", "匿名用户");
			}
			if(!CommonUtil.isEmpty(user.getPath())){
				session.setAttribute("path", user.getPath());
			}else{
				session.setAttribute("path", "NoImage.png");
			}
			return Msg.success();
		}
	}
	//====================================基本资料====================================
	@RequestMapping(value="/basicInfo/shuaxin",method=RequestMethod.GET)
	public ModelAndView basicRefresh(HttpServletRequest req){
		System.out.println("刷新成功");
		int id = (int) req.getSession().getAttribute("id");
		System.out.println(id);
		User user = userService.selectById(id);
		System.out.println(user.getName());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("basicInfo1");
		mv.addObject("user",user);
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="/basicInfo/zhongzhuan",method=RequestMethod.GET)
	public String zhongZhuan(){
		return "success";
	}
	@RequestMapping(value="/basicInfo/basicInfoEdit",method=RequestMethod.POST)
	public ModelAndView zhongZhuan1(HttpServletRequest req){
		int id = (int) req.getSession().getAttribute("id");
		User user = userService.selectById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("basicInfoEdit");
		mv.addObject("user",user);
		return mv;
	}
	
	@RequestMapping(value="/basicInfo/xiugai",method=RequestMethod.POST)
	public ModelAndView xiuGai(HttpServletRequest req){
		int id = (int) req.getSession().getAttribute("id");
		User user = userService.selectById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("basicInfoEdit");
		mv.addObject("user",user);
		return mv;
	}
	
}
