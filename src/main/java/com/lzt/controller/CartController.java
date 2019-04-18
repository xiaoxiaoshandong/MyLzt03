package com.lzt.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.lzt.service.CartService;
import com.lzt.myutils.CookieUtil;
import com.lzt.myutils.JwtToken;
@RestController  
@RequestMapping("/cart") 
public class CartController {
	
	@Autowired(required=false)
	private CartService cartService;
	
	private static Logger log=LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value="/addCart")  
	public Integer addCart(String skuId,HttpServletRequest request,HttpServletResponse response){
		//验证用户是否登录  未登录 存入cookie  已登录 存入数据库 
		Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
		Cookie tokenCookie = cookieMap.get("login_token_id");
		if(tokenCookie == null){
			
		}
		/*JwtToken.verifyToken(login_token_id);*/
		return null;
	}
}
