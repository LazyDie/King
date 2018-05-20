package com.king.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.JOptionPane;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.king.common.pojo.Msg;
import com.king.common.utils.CommonUtil;
import com.king.common.utils.DateUnits;
import com.king.common.utils.DateUtil;
import com.king.common.utils.ExPortUtilTools;
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
	
	/**
	 * 删除记录
	 */
	@ResponseBody
	@RequestMapping(value="/goodChuKu/delete/{id}",method=RequestMethod.GET)
	public String supplierDelete(@PathVariable("id") int id){
		int result = salesService.deleteByPrimaryKey(id);
		if(result!=0){
			return "success";
		}else {
			return "false";
		}
	}
	
	/**
	 * 	销售列表导出功能
	 */
	@RequestMapping(value="/sale/export",method=RequestMethod.POST)
	public Msg salesExport(){
		List<Sales> results = salesService.selectAllSales();
		for(Sales sales : results) {
			if(CommonUtil.isNotEmpty(sales.getCreatetime())){
				sales.setTimeString(DateUtil.format(DateUtil.FORMAT_DATE1,sales.getCreatetime()));
			}
		}
        Map<String, Object> para = new HashMap<String, Object>();
        para.put("result", results);
        XLSTransformer transformer = new XLSTransformer();

        //String temppath = "C:\\Users\\Administrator\\Documents\\测试模板.xlsx";D:\专业\java\workspace\001_bishe\Document
        //模板路径，如果用的模板是xlsx，则生成的文件类型也必须为xlsx类型，否则由于格式不对，会打不开文件
        String temppath = "D:\\专业\\java\\workspace\\001_bishe\\Document\\测试模板.xlsx";
        //输出文件路径，以及路径名称
        String exportpath =ExPortUtilTools.getDirPath("销售记录_xls.xls", new File("D:\\专业\\java\\workspace\\001_bishe\\Documents"));
        System.out.println(exportpath);
        try {
            //利用transformXLS来输出文件
            transformer.transformXLS(temppath, para,exportpath);
            //生成文件后提示是否立即打开该文件
            if(JOptionPane.showConfirmDialog(null, "导出成功,是否打开文件？")==0){
            	ExPortUtilTools.openDirFile(exportpath);
            }

        } catch (ParsePropertyException e) {
            System.out.println("失败！");
        } catch (IOException e) {
            System.out.println("失败！");
        }catch (InvalidFormatException e){
         System.out.println(e);
        }
        return Msg.success();
	}
	
}
