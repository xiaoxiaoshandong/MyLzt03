package com.lzt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.CartProdMapper;
import com.lzt.entity.CartProd;
import com.lzt.service.CartProdService;
@Service
public class CartProdServiceImpl implements CartProdService {
	@Autowired(required=false)
	private CartProdMapper cartProdMapper;
	
	public Integer insertCartProd(CartProd cartProd) {
		// TODO Auto-generated method stub
		 int i = cartProdMapper.insertSelective(cartProd);
		 return i;
	}
	public CartProd selectSkuId(String cartId) {
		// TODO Auto-generated method stub
		CartProd cp = cartProdMapper.selectByColumn(cartId);
		return cp;
	}
	public Integer updateCartProd(CartProd cartProd) {
		// TODO Auto-generated method stub
		int i = cartProdMapper.updateByPrimaryKeySelective(cartProd);
		return i;
	}
	
}
