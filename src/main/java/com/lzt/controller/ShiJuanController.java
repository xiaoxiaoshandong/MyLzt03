package com.lzt.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
	@RequestMapping(value="/addShiJuan")  
	public Integer addShiJuan(HttpServletRequest request){
		Integer i = shiJuanService.addShiJuan(request);
		return i;
	}
	
}
