package com.lzt.dao;

import com.lzt.entity.pigMaoLirun;

public interface pigMaoLirunMapper {
    int deleteByPrimaryKey(String mlrId);

    int insert(pigMaoLirun record);

    int insertSelective(pigMaoLirun record);

    pigMaoLirun selectByPrimaryKey(String mlrId);

    int updateByPrimaryKeySelective(pigMaoLirun record);

    int updateByPrimaryKey(pigMaoLirun record);
}