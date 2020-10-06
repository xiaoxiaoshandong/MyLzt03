package com.lzt.service.impl;

import com.lzt.dao.MyGeneratorMapper;
import com.lzt.entity.MyGenerator;
import com.lzt.entity.ParamVO;
import com.lzt.myutils.*;
import com.lzt.service.MyGeneratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyGeneratorServiceImpl implements MyGeneratorService {

    @Autowired(required=false)
    private MyGeneratorMapper myGeneratorMapper;

    public Integer getMyGenerator(ParamVO param) {
        //获取表信息
        List<MyGenerator> myGenerator = myGeneratorMapper.getMyGenerator(param);
        if(myGenerator.size()==0){
            return null;
        }
        //获取文件名称
        String xmlFileName = createFileName("xmlAlias", myGenerator);
        String daoFileName = createFileName("daoAlias", myGenerator);
        String entityFileName = createFileName("entityAlias", myGenerator);
        String serviceFileName = createFileName("serviceAlias", myGenerator);
        String serviceImplFileName = createFileName("serviceImplAlias", myGenerator);
        String controllerFileName = createFileName("controllerAlias", myGenerator);
        if(xmlFileName.equals("-1") || daoFileName.equals("-1") || entityFileName.equals("-1") ){
            return -1;
        }
        //获取配置文件信息
        //实体类部署位置
        String entityDeployRoute = PropertiesUtil.getValue("myGenerator.properties", "entityDeployRoute");
        String daoDeployRoute = PropertiesUtil.getValue("myGenerator.properties", "daoDeployRoute");
        String mapperXmlDeployRoute = PropertiesUtil.getValue("myGenerator.properties", "mapperXmlDeployRoute");
        //String author = PropertiesUtil.getValue("myGenerator.properties", "author");
        String serviceDeployRoute = PropertiesUtil.getValue("myGenerator.properties", "serviceDeployRoute");
        String serviceImplDeployRoute = PropertiesUtil.getValue("myGenerator.properties", "serviceImplDeployRoute");
        String controllerDeployRoute = PropertiesUtil.getValue("myGenerator.properties", "controllerDeployRoute");

        //生成 entity
        StringBuffer entity = getEntity(myGenerator,entityFileName);
        //写入到指定位置
        IoUtil.wirteToFile(entity.toString(),entityDeployRoute,entityFileName,"java");
        //System.out.println(entity);

       //生成 dao
       StringBuffer dao = getDao(myGenerator,daoFileName,entityFileName);
         //写入到指定位置
        IoUtil.wirteToFile(dao.toString(),daoDeployRoute,daoFileName,"java");
        //System.out.println(dao);

         //生成MapperXml
        StringBuffer mapperXml = getMapperXml(myGenerator,daoFileName,entityFileName);
         //写入到指定位置
        IoUtil.wirteToFile(mapperXml.toString(),mapperXmlDeployRoute,xmlFileName,"xml");
        // System.out.println(mapperXml);

        //生成 service
        StringBuffer service = getService(myGenerator,entityFileName,serviceFileName);
        //写入到指定位置
        IoUtil.wirteToFile(service.toString(),serviceDeployRoute,serviceFileName,"java");
        //System.out.println(service);

        //生成serviceImpl
        StringBuffer serviceImpl = getServiceImpl(myGenerator,daoFileName, entityFileName, serviceFileName, serviceImplFileName);
        //写入到指定位置
        IoUtil.wirteToFile(serviceImpl.toString(),serviceImplDeployRoute,serviceImplFileName,"java");
       // System.out.println(serviceImpl);

        //生成controller
        StringBuffer controller =getController(myGenerator,entityFileName,serviceFileName,controllerFileName);
       //写入到指定位置
        IoUtil.wirteToFile(controller.toString(),controllerDeployRoute,controllerFileName,"java");
        //System.out.println(controller);
        return null;
    }

    /**
     * 获取entity实体
     */
    private StringBuffer getEntity(List<MyGenerator> myGenerator,String entityFileName){
        String str = "";
        String table_name = myGenerator.get(0).getTableName();
        StringBuffer entityStr =new StringBuffer();
        String entityRoute = PropertiesUtil.getValue("myGenerator.properties", "entityRoute");
        //根据字段类型获取包路径集合
        List<String> list = MyGeneratorUtil.getImport(myGenerator);
        //拼串
        entityStr.append("package "+entityRoute+";\n\n");
                if(list.size()!=0){
                    for (String myImport: list) {
                        entityStr.append(myImport);
                    }
                }
        entityStr.append("\n");
        //封装类注释
        sealClassNotes(entityFileName,entityStr);
        entityStr.append("public class "+entityFileName+" { \n\n");
                for (MyGenerator c:  myGenerator){
                    String  column_name= c.getColumnName();
                    String column_comment = c.getColumnComment();
                    String columName = TypeChange.lineToHump(c.getColumnName());
                    String dataType = MyGeneratorUtil.dataTypeToJavaType(c.getDataType());
                    entityStr.append("   /**  \n")
                             .append("   *  "+column_comment+"  \n")
                             .append("   *  表字段："+table_name+"."+column_name+"  \n")
                             .append("   */  \n")
                             .append("   private "+dataType+" "+columName+" ; \n\n");
                }
        for (MyGenerator c:  myGenerator) {
                    String columName = TypeChange.lineToHump(c.getColumnName());
                    String initialsColumName = TypeChange.InitialsLineToHump(c.getColumnName());
                    String dataType = MyGeneratorUtil.dataTypeToJavaType(c.getDataType());
            entityStr.append("   public "+dataType+" get"+initialsColumName+"() {   return "+columName+";   } \n\n" );
            if(dataType.equals("String")){
                str ="   public void set"+initialsColumName+"(String "+columName+") {   this."+columName+" = "+columName+" == null ? null : "+columName+".trim();   } \n\n";
            }else{
                str ="   public void set"+initialsColumName+"("+dataType+" "+ columName+") {   this."+columName+" = "+columName+";   } \n\n";
            }
            entityStr.append(str);
        }
        entityStr.append("}");
        return entityStr;
    }


    /**
     * @param fileName 首字母大写的驼峰表名称
     * @param entityStr 封装字符串对象
     * @Description 封装类注释
     * @return 返回封装好的 entityStr
     */
    private void sealClassNotes(String fileName,StringBuffer entityStr){
        String date = DateUtil.format("yyyy-MM-dd HH:mm:ss");
        String author = PropertiesUtil.getValue("myGenerator.properties", "author");
        String version = PropertiesUtil.getValue("myGenerator.properties", "version");
        String jdkVersion = PropertiesUtil.getValue("myGenerator.properties", "jdkVersion");
        entityStr.append("/** \n")
                 .append(" * @ClassName "+fileName+" \n")
                 .append(" * @author "+author+" \n")
                 .append(" * @jdkVersion "+jdkVersion+" \n")
                 .append(" * @version "+version+"\n")
                 .append(" * @Date "+date+" \n")
                 .append(" * @Description \n")
                 .append(" */ \n");
    }

    /**
     * @param fileName  必须是myGenerator.properties 文件中存在的属性。否则创建失败,返回-1
     * @param  myGenerator  获取表信息
     * @return
     */
    private String createFileName(String fileName,List<MyGenerator> myGenerator){
        //获取首字母大写的驼峰表名
        String initialsTableName = TypeChange.InitialsLineToHump(myGenerator.get(0).getTableName());
        String alias = PropertiesUtil.getValue("myGenerator.properties", fileName);
        if(fileName.equals("daoAlias")){
            return initialsTableName+alias;
        }else if(fileName.equals("xmlAlias")){
            return initialsTableName+alias;
        }else if(fileName.equals("serviceAlias")){
            return initialsTableName+alias;
        }else if(fileName.equals("serviceImplAlias")){
            return initialsTableName+alias;
        }else if(fileName.equals("controllerAlias")){
            return initialsTableName+alias;
        }else if(fileName.equals("entityAlias")){
            return initialsTableName+alias;
        }
        return "-1";
    }

    /**
     * @param parameter  驼峰表名称
     * @param entityStr  entityStr 封装字符串对象
     * @param description 方法注释
     * @return 返回封装好的 entityStr
     */
    private void sealMethodNotes(String parameter,StringBuffer entityStr,String description){
        String author = PropertiesUtil.getValue("myGenerator.properties", "author");
        entityStr.append("   /** \n")
                 .append("   * @author "+author+" \n")
                 .append("   * @param "+parameter+" \n")
                 .append("   * @Description "+description+"\n")
                 .append("   * @return \n")
                 .append("   */ \n");
    }

    /**
     *
     * @param myGenerator  获取表信息
     * @param daoFileName  数据访问层文件名称
     * @param entityFileName 实体层文件名称
     * @return
     */
    private StringBuffer  getDao(List<MyGenerator> myGenerator, String daoFileName,String entityFileName){
        //驼峰表名称
        String tableName = TypeChange.lineToHump(myGenerator.get(0).getTableName());
        //dao包路径
        String daoRoute = PropertiesUtil.getValue("myGenerator.properties", "daoRoute");
        //实体包路径
        String entityRoute = PropertiesUtil.getValue("myGenerator.properties", "entityRoute");
        StringBuffer entityStr =new StringBuffer();
        entityStr.append("package "+daoRoute+"; \n\n");
        entityStr.append("import "+entityRoute+"."+entityFileName+"; \n");
        entityStr.append("import java.util.List; \n\n");
        sealClassNotes(daoFileName,entityStr);
        entityStr.append("public interface "+daoFileName+" { \n\n");
        sealMethodNotes(tableName,entityStr,"新增");
        entityStr.append("   int insertSelective("+entityFileName+" "+tableName+"); \n\n");
        sealMethodNotes(tableName,entityStr,"主键删除");
        entityStr.append("   int deleteByPrimaryKey("+entityFileName+" "+tableName+"); \n\n");
        sealMethodNotes("list",entityStr,"批量删除");
        entityStr.append("   int deleteBatch( List<String> list ); \n\n");
        sealMethodNotes(tableName,entityStr,"主键修改");
        entityStr.append("   int updateByPrimaryKeySelective("+entityFileName+" "+tableName+"); \n\n");
        sealMethodNotes(tableName,entityStr,"主键查询");
        entityStr.append("   "+entityFileName+" selectByPrimaryKey("+entityFileName+" "+tableName+"); \n\n");
        sealMethodNotes(tableName,entityStr,"查询");
        entityStr.append("   List<"+entityFileName+"> selectSelective("+entityFileName+" "+tableName+"); \n\n");
        sealMethodNotes(tableName,entityStr,"模糊查询");
        entityStr.append("   List<"+entityFileName+"> selectLikeSelective("+entityFileName+" "+tableName+"); \n\n");
        entityStr.append( "}");

        return entityStr;
    }

    /**
     *
     * @param myGenerator  获取表信息
     * @param daoFileName    数据访问层文件名称
     * @param entityFileName  实体层文件名称
     * @return
     */
    private StringBuffer  getMapperXml(List<MyGenerator> myGenerator,String daoFileName,String entityFileName){
        //表名称
        String table_name = myGenerator.get(0).getTableName();
        //获取实体路径
        String entityRoute = PropertiesUtil.getValue("myGenerator.properties", "entityRoute");
        //获取Dao包路径
        String daoRoute = PropertiesUtil.getValue("myGenerator.properties", "daoRoute");
        //获取表主键
        MyGenerator myGeneratorByPrimaryKey = myGeneratorMapper.getMyGeneratorByPrimaryKey(table_name);
        //获取主键
        String primary_key = myGeneratorByPrimaryKey.getColumnName();
        String data_Type = myGeneratorByPrimaryKey.getDataType();
        //主键转换成驼峰样式
        String primaryKey = TypeChange.lineToHump(primary_key);
        String jdbcPrimaryKeyDataType = MyGeneratorUtil.dataTypeToJdbcType(data_Type).toUpperCase();
        //封装对象
        StringBuffer entityStr =new StringBuffer();
        entityStr.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n");
        entityStr.append("<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\" > \n");
        entityStr.append("<mapper namespace=\""+daoRoute+"."+daoFileName+"\" > \n");
        entityStr.append("  <resultMap id=\"BaseResultMap\" type=\""+entityRoute+"."+entityFileName+"\" > \n");
        for (MyGenerator mg:  myGenerator) {
            String isNullable = mg.getIsNullable();
            String column_name = mg.getColumnName();
            String columnName = TypeChange.lineToHump(column_name);
            String dt = mg.getDataType();
            String jdbcDataType2 = MyGeneratorUtil.dataTypeToJdbcType(dt);
            if(isNullable.equals("NO")){ //说明是主键字段
                entityStr.append("    <id column=\""+column_name+"\" property=\""+columnName+"\" jdbcType=\""+jdbcDataType2+"\" /> \n");
            }else{ //说明是 非主键字段
                entityStr.append("    <result column=\""+column_name+"\" property=\""+columnName+"\" jdbcType=\""+jdbcDataType2+"\" /> \n");
            }
        }
        entityStr.append("  </resultMap> \n\n");
        entityStr.append("  <sql id=\"Base_Column_List\" > \n");
        entityStr.append("    ");
        for (int i=0 ;i<myGenerator.size();i++ ) {
            String column_name = myGenerator.get(i).getColumnName();
            if(i==0){
                entityStr.append(column_name);
            }else{
                entityStr.append(", "+column_name);
            }
        }
        entityStr.append("\n  </sql> \n\n");
        entityStr.append("  <insert id=\"insertSelective\" parameterType=\""+entityRoute+"."+entityFileName+"\" > \n");
        entityStr.append("    insert into "+table_name+" \n" );
        entityStr.append("    <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\" > \n");
        for (MyGenerator mg:  myGenerator) {
            String column_name = mg.getColumnName();
            String columnName = TypeChange.lineToHump(column_name);
            entityStr.append("      <if test=\""+columnName+" != null\" > \n");
            entityStr.append("        "+column_name+", \n");
            entityStr.append("      </if> \n");
            }
            entityStr.append("    </trim> \n");
            entityStr.append("    <trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\" > \n");
        for (MyGenerator mg:  myGenerator) {
            String column_name = mg.getColumnName();
            String columnName = TypeChange.lineToHump(column_name);
            String dt = mg.getDataType();
            String jdbcDataType2 = MyGeneratorUtil.dataTypeToJdbcType(dt);
            entityStr.append("      <if test=\""+columnName+" != null\" > \n");
            entityStr.append("        #{"+columnName+",jdbcType="+jdbcDataType2+"}, \n");
            entityStr.append("      </if> \n");
        }
        entityStr.append("    </trim> \n");
        entityStr.append("  </insert> \n\n");
        entityStr.append("  <delete id=\"deleteByPrimaryKey\" parameterType=\""+entityRoute+"."+entityFileName+"\" > \n");
        entityStr.append("    delete from "+table_name+"\n");
        entityStr.append("    where "+primary_key+" = #{"+primaryKey+",jdbcType="+jdbcPrimaryKeyDataType+"} \n");
        entityStr.append("  </delete> \n\n");
        entityStr.append("  <delete id=\"deleteBatch\"> \n");
        entityStr.append("    delete from "+table_name+" where "+primary_key+" IN \n");
        entityStr.append("    <foreach collection=\"list\" item=\""+primaryKey+"\" open=\"(\" close=\")\" separator=\",\"> \n");
        entityStr.append("      #{"+primaryKey+"} \n");
        entityStr.append("    </foreach> \n");
        entityStr.append("  </delete> \n\n");
        entityStr.append("  <update id=\"updateByPrimaryKeySelective\" parameterType=\""+entityRoute+"."+entityFileName+"\" > \n");
        entityStr.append("    update "+table_name+" \n");
        entityStr.append("    <set > \n");
        for (MyGenerator mg:  myGenerator) {
            String column_name = mg.getColumnName();
            String columnName = TypeChange.lineToHump(column_name);
            String gdt = mg.getDataType();
            String dt = MyGeneratorUtil.dataTypeToJdbcType(gdt);
            entityStr.append("      <if test=\""+columnName+" != null\" > \n");
            entityStr.append("        "+column_name+" = #{"+columnName+",jdbcType="+dt+"}, \n");
            entityStr.append("      </if> \n");
        }
        entityStr.append("    </set> \n");
        entityStr.append("    where "+primary_key+" = #{"+primaryKey+",jdbcType="+jdbcPrimaryKeyDataType+"} \n");
        entityStr.append("  </update> \n\n");
        entityStr.append("  <select id=\"selectByPrimaryKey\" resultMap=\"BaseResultMap\" parameterType=\""+entityRoute+"."+entityFileName+"\" > \n");
        entityStr.append("    select \n");
        entityStr.append("    <include refid=\"Base_Column_List\" /> \n");
        entityStr.append("    from "+table_name+" \n");
        entityStr.append("    where "+primary_key+" = #{"+primaryKey+",jdbcType="+jdbcPrimaryKeyDataType+"} \n");
        entityStr.append("  </select> \n\n");
        entityStr.append("  <select id=\"selectSelective\" resultMap=\"BaseResultMap\" parameterType=\""+entityRoute+"."+entityFileName+"\" > \n");
        entityStr.append("    select \n");
        entityStr.append("    <include refid=\"Base_Column_List\" /> \n");
        entityStr.append("    from "+table_name+" \n");
        entityStr.append("    <where> \n");
        for (MyGenerator mg:  myGenerator) {
            String column_name = mg.getColumnName();
            String columnName = TypeChange.lineToHump(column_name);
            String gdt = mg.getDataType();
            String dt = MyGeneratorUtil.dataTypeToJdbcType(gdt);
            entityStr.append("        <if test=\""+columnName+" != null\" > \n");
            entityStr.append("            AND "+column_name+" = #{"+columnName+",jdbcType="+dt+"} \n");
            entityStr.append("        </if> \n");
        }
        entityStr.append("    </where> \n");
        entityStr.append("  </select> \n\n");
        entityStr.append("  <select id=\"selectLikeSelective\" resultMap=\"BaseResultMap\" parameterType=\""+entityRoute+"."+entityFileName+"\" > \n");
        entityStr.append("    select \n");
        entityStr.append("    <include refid=\"Base_Column_List\" /> \n");
        entityStr.append("    from "+table_name+" \n");
        entityStr.append("    <where> \n");
        for (MyGenerator mg:  myGenerator ) {
            String column_name = mg.getColumnName();
            String columnName = TypeChange.lineToHump(column_name);
            entityStr.append("        <if test=\""+columnName+" != null\" > \n");
            entityStr.append("            AND  "+column_name+" LIKE CONCAT('%',#{"+columnName+"},'%') \n");
            entityStr.append("        </if> \n");
        }
        entityStr.append("    </where> \n");
        entityStr.append("  </select> \n\n");
        entityStr.append("</mapper>");
        return entityStr;
    }

    /**
     *
     * @param myGenerator   获取表信息
     * @param entityFileName 实体层文件名称
     * @param serviceFileName 接口层文件名称
     * @return
     */
    private StringBuffer getService(List<MyGenerator> myGenerator,String entityFileName,String serviceFileName){
        //驼峰表名称
        String tableName = TypeChange.lineToHump(myGenerator.get(0).getTableName());
        //获取service包路径
        String serviceRoute = PropertiesUtil.getValue("myGenerator.properties", "serviceRoute");
        //实体路径
        String entityRoute = PropertiesUtil.getValue("myGenerator.properties", "entityRoute");
        //封装对象
        StringBuffer entityStr =new StringBuffer();
        entityStr.append("package "+serviceRoute+"; \n\n");
        entityStr.append("import "+entityRoute+"."+entityFileName+"; \n");
        entityStr.append("import java.util.List; \n\n");
        sealClassNotes(serviceFileName,entityStr);
        entityStr.append("public interface "+serviceFileName+" { \n\n");
        sealMethodNotes(tableName,entityStr,"新增");
        entityStr.append("   int insertSelective("+entityFileName+" "+tableName+"); \n\n");
        sealMethodNotes(tableName,entityStr,"主键删除");
        entityStr.append("   public int deleteByPrimaryKey("+entityFileName+" "+tableName+"); \n\n");
        sealMethodNotes("list",entityStr,"批量删除");
        entityStr.append("   public int deleteBatch(List<String> list); \n\n");
        sealMethodNotes(tableName,entityStr,"主键修改");
        entityStr.append("   public int updateByPrimaryKeySelective("+entityFileName+" "+tableName+"); \n\n");
        sealMethodNotes(tableName,entityStr,"主键查询");
        entityStr.append("   public "+entityFileName+" selectByPrimaryKey("+entityFileName+" "+tableName+"); \n\n");
        sealMethodNotes(tableName,entityStr,"查询");
        entityStr.append("   public List<"+entityFileName+"> selectSelective("+entityFileName+" "+tableName+"); \n\n");
        sealMethodNotes(tableName,entityStr,"模糊查询");
        entityStr.append("   public List<"+entityFileName+"> selectLikeSelective("+entityFileName+" "+tableName+"); \n\n");
        entityStr.append("}");
        return entityStr;
    }

    /**
     *
     * @param myGenerator  获取表信息
     * @param daoFileName  数据层文件名称
     * @param entityFileName 实体层文件名称
     * @param serviceFileName 接口层文件名称
     * @param serviceImplFileName  实现层文件名称
     * @return
     */
    private StringBuffer getServiceImpl(List<MyGenerator> myGenerator,String daoFileName,String entityFileName,String serviceFileName,String serviceImplFileName){
        //驼峰表名称
        String tableName = TypeChange.lineToHump(myGenerator.get(0).getTableName());
        //首字母变小写
        String minDaoFileName = TypeChange.lowerFirstCase(daoFileName);
        //封装对象
        StringBuffer entityStr =new StringBuffer();
        //获取实现类包路径
        String serviceImplRoute = PropertiesUtil.getValue("myGenerator.properties", "serviceImplRoute");
        String daoRoute = PropertiesUtil.getValue("myGenerator.properties", "daoRoute");
        String entityRoute = PropertiesUtil.getValue("myGenerator.properties", "entityRoute");
        String serviceRoute = PropertiesUtil.getValue("myGenerator.properties", "serviceRoute");
        entityStr.append("package "+serviceImplRoute+"; \n\n");
        entityStr.append("import "+daoRoute+"."+daoFileName+"; \n");
        entityStr.append("import "+entityRoute+"."+entityFileName+"; \n");
        entityStr.append("import "+serviceRoute+"."+serviceFileName+"; \n");
        entityStr.append("import org.springframework.beans.factory.annotation.Autowired; \n");
        entityStr.append("import org.springframework.stereotype.Service; \n");
        entityStr.append("import java.util.List; \n\n");
        sealClassNotes(serviceImplFileName,entityStr);
        entityStr.append("@Service \n");
        entityStr.append("public class "+serviceImplFileName+" implements "+serviceFileName+" { \n\n");
        entityStr.append("   @Autowired(required=false) \n");
        entityStr.append("   private "+daoFileName+" "+minDaoFileName+"; \n\n");
        sealMethodNotes(tableName,entityStr,"新增");
        entityStr.append("   public int insertSelective("+entityFileName+" "+tableName+") { \n");
        entityStr.append("       return "+minDaoFileName+".insertSelective("+tableName+"); \n");
        entityStr.append("   } \n\n");
        sealMethodNotes(tableName,entityStr,"主键删除");
        entityStr.append("   public int deleteByPrimaryKey("+entityFileName+" "+tableName+") { \n");
        entityStr.append("       return "+minDaoFileName+".deleteByPrimaryKey("+tableName+"); \n");
        entityStr.append("   } \n\n");
        sealMethodNotes("list",entityStr,"批量删除");
        entityStr.append("    public int deleteBatch(List<String> list) { \n");
        entityStr.append("        return "+minDaoFileName+".deleteBatch(list); \n");
        entityStr.append("    } \n\n");
        sealMethodNotes(tableName,entityStr,"主键修改");
        entityStr.append("   public int updateByPrimaryKeySelective("+entityFileName+" "+tableName+") { \n");
        entityStr.append("       return "+minDaoFileName+".updateByPrimaryKeySelective("+tableName+"); \n");
        entityStr.append("   } \n\n");
        sealMethodNotes(tableName,entityStr,"主键查询");
        entityStr.append("   public "+entityFileName+" selectByPrimaryKey("+entityFileName+" "+tableName+") { \n");
        entityStr.append("       return "+minDaoFileName+".selectByPrimaryKey("+tableName+"); \n");
        entityStr.append("   } \n");
        sealMethodNotes(tableName,entityStr,"查询");
        entityStr.append("   public List<"+entityFileName+"> selectSelective("+entityFileName+" "+tableName+") { \n");
        entityStr.append("       return "+minDaoFileName+".selectSelective("+tableName+"); \n");
        entityStr.append("   } \n\n");
        sealMethodNotes(tableName,entityStr,"模糊查询");
        entityStr.append("   public List<"+entityFileName+"> selectLikeSelective("+entityFileName+" "+tableName+") { \n");
        entityStr.append("       return "+minDaoFileName+".selectLikeSelective("+tableName+"); \n");
        entityStr.append("   } \n\n");
        entityStr.append("}");
        return entityStr;
    }

    /**
     *
     * @param myGenerator   获取表信息
     * @param entityFileName 实体层文件名称
     * @param serviceFileName  接口层文件名称
     * @param controllerFileName  控制层文件名称
     * @return
     */
    private StringBuffer getController(List<MyGenerator> myGenerator,String entityFileName,String serviceFileName,String controllerFileName ){
        //驼峰表名称
        String tableName = TypeChange.lineToHump(myGenerator.get(0).getTableName());
        //首字母变小写
        String minServiceFileName = TypeChange.lowerFirstCase(serviceFileName);
        String s = TypeChange.lowerFirstCase(entityFileName);
        //获取包路径
        String controllerRoute = PropertiesUtil.getValue("myGenerator.properties", "controllerRoute");
        String entityRoute = PropertiesUtil.getValue("myGenerator.properties", "entityRoute");
        String serviceRoute = PropertiesUtil.getValue("myGenerator.properties", "serviceRoute");
        //寻找主键
        String primary_key = null;
        for (MyGenerator mg:  myGenerator) {
            if (mg.getColumnKey().equals("PRI")){
                 primary_key = mg.getColumnName();
            }
        }
        if(primary_key == null){
            return null;//没有找到主键，生成失败
        }
        String maxPrimarykey = TypeChange.InitialsLineToHump(primary_key);
        //封装对象
        StringBuffer entityStr =new StringBuffer();
        entityStr.append("package "+controllerRoute+"; \n\n");
        entityStr.append("import "+entityRoute+"."+entityFileName+"; \n");
        entityStr.append("import "+serviceRoute+"."+serviceFileName+"; \n");
        entityStr.append("import org.springframework.beans.factory.annotation.Autowired; \n");
        entityStr.append("import org.springframework.web.bind.annotation.*; \n");
        entityStr.append("import java.util.List; \n\n");
        sealClassNotes(controllerFileName,entityStr);
        entityStr.append("@RestController \n");
        entityStr.append("@RequestMapping(\"/"+tableName+"\") \n");
        entityStr.append("public class "+controllerFileName+" { \n\n");
        entityStr.append("   @Autowired(required=false) \n");
        entityStr.append("   private "+serviceFileName+" "+minServiceFileName+"; \n\n");
        sealMethodNotes(tableName,entityStr,"新增");
        entityStr.append("   @RequestMapping(value=\"/insertSelective\",method=RequestMethod.POST) \n");
        entityStr.append("   public int insertSelective(@RequestBody "+entityFileName+" "+tableName+"){ \n");
        entityStr.append("        return "+minServiceFileName+".insertSelective("+tableName+"); \n");
        entityStr.append("   } \n\n");
        sealMethodNotes(tableName,entityStr,"主键删除");
        entityStr.append("   @RequestMapping(value=\"/deleteByPrimaryKey\",method=RequestMethod.GET) \n");
        entityStr.append("   public int deleteByPrimaryKey("+entityFileName+" "+tableName+"){ \n");
        entityStr.append("        if("+tableName+".get"+maxPrimarykey+"()==null || "+tableName+".get"+maxPrimarykey+"()==\"\"){ \n");
        entityStr.append("            return -1; \n");
        entityStr.append("        } \n");
        entityStr.append("        return "+minServiceFileName+".deleteByPrimaryKey("+tableName+"); \n");
        entityStr.append("   } \n\n");
        sealMethodNotes("list",entityStr,"批量删除");
        entityStr.append("   @RequestMapping(value=\"/deleteBatch\",method=RequestMethod.POST) \n");
        entityStr.append("   @ResponseBody \n");
        entityStr.append("   public int deleteBatch(@RequestBody List<String> list){ \n");
        entityStr.append("        if(list.size()==0){ \n");
        entityStr.append("            return -1; \n");
        entityStr.append("        } \n");
        entityStr.append("        return "+minServiceFileName+".deleteBatch(list); \n");
        entityStr.append("   } \n\n");
        sealMethodNotes(tableName,entityStr,"主键修改");
        entityStr.append("   @RequestMapping(value=\"/updateByPrimaryKeySelective\",method=RequestMethod.POST) \n");
        entityStr.append("   public int updateByPrimaryKeySelective(@RequestBody "+entityFileName+" "+tableName+") { \n");
        entityStr.append("        if("+tableName+".get"+maxPrimarykey+"()==null || "+tableName+".get"+maxPrimarykey+"()==\"\"){ \n");
        entityStr.append("            return -1; \n");
        entityStr.append("        } \n");
        entityStr.append("        return "+minServiceFileName+".updateByPrimaryKeySelective("+tableName+"); \n");
        entityStr.append("   } \n\n");
        sealMethodNotes(tableName,entityStr,"主键查询");
        entityStr.append("   @RequestMapping(value=\"/selectByPrimaryKey\",method=RequestMethod.GET) \n");
        entityStr.append("   public PigZhuLan selectByPrimaryKey("+entityFileName+" "+tableName+") { \n");
        entityStr.append("        if("+tableName+".get"+maxPrimarykey+"()==null || "+tableName+".get"+maxPrimarykey+"()==\"\"){ \n");
        entityStr.append("            return null; \n");
        entityStr.append("        } \n");
        entityStr.append("        return "+minServiceFileName+".selectByPrimaryKey("+tableName+"); \n");
        entityStr.append("   } \n\n");
        sealMethodNotes(tableName,entityStr,"查询");
        entityStr.append("   @RequestMapping(value=\"/selectSelective\",method=RequestMethod.GET) \n");
        entityStr.append("   public List<"+entityFileName+"> selectSelective("+entityFileName+" "+tableName+"){ \n");
        entityStr.append("        return "+minServiceFileName+".selectSelective("+tableName+"); \n");
        entityStr.append("   } \n\n");
        sealMethodNotes(tableName,entityStr,"模糊查询");
        entityStr.append("   @RequestMapping(value=\"/selectLikeSelective\",method=RequestMethod.GET) \n");
        entityStr.append("   public List<"+entityFileName+"> selectLikeSelective("+entityFileName+" "+tableName+"){ \n");
        entityStr.append("        return "+minServiceFileName+".selectLikeSelective("+tableName+"); \n");
        entityStr.append("   } \n\n");
        entityStr.append("}");
        return entityStr;
    }
}
