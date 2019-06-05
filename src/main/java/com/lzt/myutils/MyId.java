package com.lzt.myutils;

import java.util.Random;

public class MyId {
	public static String getMyId(){
		long millis = System.currentTimeMillis();
		Random random = new Random();
		int nextInt = random.nextInt(100);
		String str1 = String.valueOf(millis);
		String str2 = String.valueOf(nextInt);
		String str3=str1+str2;
		return str3;
	}
	
}
