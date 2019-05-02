package com.lzt.service;

import java.util.List;

import javax.servlet.http.Cookie;

import com.lzt.entity.CartProd;
import com.lzt.entity.ProdVo;

public interface CartProdService {

	public Integer insertCartProd(CartProd cartProd);

	
	public Integer updateCartProd(CartProd cartProd);


	public CartProd selectByColumn(CartProd prod);


	public int addCookieSpToDB(String cookieVal);

}
