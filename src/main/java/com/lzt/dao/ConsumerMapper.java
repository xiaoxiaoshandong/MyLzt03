package com.lzt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lzt.entity.Consumer;

public interface ConsumerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Consumer record);

    int insertSelective(Consumer record);

    Consumer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Consumer record);

    int updateByPrimaryKey(Consumer record);

	List<Consumer> selectConsumerList(@Param("start")String start, @Param("end")String end);

	int selectConsumerSize();
}