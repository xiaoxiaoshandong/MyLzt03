package com.lzt.controller;

import java.util.Date;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
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
import com.lzt.myutils.DateUtil;
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
		Cookie spCoodie = cookieMap.get("gwcId");
		String gwcVal = null;
		if(tokenCookie == null){//用户 未登录
			Cookie cookie =null;
			if(spCoodie==null){// 没有购物车信息
				gwcVal=skuId+"="+num;
				cookie = new Cookie("gwcId",gwcVal);
			}else{ //有购物车 信息
				
				String gwcVals = spCoodie.getValue();
				/*String[] gwcList = gwcVals.split(",");
				for (String str : gwcList) {
					String cookieSkuId = StringUtils.substringBefore(str, "=");
					String cookieNum = StringUtils.substringAfter(str, "=");
					if(cookieSkuId.equals(skuId)){ // 被添加的商品在cooKie 里存在  更新数量
						int parseInt = Integer.parseInt(cookieNum);
						int sum1 = parseInt+num;
					}else{ // 被添加的商品在cookie 里不存在 添加
						
					}
				}*/
				
				int newNum = Integer.parseInt(num1)+num;
				gwcVal=skuId+"="+newNum;
				String gwcVals = spCoodie.getValue();
				gwcVal = gwcVals+","+gwcVal;
				cookie = new Cookie("gwcId",gwcVal);
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
			Cart cart2 = new Cart();
			cart2.setUserId(userId+"");
			Cart cart = cartService.selectByColumn(cart2);
			String cartId = cart.getCartId();
			if(cartId == null ){
				return 0;
			}
			// 查询此商品是否存在 存在：更新 不存在：添加
			CartProd prod = new CartProd();
			prod.setSkuId(skuId);
			CartProd cp= cartProdService.selectByColumn(prod);
			if(cp == null){
				CartProd cartProd = new CartProd();
				cartProd.setCpId(MyId.getMyId());
				cartProd.setCartId(cartId);
				cartProd.setSkuId(skuId);
				Date date = DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss");
				cartProd.setCreateTime(date);
				cartProd.setNum(num);
				Integer cps = cartProdService.insertCartProd(cartProd);
				if(cps==0){
					return 0;
				}
			}else{
				String cpId = cp.getCpId();
				CartProd cartProd = new CartProd();
				cartProd.setCpId(cpId);
				Date date = DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss");
				cartProd.setUpdateTime(date);
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
