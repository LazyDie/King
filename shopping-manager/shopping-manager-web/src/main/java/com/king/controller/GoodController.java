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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.king.common.pojo.Msg;
import com.king.common.utils.FileUpdate;
import com.king.pojo.Goods;
import com.king.service.GoodService;

@RestController
public class GoodController {

	@Autowired
	private GoodService goodService;
	
	/**
	 * 添加商品
	 * @param goods
	 * @param file
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/goods/add",method=RequestMethod.POST)
	public Msg addGoods(Goods goods){
		if(goods.getPath()==null||goods.getPath()=="")
			goods.setPath("NoImage.png");
		int result = goodService.addGoods(goods);
		if(result != 0)
			return Msg.success();
		return Msg.fail();
	}
/*	@RequestMapping(value="/goods/add",method=RequestMethod.POST)
	public Msg addGoods(Goods goods,MultipartFile file,HttpServletRequest request) throws IOException{
		//上传图片
				String pictureName;
				if(file!=null) {
					pictureName =FileUpdate.updatePicture(file, request);
					goods.setPath(pictureName);
				 }
				int result = goodService.addGoods(goods);
				if(result != 0)
					return Msg.success();
				return Msg.fail();
	}*/
	
	/**
	 * 上传图片
	 */
	@RequestMapping(value="/goods/picture",method=RequestMethod.POST)
	public Msg fileAdd(MultipartFile file,HttpServletRequest request) throws IOException{
		String pictureName;
		if(file!=null) {
			pictureName =FileUpdate.updatePicture(file, request);
			return Msg.success().add("path", pictureName);
		 }
		else {
			return Msg.fail();
		}
		
	}
	
	/**
	 * 查询所有商品
	 */
	@RequestMapping(value="/goods/selectAll",method=RequestMethod.GET)
	public Msg selectAll(@RequestParam(value="pn",defaultValue="1")Integer pn){
		//分页查询pageHelper分页插件
		//在查询之前只需要调用，插入页码以及分页每页的大小
		PageHelper.startPage(pn, 5);
		//startPage后面紧跟的一个查询就是分页查询
		List<Goods> results = goodService.selectAll();
		//通过PageInfo包装最后查询出来的数据，只需要将PageInfo交给页面即可
		//封装了详细的页面信息，包括查询出来的数据
		PageInfo<Goods> page = new PageInfo<>(results,5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 根据id查询记录
	 */
	@RequestMapping(value="/goods/one/{id}",method=RequestMethod.GET)
	public Msg selectOne(@PathVariable("id") Integer id){
		Goods result = goodService.selectById(id);
		if(result!=null)
			return Msg.success().add("entend", result);
		else {
			return Msg.fail();
		}
	}
}
