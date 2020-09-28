package com.lzt.service.impl;

import com.lzt.dao.ColumnsMapper;
import com.lzt.entity.Columns;
import com.lzt.entity.ParamVO;
import com.lzt.myutils.*;
import com.lzt.service.ColumnsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ColumnsServiceImpl implements ColumnsService {

    @Autowired(required=false)
    private  ColumnsMapper columnsMapper;

    public List<Columns> getColumns(ParamVO param) {
        //获取配置文件信息
        //实体类部署位置
        String entityDeployRoute = PropertiesUtil.getValue("columns.properties", "entityDeployRoute");
        String author = PropertiesUtil.getValue("columns.properties", "author");
        param.setAuthor(author);
        //获取表信息
        List<Columns> columns = columnsMapper.getColumns(param);
        //生成 entity
        StringBuffer entity = getEntity(param,columns);
        //获取表名称
        String tableName = TypeChange.InitialsLineToHump(columns.get(0).getTableName());
        //写入到指定位置
        IoUtil.wirteToFile(entity.toString(),entityDeployRoute,tableName);
        System.out.println(entity);
        //生成 dao
//        StringBuffer dao = getDao(param,columns);
//        System.out.println(dao);
        return null;
    }

    /**
     * 获取entity实体
     */
    private StringBuffer getEntity(ParamVO param ,List<Columns> columns){
        String str = "";
        String table_name = columns.get(0).getTableName();
        String tableName = TypeChange.InitialsLineToHump(columns.get(0).getTableName());
        String date = DateUtil.format("yyyy-MM-dd HH:mm:ss");
        StringBuffer entityStr =new StringBuffer();
        String entityRoute = PropertiesUtil.getValue("columns.properties", "entityRoute");
        //获取包路径集合
        List<String> list = ColumnsUtil.getImport(columns);
        entityStr.append("package "+entityRoute+";\n");
                if(list.size()!=0){
                    for (String myImport: list) {
                        entityStr.append(myImport);
                    }
                }
        entityStr.append("/** \n")
                 .append(" * @ClassName "+tableName+" \n")
                 .append(" * @author "+param.getAuthor()+" \n")
                 .append(" * @jdkVersion jdk1.7 \n")
                 .append(" * @version \n")
                 .append(" * @Date "+date+" \n")
                 .append(" * @Description \n")
                 .append(" */ \n")
                 .append("public class "+tableName+" { \n");
                for (Columns c:  columns){
                    String  column_name= c.getColumnName();
                    String column_comment = c.getColumnComment();
                    String data_type = c.getDataType();
                    String columName = TypeChange.lineToHump(c.getColumnName());
                    String dataType = ColumnsUtil.columnsTypeToChange(c.getDataType());
                    entityStr.append(" \n")
                             .append("   /**  \n")
                             .append("   *  "+column_comment+"  \n")
                             .append("   *  表字段："+table_name+"."+column_name+"  \n")
                             .append("   */  \n")
                             .append("   private "+dataType+" "+columName+" ; \n");
                }
        for (Columns c:  columns) {
                    String columName = TypeChange.lineToHump(c.getColumnName());
                    String initialsColumName = TypeChange.InitialsLineToHump(c.getColumnName());
                    String dataType = ColumnsUtil.columnsTypeToChange(c.getDataType());
            entityStr.append("\n   public "+dataType+" get"+initialsColumName+"() {   return "+columName+";   } \n" );
            if(dataType.equals("String")){
                str ="\n   public void set"+initialsColumName+"(String "+columName+") {   this."+columName+" = "+columName+" == null ? null : "+columName+".trim();   } \n";
            }else{
                str ="\n   public void set"+initialsColumName+"("+dataType+" "+ columName+") {   this."+columName+" = "+columName+";   } \n";
            }
            entityStr.append(str);
        }
        entityStr.append("\n}");
        return entityStr;
    }

    /**
     * 获取Dao
     */
    private StringBuffer  getDao(ParamVO param ,List<Columns> columns){

        return null;
    }
}
