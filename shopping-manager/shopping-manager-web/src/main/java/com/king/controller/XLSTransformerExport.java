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

import com.king.common.utils.ExPortUtilTools;

public class XLSTransformerExport {
	
	public static void main(String[] args) {
        //组织数据
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Map<String, Object> m1 = new HashMap<String,Object>();
        m1.put("PRONAME", "项目1");
        m1.put("PLANTYPE", "计划1");
        m1.put("PROTYPE", "类别1");
        Map<String, Object> m2 = new HashMap<String,Object>();
        m2.put("PRONAME", "项目2");
        m2.put("PLANTYPE", "计划2");
        m2.put("PROTYPE", "类别2");

        list.add(m1);
        list.add(m2);
        Map<String, Object> para = new HashMap<String, Object>();
        para.put("result", list);
        XLSTransformer transformer = new XLSTransformer();

        //String temppath = "C:\\Users\\Administrator\\Documents\\测试模板.xlsx";
        //模板路径，如果用的模板是xlsx，则生成的文件类型也必须为xlsx类型，否则由于格式不对，会打不开文件
        String temppath = "D:\\Document\\测试模板.xlsx";
        //输出文件路径，以及路径名称
        String exportpath =ExPortUtilTools.getDirPath("测试结果_xls.xls", new File("D:\\Documents"));
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

    }


}
