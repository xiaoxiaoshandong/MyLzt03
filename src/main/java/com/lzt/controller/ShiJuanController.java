package com.lzt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.lzt.entity.KsrDaAn;
import com.lzt.entity.KsrDaAnVo;
import com.lzt.service.ShiJuanService;
@RestController  
@RequestMapping("/shijuan") 
public class ShiJuanController {
	
	@Autowired(required=false)
	private ShiJuanService shiJuanService;
	private static Logger log=LoggerFactory.getLogger(ShiJuanController.class);
	
	/**
	 * 
	 * @param request
	 * @return  1:成功 0：失败
	 */
	@RequestMapping(value="/prodShiJuan")  
	public HashMap<String,Object> prodShiJuan(HttpServletRequest request){
		HashMap<String,Object> map = shiJuanService.prodShiJuan(request);
		System.out.println(map);
		return map;
	}
	
/*	@RequestMapping(value="/submitShiJuan")  
	public Map<String,Object> submitShiJuan(KsrDaAnVo ksrDaAnVo){
		System.out.println(ksrDaAnVo);
		Map<String,Object> map =  shiJuanService.submitShiJuan(ksrDaAnVo);
		return map;
	}*/
	
	@RequestMapping(value="/submitShiJuan")  
	public Map<String,Object> submitShiJuan(ArrayList<KsrDaAn> KsrDaAn){
		System.out.println(KsrDaAn);
		System.out.println(KsrDaAn);
		//ceshi11111
		return null;
	}
}
