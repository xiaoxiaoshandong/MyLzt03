package com.lzt.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.lzt.entity.WenTi;
import com.lzt.service.WenTiService;
@RestController  
@RequestMapping("/wenti") 
public class WenTiController {
	
	@Autowired(required=false)
	private WenTiService wenTiService;
	private static Logger log=LoggerFactory.getLogger(WenTiController.class);
	
	/**
	 * 
	 * @param wt  问题对象
	 * @param da  答案字符串
	 * @return  0：添加失败 1：成功
	 */
	@RequestMapping(value="/addWenTi")  
	public Integer addWenTi(WenTi wt,String ansContent){
		String questContent = wt.getQuestContent();
		String optionA = wt.getOptionA();
		String optionB = wt.getOptionB();
		String optionC = wt.getOptionC();
		String optionD = wt.getOptionD();
		if(ansContent=="" || questContent=="" || optionA=="" || optionB=="" || optionC=="" || optionD==""){
			return 0;
		}
		Integer i = wenTiService.addWenTi(wt,ansContent);
		return i;
	}
}
