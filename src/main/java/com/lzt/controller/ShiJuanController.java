package com.lzt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.lzt.entity.ShiJuan;
import com.lzt.entity.ShiJuanVo;
import com.lzt.myexception.TokenException;
import com.lzt.myutils.CookieUtil;
import com.lzt.myutils.JwtToken;
import com.lzt.service.ShiJuanService;
@RestController  
@RequestMapping("/shijuan") 
public class ShiJuanController {
	
	@Autowired(required=false)
	private ShiJuanService shiJuanService;
	private static Logger log=LoggerFactory.getLogger(ShiJuanController.class);
	
	/**
	 * 
	 * @param request
	 * @return  1:成功 0：失败
	 */
	@RequestMapping(value="/prodShiJuan")  
	public HashMap<String,Object> prodShiJuan(HttpServletRequest request){
		HashMap<String,Object> map = shiJuanService.prodShiJuan(request);
		return map;
	}
	
	
	@RequestMapping(value="/selByKsrSjNum")  
	public List<ShiJuan> selByKsrSjNum(HttpServletRequest request){
		Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
		Cookie tokenCookie = cookieMap.get("login_token_id");
		//获取用户ID
		String token = tokenCookie.getValue();
		Integer userId=null;
		try {
			userId = JwtToken.getAppUID(token);
		} catch (TokenException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<ShiJuan> list = shiJuanService.selByKsrSjNum(userId);
		return list;
	}
	
	@RequestMapping(value="/selBysjId")  
	public ModelAndView selBysjId(String sjId){
		ModelAndView mav =new ModelAndView();
		List<ShiJuanVo> sjv = shiJuanService.selBysjId(sjId);
		mav.setViewName("forward:/jsp/examSel.jsp");
		mav.addObject("sjv", sjv);
		return mav;
	}
}
