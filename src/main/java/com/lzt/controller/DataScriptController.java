package com.lzt.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lzt.entity.DataScript;
import com.lzt.service.DataScriptService;
import com.mysql.fabric.xmlrpc.base.Data;

@RestController  
@RequestMapping("/dataScript") 
public class DataScriptController {

	@Autowired(required=false)
	private DataScriptService dataScriptService;
	
	@RequestMapping(value="/getTableNames")  
	public List<DataScript> getTableNames(){
		List<DataScript> list =  dataScriptService.getTableNames();
		return list;
	}
	
	@RequestMapping(value="/createData")  
	public Map<String,Object> createData(String dataCont,String tableName,String dataType){
		Map<String,Object> map  = new HashMap<String,Object>();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String format = df.format(new Date(0));
	    map.put("date", format);
		return map;
	}
}
