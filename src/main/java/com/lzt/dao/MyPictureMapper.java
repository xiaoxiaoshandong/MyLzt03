package com.lzt.dao;

import com.lzt.entity.MyPicture;

public interface MyPictureMapper {
    int deleteByPrimaryKey(String picId);

    int insert(MyPicture record);

    int insertSelective(MyPicture record);

    MyPicture selectByPrimaryKey(String picId);

    int updateByPrimaryKeySelective(MyPicture record);

    int updateByPrimaryKey(MyPicture record);
}