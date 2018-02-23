package com.king.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.king.common.pojo.EUTreeNode;
import com.king.service.ItemCatService;

@RestController
@RequestMapping("/item/cat")
public class ItemCatController {

	@Autowired
	private ItemCatService itemCatService;
	/*选择类目*/
	@RequestMapping("/list")
	private List<EUTreeNode> getCatList(@RequestParam(value="id",defaultValue="0")Long parentId) {
		List<EUTreeNode> list = itemCatService.getCatList(parentId);
		return list;
	}
}