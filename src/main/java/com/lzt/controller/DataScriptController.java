package com.lzt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lzt.entity.DataScript;
import com.lzt.service.DataScriptService;

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
		try {

			long startTime = System.currentTimeMillis();
			dataScriptService.createData(dataCont,tableName);
			long endTime = System.currentTimeMillis();
			long time  = endTime - startTime;
			map.put("dataTime", "查询耗时:"+time+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("errorMsg", "没有此视图");
			return map;
		}
		return map;
	}
}
