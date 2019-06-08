package com.lzt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lzt.entity.KsrDaAn;
import com.lzt.entity.ShiJuan;
import com.lzt.entity.ShiJuanVo;

public interface ShiJuanMapper {
    int deleteByPrimaryKey(String sjId);

    int insert(ShiJuan record);

    int insertSelective(ShiJuan record);

    ShiJuan selectByPrimaryKey(String sjId);

    int updateByPrimaryKeySelective(ShiJuan record);

    int updateByPrimaryKey(ShiJuan record);

	Integer selMaxByksrId(@Param("ksrId")Integer userId);

	List<ShiJuan> selByKsrSjNum(String ksrId);

	List<ShiJuanVo> selBysjId(String sjId);

}