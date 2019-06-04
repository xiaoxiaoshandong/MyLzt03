package com.lzt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lzt.entity.WenTi;

public interface WenTiMapper {
    int deleteByPrimaryKey(String questId);

    int insert(WenTi record);

    int insertSelective(WenTi record);

    WenTi selectByPrimaryKey(String questId);

    int updateByPrimaryKeySelective(WenTi record);

    int updateByPrimaryKey(WenTi record);

	List<WenTi> selectByRand(@Param("questType") String questType ,@Param("num") String num );
}