package com.lzt.dao;

import com.lzt.entity.Cart;

public interface CartMapper {
    int deleteByPrimaryKey(String cartId);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(String cartId);
    
    Cart selectByColumn(Cart cart);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
}