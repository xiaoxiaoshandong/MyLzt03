package com.lzt.dao;

import com.lzt.entity.MyGenerator;
import com.lzt.entity.ParamVO;

import java.util.List;

/**
 * @ClassName ColumnsMapper
 * @author li_zhentao
 * @jdkVersion jdk1.7
 * @version
 * @Date 2020年09月25日
 * @Description 字段Dao
 */
public interface MyGeneratorMapper {

    List<MyGenerator> getMyGenerator(ParamVO param);

    MyGenerator getMyGeneratorByPrimaryKey(String table_name);
}
