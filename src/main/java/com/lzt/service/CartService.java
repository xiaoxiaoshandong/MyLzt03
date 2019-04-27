package com.lzt.service;

import com.lzt.entity.Cart;

public interface CartService {

	public Cart selectByColumn(Cart cart);

	public int insertSelective(Cart cart2);

}
