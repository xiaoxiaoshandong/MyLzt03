package com.lzt.service;

import com.lzt.entity.CartProd;

public interface CartProdService {

	public Integer insertCartProd(CartProd cartProd);

	
	public Integer updateCartProd(CartProd cartProd);


	public CartProd selectByColumn(CartProd prod);


	public int addCookieSpToDB(String cookieVal,Integer userId);


	public Integer updCartProd(CartProd prod);


	public Integer delGwcBySkuId(String skuId);


	public Integer cleanGwc(String userId);
	
	public void testSF2()throws Exception;

}
