package com.lzt.dao;

import com.lzt.entity.pigZhuShe;

public interface pigZhuSheMapper {
    int deleteByPrimaryKey(String zsId);

    int insert(pigZhuShe record);

    int insertSelective(pigZhuShe record);

    pigZhuShe selectByPrimaryKey(String zsId);

    int updateByPrimaryKeySelective(pigZhuShe record);

    int updateByPrimaryKey(pigZhuShe record);
}