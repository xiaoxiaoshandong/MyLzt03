package com.lzt.dao;

import java.util.List;

import com.lzt.entity.NotePad;

public interface NotePadMapper {
    int deleteByPrimaryKey(String npId);

    int insert(NotePad record);

    int insertSelective(NotePad record);

    NotePad selectByPrimaryKey(String npId);

    int updateByPrimaryKeySelective(NotePad record);

    int updateByPrimaryKey(NotePad record);

	List<NotePad> notePadSel();
}