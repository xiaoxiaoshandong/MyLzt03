package com.lzt.dao;

import com.lzt.entity.UserT;

public interface UserTMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserT record);

    int insertSelective(UserT record);

    UserT selectByPrimaryKey(UserT user);

    int updateByPrimaryKeySelective(UserT record);

    int updateByPrimaryKey(UserT record);
}