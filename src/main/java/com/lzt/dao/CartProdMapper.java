package com.lzt.dao;


import com.lzt.entity.CartProd;

public interface CartProdMapper {
    int deleteBySkuId(String skuId);

    int insert(CartProd record);

    int insertSelective(CartProd record);

    CartProd selectByPrimaryKey(String cpId);

    int updateByPrimaryKeySelective(CartProd record);

    int updateByPrimaryKey(CartProd record);

	CartProd selectByColumn(CartProd csartProd);

	Integer cleanGwc(String userId);
}