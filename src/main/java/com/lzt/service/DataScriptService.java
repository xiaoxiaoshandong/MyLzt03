package com.lzt.service;

import java.util.List;

import com.lzt.entity.DataScript;

public interface DataScriptService {

	List<DataScript> getTableNames();

	List<String> getTablecolumns(String  tableName);

	void createData(String dataCont, String tableName);
	
}
