package com.lzt.service;

import com.lzt.entity.CartProd;

public interface CartProdService {

	public Integer insertCartProd(CartProd cartProd);

	
	public Integer updateCartProd(CartProd cartProd);


	public CartProd selectByColumn(CartProd prod);

}
