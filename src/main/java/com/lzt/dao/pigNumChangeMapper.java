package com.lzt.dao;

import com.lzt.entity.pigNumChange;

public interface pigNumChangeMapper {
    int deleteByPrimaryKey(String ncId);

    int insert(pigNumChange record);

    int insertSelective(pigNumChange record);

    pigNumChange selectByPrimaryKey(String ncId);

    int updateByPrimaryKeySelective(pigNumChange record);

    int updateByPrimaryKey(pigNumChange record);
}