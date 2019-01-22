package com.lzt.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.lzt.entity.Shuxing;
import com.lzt.entity.ShuxingS;
import com.lzt.service.ShuxingSService;
@RestController  
@RequestMapping("/shuxings") 
public class ShuxingSController {
	
	@Autowired(required=false)
	private ShuxingSService shuxingSService;
	
	private static Logger log=LoggerFactory.getLogger(ShuxingSController.class);
	
	@RequestMapping(value="/select",produces="text/html;charset=UTF-8")  
	public String selectShuxingS(Shuxing shuxing,HttpServletResponse response){
		Gson gson = new Gson();
		if(shuxing.getShuxingId()==null){
			return "0";
		}
		ShuxingS shuxingS = new ShuxingS();
		shuxingS.setShuxingId(shuxing.getShuxingId());
		List<ShuxingS> ss = shuxingSService.selectByAll(shuxingS);
		String json = gson.toJson(ss);
		return json;
	}
	/**
	 * 
	 * @param shuxingId
	 * @param shuxingName
	 * @param shuxingSVal
	 */
	@RequestMapping(value="/update")  
	public String updateShuxingS(ShuxingS shuxingS){
		if(shuxingS.getShuxingSId()==null || shuxingS.getShuxingSVal()==null){
			return "2";
		}
		Integer integer  = shuxingSService.updateShuxingS(shuxingS);
		if(integer == 0){
			return "0";
		}
		return "1";
	}
}
