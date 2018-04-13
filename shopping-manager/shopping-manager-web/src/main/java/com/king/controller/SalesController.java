package com.king.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.king.common.pojo.Msg;
import com.king.common.utils.CommonUtil;
import com.king.pojo.Goods;
import com.king.pojo.Sales;
import com.king.pojo.Storage;
import com.king.service.GoodService;
import com.king.service.SalesService;
import com.king.vo.SalesVo;
import com.king.vo.StrogeVo;

@RestController
public class SalesController {

	@Autowired
	private SalesService salesService;
	
	@Autowired
	private GoodService goodService;
	
	
	/**
	 * 商品出库操作
	 * @param strogeVo
	 * @return
	 */
	@Transactional
	@RequestMapping(value="/goods/chuku/{id}",method=RequestMethod.POST)
	public Msg goodsChuKu(SalesVo salesVo){
		
		Goods goods = goodService.selectById(salesVo.getId());
		if(CommonUtil.isNotEmpty(goods.getNumber())){
			goods.setNumber(goods.getNumber()-salesVo.getNumber());
		}else {
			return Msg.fail();
		}
		Integer result = goodService.updateGoods(goods);	
		
		Sales sales = new Sales();
		sales.setName(salesVo.getName());
		sales.setNumber(salesVo.getNumber());
		sales.setCname(salesVo.getConsumer());
		sales.setMoney(salesVo.getRprice());
		sales.setTotalmoney(salesVo.getNumber()*salesVo.getRprice());
		sales.setPath(salesVo.getPath());
		
		Integer result1 = salesService.addSales(sales);
		
		return Msg.success();
	}
	/**
	 * 查询所有出库记录
	 */
	
	@RequestMapping(value="/sales/selectAll",method=RequestMethod.GET)
	public Msg selectAll(@RequestParam(value="pn",defaultValue="1")Integer pn){
		PageHelper.startPage(pn, 5);
		List<Sales> results = salesService.selectAllSales();
		PageInfo<Sales> page = new PageInfo<>(results,5);
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 查询每种商品的销售情况
	 * @return
	 */
	
	@RequestMapping(value="/sale/xiaoliang",method=RequestMethod.GET)
	public Msg selectXiaoLiang(){
		List<Sales> results = salesService.selectXiaoLiang();
		return Msg.success().add("xiaoliang", results);
	}
	
}
