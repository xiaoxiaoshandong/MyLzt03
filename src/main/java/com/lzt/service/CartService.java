package com.lzt.service;

import com.lzt.entity.Cart;

public interface CartService {

	public Cart selectByColumn(String cartId);

	public int insertSelective(Cart cart2);

}
