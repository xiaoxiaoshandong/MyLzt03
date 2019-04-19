package com.lzt.controller;

import java.util.Date;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.lzt.service.CartProdService;
import com.lzt.service.CartService;
import com.lzt.entity.Cart;
import com.lzt.entity.CartProd;
import com.lzt.myexception.TokenException;
import com.lzt.myutils.CookieUtil;
import com.lzt.myutils.JwtToken;
import com.lzt.myutils.MyId;
@RestController  
@RequestMapping("/cart") 
public class CartController {
	
	@Autowired(required=false)
	private CartService cartService;
	@Autowired(required=false)
	private CartProdService cartProdService;
	private static Logger log=LoggerFactory.getLogger(CartController.class);
	
	/**
	 * 
	 * @param skuId
	 * @param num
	 * @param request
	 * @param response
	 * @return  1:购物车添加成功  0：购物车添加失败
	 */
	@RequestMapping(value="/addCart")  
	public Integer addCart(String skuId,Integer num,HttpServletRequest request,HttpServletResponse response){
		//验证用户是否登录  未登录 存入cookie  已登录 存入数据库 
		Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
		Cookie tokenCookie = cookieMap.get("login_token_id");
		Cookie spCoodie = cookieMap.get(skuId);
		if(tokenCookie == null){
			Cookie cookie =null;
			if(spCoodie==null){
				cookie = new Cookie(skuId,num+"");
			}else{
				String num1 = spCoodie.getValue();
				int newNum = Integer.parseInt(num1)+num;
				cookie = new Cookie(skuId,newNum+"");
			}
			// 关闭浏览器就失效
			cookie.setMaxAge(-1);
			 //可在同一应用服务器内共享cookie
			cookie.setPath("/");
			response.addCookie(cookie);
		}else{
			//获取用户ID
			String token = tokenCookie.getValue();
			Integer userId=null;
			try {
				userId = JwtToken.getAppUID(token);
			} catch (TokenException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//获取购物车ID 并添加购物车商品信息
			
			Cart cart = cartService.selectByColumn(userId+"");
			String cartId = cart.getCartId();
			if(cartId == null ){
				return 0;
			}
			// 查询此商品是否存在 存在：更新 不存在：添加
			CartProd cp= cartProdService.selectSkuId(cartId);
			if(cp.getSkuId() == null){
				CartProd cartProd = new CartProd();
				cartProd.setCpId(MyId.getMyId());
				cartProd.setCartId(cartId);
				cartProd.setSkuId(skuId);
				cartProd.setCreateTime(new Date());
				cartProd.setNum(num);
				Integer cps = cartProdService.insertCartProd(cartProd);
				if(cps==0){
					return 0;
				}
			}else{
				
				CartProd cartProd = new CartProd();
				cartProd.setUpdateTime(new Date());
				Integer num2 = cp.getNum();
				cartProd.setNum(num2+1);
				Integer ucp = cartProdService.updateCartProd(cartProd);
				if(ucp==0){
					return 0;
				}
			}
			
		}
		return 1;
	}
}