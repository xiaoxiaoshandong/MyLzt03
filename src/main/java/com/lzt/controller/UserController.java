package com.lzt.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lzt.entity.UserT;
import com.lzt.myutils.JwtToken;
import com.lzt.service.UserService;

@RestController  
@RequestMapping("/user") 
public class UserController {
	
	@Autowired(required=false)
	private UserService userService;
	
	private static Logger log=LoggerFactory.getLogger(UserController.class);
	
	/**
	 * 用户登录
	 */
	@RequestMapping(value="/login")  
    public String test(UserT user,HttpServletResponse response){ 
		String token = null;
		if(user.getUserName()==null || user.getPassword()==null){
			return "0";
		}
		UserT us = userService.selectUser(user);
		/*登录成功 生成token*/
		try {
			 token = JwtToken.createToken(us.getId().longValue());
			 Cookie tokenCookie = new Cookie("login_token_id", token);
			 // 关闭浏览器就失效
			 tokenCookie.setMaxAge(-1);
			 //可在同一应用服务器内共享cookie
			 tokenCookie.setPath("/");
		     response.addCookie(tokenCookie);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(us==null){
			return "0";
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
