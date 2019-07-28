package com.lzt.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.lzt.entity.NotePad;
import com.lzt.entity.Shuxing;
import com.lzt.myutils.DateUtil;
import com.lzt.myutils.MyId;
import com.lzt.service.NotePadService;

@RestController  
@RequestMapping("/notepad") 
public class NotePadController {
  
	@Autowired(required=false)
	private NotePadService notePadService;
	
	private static Logger log=LoggerFactory.getLogger(NotePadController.class);
	
	@RequestMapping(value="/addNotePad")  
	public Integer addNotePad(NotePad notePad){
		String npTitle = notePad.getNpTitle();
		String npContent = notePad.getNpContent();
		if(npTitle==null || npTitle=="" || npContent==null || npContent==""){
			return 0;
		}
		notePad.setNpId(MyId.getMyId());
		Date date = DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss");
		notePad.setCreateTime(date);
		notePad.setUpdateTime(date);
		Integer i = notePadService.addNotePad(notePad);
		return i;
	}
	
	@RequestMapping(value="/notePadSel")  
	public String notePadSel(){
		List<NotePad> list = notePadService.notePadSel();
		Gson gson = new Gson();
		String json = gson.toJson(list);
		return json;
	}
}
