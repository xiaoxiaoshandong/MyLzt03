package com.lzt.controller;

import java.rmi.RemoteException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.com.WebXml.WeatherWebServiceSoapStub;

@RestController  
@RequestMapping("/weather") 
public class TestWeather {
	
	
	// 调用查询某个城市天气的接口  https://www.cnblogs.com/zhangzonghua/p/9221461.html
		@RequestMapping("/invokeGetWeatherByOneCity") 
	     public static void invokeGetWeatherByOneCity(
	            WeatherWebServiceSoapStub service) throws RemoteException {
	         String cityName = "南京";
	         String[] weatherInfo = service.getWeatherbyCityName(cityName);
	         for (String str : weatherInfo) {
	             System.out.println(str);
	         }
	     }
}
