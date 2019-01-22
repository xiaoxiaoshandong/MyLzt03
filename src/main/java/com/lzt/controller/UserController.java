package com.lzt.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lzt.entity.UserT;
import com.lzt.service.UserService;

@RestController  
@RequestMapping("/user") 
public class UserController {
	
	@Autowired(required=false)
	private UserService userService;
	
	private static Logger log=LoggerFactory.getLogger(UserController.class);
	
	
	@RequestMapping(value="/test")  
    public String test(UserT user){ 
		if(user.getUserName()==null || user.getPassword()==null){
			return "0";
		}
		UserT us = userService.selectUser(user);
		if(us==null){
			return "0";
		}
		return "1";
    } 
	
	/**
	 * 
	 * @param user
	 * @return 0:×¢²áÊ§°Ü 1£º×¢²á³É¹¦
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
