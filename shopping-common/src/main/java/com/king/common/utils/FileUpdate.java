package com.king.common.utils;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;


public class FileUpdate {

	public static String updatePicture(MultipartFile file,HttpServletRequest request) throws IOException{  
		System.out.println("comming!");  
        String path = request.getSession().getServletContext().getRealPath("/WEB-INF/images");  
        System.out.println("path>>"+path);  
        //获取文件后缀名
        String fileName = file.getOriginalFilename();  
        System.out.println("fileName>>"+fileName);    
        String prefix=fileName.substring(fileName.lastIndexOf("."));
        System.out.println(prefix);
        //将图片以时间格式新命名
        Date d=new java.util.Date();    //获取当前系统的时间
        //格式化日期
        SimpleDateFormat s= new SimpleDateFormat("yyyyMMddHHmmss");
      	String dateStr = s.format(d); //转为字符串
      	System.out.println(dateStr);
      	
        File dir = new File(path, dateStr+prefix);  
        System.out.println("dir.exists()>>"+dir.exists());  
        if(!dir.exists()){  
            dir.mkdirs();  
        }  
        System.out.println("dir.exists()>>"+dir.exists());  
//      MultipartFile自带的解析方法  
        file.transferTo(dir); 
          
        return dateStr+prefix;  
    
    }  
}
