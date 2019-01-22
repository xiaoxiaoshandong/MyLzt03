package com.lzt.controller;



import java.math.BigDecimal;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.lzt.service.SkuService;

@RestController  
@RequestMapping("/sku") 
public class SkuController {
	
	@Autowired(required=false)
	private SkuService skuService;
	
	private static Logger log=LoggerFactory.getLogger(SkuController.class);
	
	/**
	 * 
	 * @param skuName
	 * @param kucun
	 * @param jiage
	 * @param shuxingSId
	 * @return 0:添加失败 1：添加成功
	 */
	@RequestMapping(value="/insert")
	public String insertSku(String spuId,String skuName,Integer kucun,BigDecimal jiage,String shuxingSId){
		if(spuId=="" ||spuId==null || skuName=="" || skuName==null || kucun==null || jiage==null || shuxingSId==null || shuxingSId==""){
			return "0";
		}
		Integer integer = skuService.insertSku(spuId,skuName,kucun,jiage,shuxingSId);
		return integer+"";
	}
}
