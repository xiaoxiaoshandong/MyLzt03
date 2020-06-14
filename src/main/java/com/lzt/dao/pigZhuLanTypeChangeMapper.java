package com.lzt.dao;

import com.lzt.entity.pigZhuLanTypeChange;

public interface pigZhuLanTypeChangeMapper {
    int deleteByPrimaryKey(String pzltcId);

    int insert(pigZhuLanTypeChange record);

    int insertSelective(pigZhuLanTypeChange record);

    pigZhuLanTypeChange selectByPrimaryKey(String pzltcId);

    int updateByPrimaryKeySelective(pigZhuLanTypeChange record);

    int updateByPrimaryKey(pigZhuLanTypeChange record);
}