package com.lzt.dao;

import com.lzt.entity.WenTi;

public interface WenTiMapper {
    int deleteByPrimaryKey(String questId);

    int insert(WenTi record);

    int insertSelective(WenTi record);

    WenTi selectByPrimaryKey(String questId);

    int updateByPrimaryKeySelective(WenTi record);

    int updateByPrimaryKey(WenTi record);
}