package com.lzt.service;

import com.lzt.entity.CartProd;

public interface CartProdService {

	public Integer insertCartProd(CartProd cartProd);

	public CartProd selectSkuId(String cartId);

	public Integer updateCartProd(CartProd cartProd);

}
