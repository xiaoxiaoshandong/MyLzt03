package com.lzt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lzt.dao.CartMapper;
import com.lzt.entity.Cart;
import com.lzt.service.CartService;
@Service
public class CartServiceImpl implements CartService {
	@Autowired(required=false)
	private CartMapper cartMapper;
	public Cart selectByColumn(Cart cart) {
		// TODO Auto-generated method stub
		Cart cart1 = cartMapper.selectByColumn(cart);
		return cart1;
	}
	public int insertSelective(Cart cart2) {
		// TODO Auto-generated method stub
		int i = cartMapper.insertSelective(cart2);
		return i;
	}
	
	
}
