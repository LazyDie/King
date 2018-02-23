package com.king.service;

import com.king.common.pojo.EUDataGridResult;
import com.king.common.pojo.ShoppingResult;
import com.king.pojo.TbItem;

public interface ItemService {

	//测试
	TbItem getItemById(long id);
	
	//商品列表查询
	EUDataGridResult getItemList(int page, int rows);
	
	ShoppingResult createItem(TbItem item, String desc, String itemParam) throws Exception;
}
