package com.lzt.dao;

import java.util.List;

import com.lzt.entity.Shuxing;

public interface ShuxingMapper {
    int deleteByPrimaryKey(Integer shuxingId);

    int insert(Shuxing record);

    int insertSelective(Shuxing record);

    Shuxing selectByPrimaryKey(String shuxingId);

    int updateByPrimaryKeySelective(Shuxing record);

    int updateByPrimaryKey(Shuxing record);

    List<Shuxing> selectByAll(Shuxing shuxing);

}