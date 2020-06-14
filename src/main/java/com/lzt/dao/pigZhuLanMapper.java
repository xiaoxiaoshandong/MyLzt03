package com.lzt.dao;

import com.lzt.entity.pigZhuLan;

public interface pigZhuLanMapper {
    int deleteByPrimaryKey(String zlId);

    int insert(pigZhuLan record);

    int insertSelective(pigZhuLan record);

    pigZhuLan selectByPrimaryKey(String zlId);

    int updateByPrimaryKeySelective(pigZhuLan record);

    int updateByPrimaryKey(pigZhuLan record);
}