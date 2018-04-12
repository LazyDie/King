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
import com.king.pojo.Consumer;
import com.king.pojo.Goods;
import com.king.pojo.Storage;
import com.king.service.GoodService;
import com.king.service.StorageService;
import com.king.vo.StrogeVo;

@RestController
public class StorageController {

	@Autowired
	private StorageService storageService;

	@Autowired
	private GoodService goodService;

	/**
	 * 商品入库操作
	 * @param strogeVo
	 * @return
	 */
	@Transactional
	@RequestMapping(value="/goods/ruku/{id}",method=RequestMethod.POST)
	public Msg goodsRuKu(StrogeVo strogeVo){
		
		Goods goods = goodService.selectById(strogeVo.getId());
		if(CommonUtil.isNotEmpty(goods.getNumber())){
			goods.setNumber(goods.getNumber()+strogeVo.getNumber());
		}else {
			goods.setNumber(strogeVo.getNumber());
		}
		Integer result = goodService.updateGoods(goods);	
		
		Storage storage = new Storage();
		storage.setName(strogeVo.getName());
		storage.setNumber(strogeVo.getNumber());
		storage.setSname(strogeVo.getSupplier());
		storage.setMoney(strogeVo.getPprice());
		storage.setTotalmoney(strogeVo.getNumber()*strogeVo.getPprice());
		storage.setPath(strogeVo.getPath());
		
		Integer result1 = storageService.addStorge(storage);
		
		return Msg.success();
	}
	/**
	 * 查询所有入库记录
	 */
	
	@RequestMapping(value="/storage/selectAll",method=RequestMethod.GET)
	public Msg selectAll(@RequestParam(value="pn",defaultValue="1")Integer pn){
		PageHelper.startPage(pn, 5);
		List<Storage> results = storageService.selectAll();
		PageInfo<Storage> page = new PageInfo<>(results,5);
		return Msg.success().add("pageInfo", page);
	}
	
	
}
