package com.lzt.dao;

import com.lzt.entity.KsrDaAn;

public interface KsrDaAnMapper {
    int deleteByPrimaryKey(String kdaId);

    int insert(KsrDaAn record);

    int insertSelective(KsrDaAn record);

    KsrDaAn selectByPrimaryKey(String kdaId);

    int updateByPrimaryKeySelective(KsrDaAn record);

    int updateByPrimaryKey(KsrDaAn record);
}