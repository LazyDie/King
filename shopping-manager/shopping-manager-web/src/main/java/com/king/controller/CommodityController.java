package com.king.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.king.common.utils.FileUpdate;
import com.king.pojo.Commodity;
import com.king.service.CommodityService;

@Controller
public class CommodityController {

	@Autowired
	private CommodityService commodityService;
	
	@RequestMapping(value="/addcomdity",method=RequestMethod.POST)
	public String addCommodity(Commodity commodity,MultipartFile file,HttpServletRequest request) throws IOException{
		//上传图片
		String pictureName;
		if(file!=null) {
			pictureName =FileUpdate.updatePicture(file, request);
			commodity.setPath(pictureName);
		 }
		commodity.setCreatetime(new Date());
		int result = commodityService.addCommodity(commodity);
		if(result != 0)
			return "shouye";
		return "error";
	}
	
	@RequestMapping(value="/selectAllCommodity",method=RequestMethod.GET)
	public ModelAndView selectAllCommodity(){
		ModelAndView mv = new ModelAndView();
		List<Commodity> list = commodityService.selectCommodityAll();
		mv.addObject("list",list);
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value="/item/{id}",method=RequestMethod.GET)
	public ModelAndView showDetail(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView();
		Commodity result = commodityService.selectByPrimaryKey(id);
		mv.addObject("result",result);
		mv.setViewName("commodityDetail");
		return mv;
	}
}
