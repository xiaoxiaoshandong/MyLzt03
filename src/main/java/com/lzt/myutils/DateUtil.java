package com.lzt.myutils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static String format(String str){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(str);
		String format = sdf.format(d);
		return format;
	}
}
