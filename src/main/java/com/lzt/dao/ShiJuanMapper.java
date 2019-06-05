package com.lzt.dao;

import org.apache.ibatis.annotations.Param;

import com.lzt.entity.ShiJuan;

public interface ShiJuanMapper {
    int deleteByPrimaryKey(String sjId);

    int insert(ShiJuan record);

    int insertSelective(ShiJuan record);

    ShiJuan selectByPrimaryKey(String sjId);

    int updateByPrimaryKeySelective(ShiJuan record);

    int updateByPrimaryKey(ShiJuan record);

	Integer selMaxByksrId(@Param("ksrId")Integer userId);
}