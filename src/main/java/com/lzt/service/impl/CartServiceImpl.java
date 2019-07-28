package com.lzt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lzt.dao.CartMapper;
import com.lzt.dao.CartProdMapper;
import com.lzt.entity.Cart;
import com.lzt.entity.CartProd;
import com.lzt.myutils.MyId;
import com.lzt.service.CartProdService;
import com.lzt.service.CartService;
@Service
public class CartServiceImpl implements CartService {
	@Autowired(required=false)
	private CartMapper cartMapper;
	@Autowired(required=false)
	private CartProdService cartProdService;
	
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
	
	@Transactional(propagation=Propagation.REQUIRED ,rollbackFor=Exception.class)
	public void testSF() throws Exception {
		// TODO Auto-generated method stub
		Cart cart3 = new Cart();
		cart3.setCartId(MyId.getMyId());
		cart3.setUserId("1");
		cart3.setAddressId("2");
		cartMapper.insertSelective(cart3);
		cartProdService.testSF2();
		
	}

	
	
	
}
