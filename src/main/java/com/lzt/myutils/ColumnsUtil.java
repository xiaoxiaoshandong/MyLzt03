package com.lzt.myutils;

import com.lzt.entity.Columns;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据库表映射相关的类
 */
public class ColumnsUtil {
    /**
     * mysql字段类型判断
     */
    public static String columnsTypeToChange(String data_type){
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
     * 根据类型获取包路径
     */
    public static List<String> getImport(List<Columns> columns){
            if(columns.size()==0){
                return null;
            }
        ArrayList<String> list = new ArrayList<String>();
        for (Columns c: columns) {
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
