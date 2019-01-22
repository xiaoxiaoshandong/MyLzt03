package com.lzt.dao;

import java.util.List;

import com.lzt.entity.ShuxingS;

public interface ShuxingSMapper {
    int deleteByPrimaryKey(Integer shuxingSId);

    int insert(ShuxingS record);

    int insertSelective(ShuxingS record);

    ShuxingS selectByPrimaryKey(Integer shuxingSId);

    int updateByPrimaryKeySelective(ShuxingS record);

    int updateByPrimaryKey(ShuxingS record);

	List<ShuxingS> selectByAll(ShuxingS shuxingS);
}