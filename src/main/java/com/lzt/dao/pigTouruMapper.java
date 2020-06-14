package com.lzt.dao;

import com.lzt.entity.pigTouru;

public interface pigTouruMapper {
    int deleteByPrimaryKey(String trId);

    int insert(pigTouru record);

    int insertSelective(pigTouru record);

    pigTouru selectByPrimaryKey(String trId);

    int updateByPrimaryKeySelective(pigTouru record);

    int updateByPrimaryKey(pigTouru record);
}