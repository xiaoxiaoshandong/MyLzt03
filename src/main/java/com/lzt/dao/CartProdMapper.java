package com.lzt.dao;

import java.util.List;

import com.lzt.entity.CartProd;
import com.lzt.entity.ProdVo;

public interface CartProdMapper {
    int deleteByPrimaryKey(String cpId);

    int insert(CartProd record);

    int insertSelective(CartProd record);

    CartProd selectByPrimaryKey(String cpId);

    int updateByPrimaryKeySelective(CartProd record);

    int updateByPrimaryKey(CartProd record);

	CartProd selectByColumn(CartProd csartProd);
}