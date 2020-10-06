package com.lzt.myutils;

import com.lzt.entity.MyGenerator;

import java.util.ArrayList;
import java.util.List;

/**
 * 数据库表映射相关的类
 */
public class MyGeneratorUtil {
    /**
     * mysql字段类型判断Java属性类型
     */
    public static String dataTypeToJavaType(String data_type){
        if(data_type.equals("bigint")){
            return "Long";
        }else if(data_type.equals("binary")){
            return "byte[]";
        }else if(data_type.equals("bit")){
            return "Boolean";
        }else if(data_type.equals("blob")){
            return "byte[]";
        }else if(data_type.equals("tinyint")){
            return "Byte";
        }else if(data_type.equals("char")){
            return "String";
        }else if(data_type.equals("date")){
            return "Date";
        }else if(data_type.equals("datetime")){
            return "Date";
        }else if(data_type.equals("decimal")){
            return "Long";
        }else if(data_type.equals("double")){
            return "Double";
        }else if(data_type.equals("enum")){
            return "String";
        }else if(data_type.equals("float")){
            return "Float";
        }else if(data_type.equals("int")){
            return "Integer";
        }else if(data_type.equals("longblob")){
            return "byte[]";
        }else if(data_type.equals("longtext")){
            return "String";
        }else if(data_type.equals("mediumblob")){
            return "byte[]";
        }else if(data_type.equals("mediumint")){
            return "Integer";
        }else if(data_type.equals("mediumtext")){
            return "String";
        }else if(data_type.equals("set")){
            return "String";
        }else if(data_type.equals("smallint")){
            return "Short";
        }else if(data_type.equals("text")){
            return "String";
        }else if(data_type.equals("time")){
            return "Date";
        }else if(data_type.equals("timestamp")){
            return "Date";
        }else if(data_type.equals("tinyblob")){
            return "byte[]";
        }else if(data_type.equals("tinytext")){
            return "String";
        }else if(data_type.equals("varbinary")){
            return "byte[]";
        }else if(data_type.equals("varchar")){
            return "String";
        }else if(data_type.equals("year")){
            return "Date";
        }else{
            throw new RuntimeException("没有对比类型！");
        }
    }

    /**
     * @param datatype
     * @return
     */
    public static String dataTypeToJdbcType(String datatype){
        if(datatype.equals("bigint")){
            return "BIGINT";
        }else if(datatype.equals("bit")){
            return "BIT";
        }else if(datatype.equals("bool")){
            return "BIT";
        }else if(datatype.equals("boolean")){
            return "BIT";
        }else if(datatype.equals("char")){
            return "CHAR";
        }else if(datatype.equals("date")){
            return "DATE";
        }else if(datatype.equals("datetime")){
            return "TIMESTAMP";
        }else if(datatype.equals("decimal")){
            return "DECIMAL";
        }else if(datatype.equals("double")){
            return "DOUBLE";
        }else if(datatype.equals("enum")){
            return "CHAR";
        }else if(datatype.equals("float")){
            return "REAL";
        }else if(datatype.equals("int")){
            return "INTEGER";
        }else if(datatype.equals("mediumint")){
            return "INTEGER";
        }else if(datatype.equals("numeric")){
            return "DECIMAL";
        }else if(datatype.equals("real")){
            return "DOUBLE";
        }else if(datatype.equals("set")){
            return "CHAR";
        }else if(datatype.equals("smallint")){
            return "SMALLINT";
        }else if(datatype.equals("time")){
            return "TIME";
        }else if(datatype.equals("timestamp")){
            return "TIMESTAMP";
        }else if(datatype.equals("tinyint")){
            return "TINYINT";
        }else if(datatype.equals("tinytext")){
            return "VARCHAR";
        }else if(datatype.equals("varchar")){
            return "VARCHAR";
        }else if(datatype.equals("year")){
            return "DATE";
        }else if(datatype.equals("binary")){
            return "BINARY";
        }else if(datatype.equals("blob")){
            return "LONGVARBINARY";
        }else if(datatype.equals("longblob")){
            return "LONGVARBINARY";
        }else if(datatype.equals("longtext")){
            return "LONGVARCHAR";
        }else if(datatype.equals("mediumblob")){
            return "LONGVARBINARY";
        }else if(datatype.equals("mediumtext")){
            return "LONGVARCHAR";
        }else if(datatype.equals("text")){
            return "LONGVARCHAR";
        }else if(datatype.equals("tinyblob")){
            return "BINARY";
        }else if(datatype.equals("varbinary")){
            return "VARBINARY";
        }else{
            return "没有对比类型！";
        }
    }

    /**
     * 根据类型获取包路径
     */
    public static List<String> getImport(List<MyGenerator> columns){
            if(columns.size()==0){
                return null;
            }
        ArrayList<String> list = new ArrayList<String>();
        for (MyGenerator c: columns) {
            if(c.getDataType().equals("date") || c.getDataType().equals("datetime")){
                list.add("import java.util.Date; \n");
            }
        }
        if(list.size() == 0){
            return list;
        }
        return JavaUtil.listDelRepeat(list);
    }
}
