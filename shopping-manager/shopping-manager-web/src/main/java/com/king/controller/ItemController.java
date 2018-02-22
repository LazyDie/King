package com.king.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.king.common.pojo.EUDataGridResult;
import com.king.pojo.TbItem;
import com.king.service.ItemService;

@RestController
public class ItemController {
	@Autowired
	private ItemService itemService;

	
	@RequestMapping("/item/{itemId}")
	public TbItem getItemById(@PathVariable Long itemId){
		TbItem item = itemService.getItemById(itemId);
		return item;
	}
	
	
	//商品列表分页查询
	@RequestMapping("/item/list")
	public EUDataGridResult getItemList(Integer page, Integer rows) {
		EUDataGridResult result = itemService.getItemList(page, rows);
		return result;
	}
}
