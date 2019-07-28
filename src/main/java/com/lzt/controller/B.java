package com.lzt.controller;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class B implements InvocationHandler {
		
	public static void main(String[] args) {
		B.getFruit(2).getFruit();
	}
	/**
	 * 
	 */
	public static  Fruit getFruit(int tpye){
		switch (tpye){
		case 1: return new Banana();
		case 2: return new Apple();
		case 3: 
		default :return new Pear();
		}
	}
	public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
		// TODO Auto-generated method stub
		return null;
	}
	
}


