package com.king.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.king.common.pojo.Msg;
import com.king.common.utils.CommonUtil;
import com.king.pojo.Consumer;
import com.king.pojo.Goods;
import com.king.pojo.Supplier;
import com.king.service.ConsumerService;

@Controller
public class ConsumerController {

	@Autowired
	private ConsumerService consumerService;
	
	/**
	 * 查询所有客户
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/consumer/all",method=RequestMethod.GET)
	public Msg selectAll(@RequestParam(value="pn",defaultValue="1")Integer pn){
		PageHelper.startPage(pn, 5);
		List<Consumer> results = consumerService.selectAll();
		System.out.println(results.get(0).getCreatetime());
		PageInfo<Consumer> page = new PageInfo<>(results,5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 查询客户类型
	 */
	@ResponseBody
	@RequestMapping(value="/consumer/type",method=RequestMethod.GET)
	public List<Integer> selectConsumerType(){
		List<Consumer> results = consumerService.selectAll();
		int linshou = 0;
		int pifa = 0;
		for(Consumer consumer : results){
			if(CommonUtil.isNotEmpty(consumer.getType())){
				if("批发".equals(consumer.getType()))
					pifa ++;
				else 
					linshou ++;
			}
			
		}
		List<Integer> type = new ArrayList<>();
		type.add(pifa);
		type.add(linshou);
		return type;
	}
	/**
	 * 添加客户
	 */
	@ResponseBody
	@RequestMapping(value="/consumer/add",method=RequestMethod.POST)
	public Msg addConsumer(Consumer consumer){
		Integer result = consumerService.consumerAdd(consumer);
		if(CommonUtil.isNotEmpty(result))
			return Msg.success();
		else {
			return Msg.fail();
		}
	}	
	/**
	 * 根据id查询客户信息
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/consumer/one/{id}",method=RequestMethod.GET)
	public Msg selectById(@PathVariable("id")Integer id){
		Consumer result = consumerService.selectById(id);
		if(CommonUtil.isNotEmpty(result))
			return Msg.success().add("entend", result);
		else {
			return Msg.fail();
		}
	}
	/**
	 * 更新客户信息
	 */
	@ResponseBody
	@RequestMapping(value="consumer/update/{id}",method=RequestMethod.POST)
	public Msg updateById(Consumer consumer){
		Integer resutl = consumerService.updateConsumer(consumer);
		if(CommonUtil.isNotEmpty(resutl)){
			return Msg.success();
		}else{
			return Msg.fail();
		}
		
	}
	
	/**
	 * 删除客户信息
	 */
	@ResponseBody
	@RequestMapping(value="/consumer/delete/{id}",method=RequestMethod.GET)
	public Msg deleteById(@PathVariable("id") Integer id){
		Integer result = consumerService.deleteById(id);
		if(CommonUtil.isNotEmpty(result)){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	//查询功能
	/*@ResponseBody
	@RequestMapping(value="/consumer/queryByName",method=RequestMethod.POST)
	public PageInfo<?> queryByName(@RequestParam(value="pn",defaultValue="1")Integer pn,
									@RequestParam("name") String name){
			PageHelper.startPage(pn, 5);
			List<Consumer> result = new ArrayList<>();
			if(CommonUtil.isEmpty(name))
				result = consumerService.selectAll();
			else
				result = consumerService.SelectByName(name);
			PageInfo<Consumer> page = new PageInfo<>(result, 5);
			return page;
	}*/
	@ResponseBody
	@RequestMapping(value="/consumer/queryByName",method=RequestMethod.POST)
	public Msg consumerQueryName(@RequestParam(value="pn",defaultValue="1")Integer pn,
								@RequestParam("name") String name){
		PageHelper.startPage(pn, 5);
		List<Consumer> result = new ArrayList<>();
		if(CommonUtil.isEmpty(name))
			result = consumerService.selectAll();
		else
			result = consumerService.SelectByName(name);
		PageInfo<Consumer> page = new PageInfo<>(result, 5);
		return Msg.success().add("pageInfo", page);
	}
}
