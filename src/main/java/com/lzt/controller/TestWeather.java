package com.lzt.controller;

import java.rmi.RemoteException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.com.WebXml.WeatherWebServiceSoapStub;

@RestController  
@RequestMapping("/weather") 
public class TestWeather {
	
	
	 // 调用获取支持查询某个省份内的城市接口
	@RequestMapping("/invokeGetSupportCity") 
    public static void invokeGetSupportCity(WeatherWebServiceSoapStub service)
            throws RemoteException {
        String provinceName = "江苏";
        String[] cities = service.getSupportCity(provinceName);
        System.out.println("总共" + cities.length + "个市");
        for (int i = 0; i < cities.length; i++) {
            if (0 != i && i % 5 == 0) {
                System.out.println();
            }
            System.out.print(cities[i] + "\t");
        }
    }
}
