package com.lzt.dao;

import com.lzt.entity.Sku;

public interface SkuMapper {
    int deleteByPrimaryKey(String skuId);

    int insert(Sku record);

    int insertSelective(Sku record);

    Sku selectByPrimaryKey(String skuId);

    int updateByPrimaryKeySelective(Sku record);

    int updateByPrimaryKey(Sku record);
}