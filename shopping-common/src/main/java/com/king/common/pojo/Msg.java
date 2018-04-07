package com.king.common.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回的类
 * @author TIAN
 *
 */
public class Msg {

	//状态码 100成功 200失败
	private int code;
	//提示信息
	private String msg;
	//用户要返回给浏览器中的数据
	private Map<String, Object> entend = new HashMap<>();
	
	public static Msg success(){
		Msg resutlMsg = new Msg();
		resutlMsg.setCode(100);
		resutlMsg.setMsg("处理成功");
		return resutlMsg;
	}
	
	public	static Msg fail(){
		Msg resultMsg = new Msg();
		resultMsg.setCode(200);
		resultMsg.setMsg("处理失败");
		return resultMsg;
	}
	
	public Msg add(String key,Object value){
		this.getEntend().put(key, value);
		return this;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getEntend() {
		return entend;
	}
	public void setEntend(Map<String, Object> entend) {
		this.entend = entend;
	}
	
	
}
