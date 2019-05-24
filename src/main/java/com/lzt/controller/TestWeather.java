package com.lzt.controller;

import java.rmi.RemoteException;

import javax.jws.WebService;
import javax.xml.rpc.ServiceException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.com.WebXml.WeatherWebServiceLocator;
import cn.com.WebXml.WeatherWebServiceSoapStub;

@RestController  
@RequestMapping("/weather") 
public class TestWeather {
	
	
	 // 调用获取支持查询某个省份内的城市接口
	@RequestMapping("/invokeGetSupportCity") 
    public static void invokeGetSupportCity()
            throws RemoteException, Exception {
		WeatherWebServiceLocator locator = new WeatherWebServiceLocator();
		 WeatherWebServiceSoapStub service = (WeatherWebServiceSoapStub) locator
	                .getPort(WeatherWebServiceSoapStub.class);
		invokeGetWeatherByOneCity(service);
    }
	
	 // 调用查询某个城市天气的接口
    public static void invokeGetWeatherByOneCity(
            WeatherWebServiceSoapStub service) throws RemoteException {
        String cityName = "苏州";
        String[] weatherInfo = service.getWeatherbyCityName(cityName);
        for (String str : weatherInfo) {
            System.out.println(str);
        }
    }
}
