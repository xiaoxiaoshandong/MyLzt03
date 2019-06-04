package com.lzt.service.impl;


import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.UserTMapper;
import com.lzt.dao.WenTiMapper;
import com.lzt.entity.UserT;
import com.lzt.entity.WenTi;
import com.lzt.myexception.TokenException;
import com.lzt.myutils.CookieUtil;
import com.lzt.myutils.JwtToken;
import com.lzt.service.ShiJuanService;
import com.lzt.service.UserService;
@Service
public class ShiJuanServiceImpl implements ShiJuanService {
	
	@Autowired(required=false)
	private UserTMapper userTMapper;
	@Autowired(required=false)
	private WenTiMapper wenTiMapper;
	
	public Integer addShiJuan(HttpServletRequest request) {
		// TODO Auto-generated method stub
		// 获取用户名称
				Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
				Cookie tokenCookie = cookieMap.get("login_token_id");
				String token = tokenCookie.getValue();
				Integer userId=null;
				try {
					userId = JwtToken.getAppUID(token);
				} catch (TokenException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				UserT user = new UserT();
				user.setId(userId);
				UserT t = userTMapper.selectByPrimaryKey(user);
				String ksrName = t.getUserName();
				
			//随机选择 10个选择题 5个问答题 1个大题
				List<WenTi> xzList = wenTiMapper.selectByRand("1","10");
		return null;
	}
	
}
