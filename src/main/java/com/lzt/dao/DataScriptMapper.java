package com.lzt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lzt.entity.DataScript;

public interface DataScriptMapper {

	public List<DataScript> getTableNames();

	List<String> getTablecolumns(String tableName);

	public void createData(@Param("dataCont")String dataCont, @Param("tableName")String tableName);

}
