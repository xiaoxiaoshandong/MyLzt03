package com.lzt.service;

import javax.servlet.http.Cookie;

import com.lzt.entity.CartProd;

public interface CartProdService {

	public Integer insertCartProd(CartProd cartProd);

	
	public Integer updateCartProd(CartProd cartProd);


	public CartProd selectByColumn(CartProd prod);


	public int addCookieSpToDB(String cookieVal);

}
