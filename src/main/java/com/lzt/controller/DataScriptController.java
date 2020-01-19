package com.lzt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lzt.entity.DataScript;
import com.lzt.entity.Medicine;
import com.lzt.service.DataScriptService;
import com.lzt.service.MedicineService;

@RestController  
@RequestMapping("/dataScript") 
public class DataScriptController {

	@Autowired(required=false)
	private DataScriptService dataScriptService;
	@Autowired(required=false)
	private MedicineService medicineService;
	
	@RequestMapping(value="/getTableNames")  
	public List<DataScript> getTableNames(){
		List<DataScript> list =  dataScriptService.getTableNames();
		return list;
	}
	
	@RequestMapping(value="/getMedicineList")  
	public List<Medicine> getMedicineList(){
		List<Medicine> list =  medicineService.getMedicineList();
		return list;
	}
	
	@RequestMapping(value="/createData")  
	public Map<String,Object> createData(String dataCont,String tableName,String dataType){
		Map<String,Object> map  = new HashMap<String,Object>();
		try {

			long startTime = System.currentTimeMillis();
			dataScriptService.createData(dataCont,tableName);
			long endTime = System.currentTimeMillis();
			long time  = (endTime - startTime)/1000;
			map.put("dataTime", "执行耗时:"+time+"秒");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("errorMsg", "没有此视图");
			return map;
		}
		return map;
	}
	
	@RequestMapping(value="/medicineRob")  
	public Map<String,Object> medicineRob(String medicineId, String consumerNumb){
		Map<String,Object> map  = new HashMap<String,Object>();
		try {

			long startTime = System.currentTimeMillis();
			List<String> consumerList  = dataScriptService.medicineRob(medicineId,consumerNumb);
			long endTime = System.currentTimeMillis();
			long time  = (endTime - startTime)/1000;
			map.put("consumerList",consumerList);
			map.put("dataTime", "执行耗时:"+time+"秒");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("errorMsg", "没有此视图");
			return map;
		}
		return map;
	}
}
