package com.lzt.controller;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lzt.entity.FenShuVo;
import com.lzt.entity.KsrDaAnVo;
import com.lzt.service.KsrDaAnService;
@RestController  
@RequestMapping("/ksrdaan") 
public class KsrDaAnController {
	
	@Autowired(required=false)
	private KsrDaAnService ksrDaAnService;
	private static Logger log=LoggerFactory.getLogger(KsrDaAnController.class);
	
	@RequestMapping(value="/submitDaAn")  
	public FenShuVo submitDaAn(KsrDaAnVo ksrDaAnVo){
		FenShuVo fsv =  ksrDaAnService.submitDaAn(ksrDaAnVo);
		return fsv;
	}
	
}
