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
	 * 鐢ㄦ埛鐧诲綍
	 * @param user 鐢ㄦ埛淇℃伅
	 * @return 0:璐﹀彿鎴栧瘑鐮侀敊璇� 1锛氱櫥褰曟垚鍔� -1:cookie鍟嗗搧鍏ュ簱澶辫触
	 */
	@RequestMapping(value="/login")  
    public String login(UserT user,HttpServletResponse response,HttpServletRequest request){ 
		String token = null;
		int acstdb = -1;
		if(user.getUserName()==null || user.getPassword()==null){
			return "0";
		}
		UserT us = userService.selectUser(user);
		if(us==null){
			return "0";
		}
		Integer userId = us.getId();
		/*鐧诲綍鎴愬姛 鐢熸垚token*/
		try {
			 token = JwtToken.createToken(userId.longValue());
			 Cookie tokenCookie = new Cookie("login_token_id", token);
			 // 鍏抽棴娴忚鍣ㄥ氨澶辨晥
			 tokenCookie.setMaxAge(-1);
			 //鍙湪鍚屼竴搴旂敤鏈嶅姟鍣ㄥ唴鍏变韩cookie
			 tokenCookie.setPath("/");
		     response.addCookie(tokenCookie);
		     
		     // 鍒ゆ柇cookie涓槸鍚︽湁鍟嗗搧淇℃伅  鏈夛細娣诲姞杩涙暟鎹簱 娌℃湁锛氫笉鎿嶄綔
		     Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
		     Cookie spCoodie = cookieMap.get("gwcId");
		     if(spCoodie != null){
		    	  String cookieVal = spCoodie.getValue();
		    	  acstdb = cartProdService.addCookieSpToDB(cookieVal,userId);
		    	  if(acstdb ==-1){
		    		  return "-1";
		    	  }else{
		    		  // 娓呯┖cookie涓� 璐墿杞﹀晢鍝佷俊鎭�
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
	 * @return 0:娉ㄥ唽澶辫触
	 */
	@RequestMapping(value="/registered")
	public String registered(UserT user){
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
	
	@RequestMapping(value="/getUser")
	public UserT getUser(){
		UserT userT = new UserT();
		userT.setAge(18);
		userT.setaihao("游泳");
		userT.setId(12313);
		userT.setminzu("汉");
		return userT;
		
	}
		
}
