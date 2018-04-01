package com.king.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.king.pojo.Supplier;
import com.king.service.SupplierService;

@Controller
public class SupplierController {
	
	@Autowired
	private SupplierService supplierService;
	
	
	@RequestMapping(value="/supplierSelectAll",method=RequestMethod.GET)
	public ModelAndView showSupplierAll(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		ModelAndView mv  = new ModelAndView();
		List<Supplier> result = supplierService.selectAll();
		PageHelper.startPage(pn, 5);
		mv.addObject("resultList",result);
		mv.setViewName("supplierAdd");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/pageHelper",method=RequestMethod.GET)
	public PageInfo<?> shwoAllInfo(@RequestParam(value="pn",defaultValue="1")Integer pn){
		PageHelper.startPage(pn, 5);
		List<Supplier> result = supplierService.selectAll();
		PageInfo<Supplier> page = new PageInfo<>(result, 5);
		return page;
	}
	@ResponseBody
	@RequestMapping(value="/supplier/add",method=RequestMethod.POST)
	public String supplierAdd(Supplier supplier){
		System.out.println(supplier.getAddress());
		System.out.println(supplier.getContacter());
		supplierService.supplierAdd(supplier);
		return "success";
	}
}
