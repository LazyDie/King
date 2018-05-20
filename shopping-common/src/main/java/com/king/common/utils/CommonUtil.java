package com.king.common.utils;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Array;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Collection;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

public class CommonUtil {

	private CommonUtil() {
	}


	/**
	 * 判断空值
	 * 
	 * @param obj
	 * @return
	 */
	public static boolean isEmpty(Object obj) {
		if (null == obj) {
			return true;
		}
		if (obj instanceof String) {
			String s = (String) obj;
			return s.trim().length() == 0 || "null".equals(s) || "NULL".equals(s) || "undefined".equals(s);
		}
		if (obj.getClass().isArray()) {
			return Array.getLength(obj) == 0;
		}
		if (obj instanceof Collection) {
			@SuppressWarnings("rawtypes")
			Collection c = (Collection) obj;
			return c.isEmpty();
		}
		if (obj instanceof Map) {
			@SuppressWarnings("rawtypes")
			Map m = (Map) obj;
			return m.isEmpty();
		}
		return false;
	}

	public static boolean isNotEmpty(Object obj) {
		return !isEmpty(obj);
	}


	/**
	 * 产生一个6位随机验证码
	 * 
	 * @return
	 */
	public static int getRandom6() {
		return (int) ((Math.random() * 9 + 1) * 100000);
	}

	/**
	 * 产生一个固定长度的数字字符串
	 * 
	 * @param length
	 * @return
	 */
	public static String getRandomNumberStr(int length) {
		StringBuffer b = new StringBuffer("1");
		for (int i = 0; i < length - 1; i++) {
			b.append("0");
		}
		long p = Long.parseLong(b.toString());
		return String.valueOf((long) ((Math.random() * 9 + 1) * p));
	}

	/**
	 * 8位随机数字
	 * 
	 * @return
	 */
	public static String generateRandomNumber() {
		return generateRandomNumber(8);
	}

	public static String generateRandomNumber(int length) {
		StringBuilder str = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			str.append(random.nextInt(9));
		}
		return str.toString();
	}

}
