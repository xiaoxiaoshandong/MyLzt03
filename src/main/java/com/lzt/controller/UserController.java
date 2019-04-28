package com.lzt.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lzt.entity.CartProd;
import com.lzt.entity.UserT;
import com.lzt.myutils.CookieUtil;
import com.lzt.myutils.JwtToken;
import com.lzt.service.CartProdService;
import com.lzt.service.UserService;

@RestController  
@RequestMapping("/user") 
public class UserController {
	
	@Autowired(required=false)
	private UserService userService;
	@Autowired(required=false)
	private CartProdService cartProdService;
	
	private static Logger log=LoggerFactory.getLogger(UserController.class);
	
	/**
	 * 用户登录
	 * @param user 用户信息
	 * @return 0:账号或密码错误 1：登录成功 -1:cookie商品入库失败
	 */
	@RequestMapping(value="/login")  
    public String test(UserT user,HttpServletResponse response,HttpServletRequest request){ 
		String token = null;
		int acstdb = -1;
		if(user.getUserName()==null || user.getPassword()==null){
			return "0";
		}
		UserT us = userService.selectUser(user);
		if(us==null){
			return "0";
		}
		/*登录成功 生成token*/
		try {
			 token = JwtToken.createToken(us.getId().longValue());
			 Cookie tokenCookie = new Cookie("login_token_id", token);
			 // 关闭浏览器就失效
			 tokenCookie.setMaxAge(-1);
			 //可在同一应用服务器内共享cookie
			 tokenCookie.setPath("/");
		     response.addCookie(tokenCookie);
		     
		     // 用户ID 放入session
		     Integer id = us.getId();
		     request.getSession().setAttribute("userId", id+"");
		     
		     // 判断cookie中是否有商品信息  有：添加进数据库 没有：不操作
		     Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
		     Cookie spCoodie = cookieMap.get("gwcId");
		     if(spCoodie != null){
		    	  String cookieVal = spCoodie.getValue();
		    	  acstdb = cartProdService.addCookieSpToDB(cookieVal);
		    	  if(acstdb ==-1){
		    		  return "-1";
		    	  }else{
		    		  // 清空cookie中 购物车商品信息
		    		  Cookie cookie = new Cookie("gwcId","");
		    		  cookie.setMaxAge(0);
		    		  cookie.setPath("/");
		  			  response.addCookie(cookie);
		    	  }
		     }
		     
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "1";
    } 
	
	/**
	 * 
	 * @param user
	 * @return 0:注册失败
	 */
	@RequestMapping(value="/registered")
	public String registered(UserT user){
		System.out.print("user"+user);
		if(StringUtils.isEmpty(user) || user.getUserName()== null || user.getUserName() == ""){
			return "0";
		}
		UserT u = new UserT();
		u.setUserName(user.getUserName());
		UserT us = userService.selectUser(u);
		if(us== null){
			Integer integer = userService.insertUserT(user);
			if(integer == 0){
				return "0";
			}else{
				return "1";
			}
		}
		return "0";
	}
}
