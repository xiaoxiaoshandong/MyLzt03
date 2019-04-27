package com.lzt.myutils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	/**
	 * 
	 * @param str 数据格式
	 * @return String 类型的时间
	 */
	public static String format(String str){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(str);
		String format = sdf.format(d);
		return format;
	}
	/**
	 * 
	 * @param type 数据格式
	 * @return date类型的时间
	 */
	public static Date getTimeFormatDate(String type){
		SimpleDateFormat sdf = new SimpleDateFormat(type);
		Date date = new Date();
		Date parse =null;
		try {
			String format = sdf.format(date);
			parse = sdf.parse(format);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return parse;
	}
}
