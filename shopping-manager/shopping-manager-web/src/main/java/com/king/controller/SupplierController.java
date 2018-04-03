package com.king.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	/**
	 * 查询所有供应商
	 * @param pn
	 * @return
	 */
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
	
	/**
	 * 添加供应商
	 * @param supplier
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/supplier/add",method=RequestMethod.POST)
	public String supplierAdd(Supplier supplier){
		System.out.println(supplier.getAddress());
		System.out.println(supplier.getContacter());
		supplierService.supplierAdd(supplier);
		return "success";
	}
	/**
	 * 根据id查询供应商
	 */
	@ResponseBody
	@RequestMapping(value="/supplier/one/{id}",method=RequestMethod.GET)
	public Supplier supplierById(@PathVariable("id") Integer id){
		Supplier result = supplierService.selectById(id);
		return result;
	}
	/**
	 * 更新供应商
	 */
	
	@ResponseBody
	@RequestMapping(value="/supplier/update",method=RequestMethod.POST)
	public String supplierUpdate(Supplier supplier){
		int result = supplierService.updateSupplier(supplier);
		System.out.println(result);
		if(result!=0){
			return "success";
		}else {
			return "false";
		}
	}
	
	
}
