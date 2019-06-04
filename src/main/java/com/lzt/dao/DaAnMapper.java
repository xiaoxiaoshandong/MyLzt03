package com.lzt.dao;

import com.lzt.entity.DaAn;

public interface DaAnMapper {
    int deleteByPrimaryKey(String ansId);

    int insert(DaAn record);

    int insertSelective(DaAn record);

    DaAn selectByPrimaryKey(String ansId);

    int updateByPrimaryKeySelective(DaAn record);

    int updateByPrimaryKey(DaAn record);
}