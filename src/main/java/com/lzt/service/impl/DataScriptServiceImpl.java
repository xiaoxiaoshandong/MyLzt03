package com.lzt.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.DataScriptServiceMapper;
import com.lzt.entity.DataScript;
import com.lzt.service.DataScriptService;
@Service
public class DataScriptServiceImpl implements DataScriptService{
	
	@Autowired(required=false)
	private DataScriptServiceMapper dataScriptServiceMapper;
	
	public List<DataScript> getTableNames() {
		// TODO Auto-generated method stub
		return dataScriptServiceMapper.getTableNames();
	}

	public List<String> getTablecolumns(String tableName) {
				// TODO Auto-generated method stub
		return dataScriptServiceMapper.getTablecolumns(tableName);
	}

	public void createData(String dataCont, String tableName) {
		// TODO Auto-generated method stub
		dataScriptServiceMapper.createData(dataCont,tableName);
		
	}

}
