package com.lzt.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.google.gson.Gson;
import com.lzt.entity.Shuxing;
import com.lzt.service.ShuxingService;
@RestController  
@RequestMapping("/shuxing") 
public class ShuxingController {
	
	@Autowired(required=false)
	private ShuxingService shuxingService;
	
	private static Logger log=LoggerFactory.getLogger(ShuxingController.class);
	
	/**
	 * 
	 * @param erjiId
	 * @param shuxingName
	 * @param shuxingSVal
	 */
	@RequestMapping(value="/add")  
	public Integer addShuxing(String erjiId,String shuxingName,String shuxingSVal){
		Integer integer = null;
		if(shuxingName=="" || shuxingSVal=="" ){
			return 0;
		}
		try {
			integer =shuxingService.addShuxing(erjiId,shuxingName,shuxingSVal);
			if(integer ==0 || integer==null){
				return 0;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 1;
	}
	
	/**
	 * @author lzt
	 * @param shuxing
	 * @return 
	 */
	@RequestMapping(value="/select",produces="text/html;charset=UTF-8")  
	public String selectShuxing(Shuxing shuxing){
		if(shuxing.getErjiId()==null){
			return null;
		}
		System.out.println("shuxing:"+shuxing);
		List<Shuxing> sx  = shuxingService.selectShuxing(shuxing);
		Gson gson = new Gson();
		String json = gson.toJson(sx);
		return json;
	}
	
	/**
	 * 
	 * @param shuxing
	 */
	@RequestMapping(value="/update")  
	public String supdateShuxing(Shuxing shuxing){
		if(shuxing.getShuxingId()==null || shuxing.getShuxingName()==null){
			return "2";
		}
		Integer i  = shuxingService.supdateShuxing(shuxing);
		if(i==0){
			return "0";
		}
		return "1";
	}
}
