package com.lzt.dao;

import java.util.List;

import com.lzt.entity.Sku;

public interface SkuMapper {
    int deleteByPrimaryKey(String skuId);

    int insert(Sku record);

    int insertSelective(Sku record);

    Sku selectByPrimaryKey(String skuId);

    int updateByPrimaryKeySelective(Sku record);

    int updateByPrimaryKey(Sku record);

	List<Sku> selectSkuAll();
}