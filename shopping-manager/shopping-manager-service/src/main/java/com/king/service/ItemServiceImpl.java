package com.king.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.king.common.pojo.EUDataGridResult;
import com.king.common.pojo.ShoppingResult;
import com.king.common.utils.IDUtils;
import com.king.mapper.TbItemDescMapper;
import com.king.mapper.TbItemMapper;
import com.king.mapper.TbItemParamItemMapper;
import com.king.pojo.TbItemDesc;
import com.king.pojo.TbItemExample.Criteria;
import com.king.pojo.TbItem;
import com.king.pojo.TbItemExample;
import com.king.pojo.TbItemParamItem;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	private TbItemMapper itemMapper;

	@Autowired
	private TbItemDescMapper itemDescMapper;
	
	@Autowired
	private TbItemParamItemMapper itemParamItemMapper;
	
	@Override
	public TbItem getItemById(long itemId) {
		TbItem item = itemMapper.selectByPrimaryKey(itemId);
		return item;
		/*TbItemExample example = new TbItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(itemId);
		List<TbItem> list = itemMapper.selectByExample(example);
		if(list != null && list.size() > 0) {
			TbItem item = list.get(0);
			return item;
		}
		return null;*/
	}

	
	/**
	 * 商品列表查询
	 */
	@Override
	public EUDataGridResult getItemList(int page, int rows) {
		//查询商品列表
		TbItemExample example = new TbItemExample();
		//分页处理
		PageHelper.startPage(page, rows);
		List<TbItem> list = itemMapper.selectByExample(example);
		//创建一个返回对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<TbItem> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}


	@Override
	public ShoppingResult createItem(TbItem item, String desc, String itemParam)
			throws Exception {
		//item补全
				//生成商品ID
				Long itemId = IDUtils.genItemId();
				item.setId(itemId);
				// '商品状态，1-正常，2-下架，3-删除',
				item.setStatus((byte) 1);
				item.setCreated(new Date());
				item.setUpdated(new Date());
				//插入到数据库
				itemMapper.insert(item);
				//添加商品描述信息
				ShoppingResult result = insertItemDesc(itemId, desc);
				if (result.getStatus() != 200) {
					throw new Exception();
				}
				//添加规格参数
				result = insertItemParamItem(itemId, itemParam);
				if (result.getStatus() != 200) {
					throw new Exception();
				}
				return ShoppingResult.ok();
	}
	
	
	
	/**
	 * 添加商品描述
	 * <p>Title: insertItemDesc</p>
	 * <p>Description: </p>
	 * @param desc
	 */
	private ShoppingResult insertItemDesc(Long itemId, String desc) {
		TbItemDesc itemDesc = new TbItemDesc();
		itemDesc.setItemId(itemId);
		itemDesc.setItemDesc(desc);
		itemDesc.setCreated(new Date());
		itemDesc.setUpdated(new Date());
		itemDescMapper.insert(itemDesc);
		return ShoppingResult.ok();
	}
	
	/**
	 * 添加规格参数
	 * <p>Title: insertItemParamItem</p>
	 * <p>Description: </p>
	 * @param itemId
	 * @param itemParam
	 * @return
	 */
	private ShoppingResult insertItemParamItem(Long itemId, String itemParam) {
		//创建一个pojo
		TbItemParamItem itemParamItem = new TbItemParamItem();
		itemParamItem.setItemId(itemId);
		itemParamItem.setParamData(itemParam);
		itemParamItem.setCreated(new Date());
		itemParamItem.setUpdated(new Date());
		//向表中插入数据
		itemParamItemMapper.insert(itemParamItem);
		
		return ShoppingResult.ok();
		
	}
}
