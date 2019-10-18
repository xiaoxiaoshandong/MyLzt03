package com.lzt.test.sericeimpl;

import java.util.ArrayList;
import java.util.List;

import com.lzt.controller.A;
import com.lzt.controller.B;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			// √∞≈›≈≈–Ú
	/*	int [] a ={1,2,5,7,8,9,10,3,5,7,8};
		int[] maopao = maopao(a);
		
		for(int i=0;i<maopao.length;i++){
			System.out.println(maopao[i]);
		}*/
		/*String str= "fefoafeofoieaad";
		String a= "a";
		getKeys(str,a);*/
		A a = new B();
		String str = a.str;
		System.out.println(str);
		a.my();
		
		
	}
	public static int[] maopao(int [] a){
		
		for(int i=0;i<a.length;i++){
			
			for(int j=i;j<a.length;j++){
				if(a[i]>a[j]){
					int b=a[i];
					a[i]=a[j];
					a[j]=b;
				}
			}
		}
		
		return a;
	}
	
	public static void getKeys(String str,String key){
		/*int i = str.indexOf(key);
		int j = str.lastIndexOf(key);
		System.out.print(i);
		System.out.print(j);*/
		char[] charArray = str.toCharArray();
		List<String> list = new ArrayList<String>();
		for(int i=0;i<charArray.length;i++){
			String c = charArray[i]+"";	
			list.add(c);
		}
		for(int i=0;i<list.size();i++){
			String str1 = list.get(i);
			if(str1.equals(key)){
				System.out.println(i);
			}
		}
	}

}
