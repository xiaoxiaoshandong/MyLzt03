package com.lzt.dao;

import com.lzt.entity.SkuShuxingS;

public interface SkuShuxingSMapper {
    int deleteByPrimaryKey(String skuShuxingSId);

    int insert(SkuShuxingS record);

    int insertSelective(SkuShuxingS record);

    SkuShuxingS selectByPrimaryKey(String skuShuxingSId);

    int updateByPrimaryKeySelective(SkuShuxingS record);

    int updateByPrimaryKey(SkuShuxingS record);
}