package com.lzt.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.ShiJuanMapper;
import com.lzt.dao.UserTMapper;
import com.lzt.dao.WenTiMapper;
import com.lzt.entity.KsrDaAn;
import com.lzt.entity.KsrDaAnVo;
import com.lzt.entity.UserT;
import com.lzt.entity.WenTi;
import com.lzt.myexception.TokenException;
import com.lzt.myutils.CookieUtil;
import com.lzt.myutils.DateUtil;
import com.lzt.myutils.JwtToken;
import com.lzt.myutils.MyId;
import com.lzt.service.ShiJuanService;
import com.lzt.service.UserService;
@Service
public class ShiJuanServiceImpl implements ShiJuanService {
	
	@Autowired(required=false)
	private UserTMapper userTMapper;
	@Autowired(required=false)
	private WenTiMapper wenTiMapper;
	@Autowired(required=false)
	private ShiJuanMapper shiJuanMapper;
	
	public HashMap<String,Object> prodShiJuan(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		// 获取用户名称
				Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
				Cookie tokenCookie = cookieMap.get("login_token_id");
				if(tokenCookie == null){ //用户未登录 返回0；禁止生成试卷
					 map.put("key", "0");
					 return map;
				}
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
				
				//随机选择 10个选择题 
				List<WenTi> xzList = wenTiMapper.selectByRand("1","10");
				//随机选择 5个问答题 
				List<WenTi> wdList = wenTiMapper.selectByRand("2","5");
				//随机选择 1个大题 
				List<WenTi> dtList = wenTiMapper.selectByRand("3","1");
				// 题目库中题的数量不够禁止生成试卷
				if(xzList.size()<10 || wdList.size()<5 || dtList.size()<1){
					 map.put("key", "1");
					 return map;
				}
				// 查看试卷是多少期
				Integer num =  shiJuanMapper.selMaxByksrId(userId);
				if(num==null){
					num=1;
				}else{
					num = num+1;
				}
				map.put("ksrName", ksrName);
				map.put("xzList", xzList);
				map.put("wdList", wdList);
				map.put("dtList", dtList);
				map.put("num", num);
		return map;
	}

	public Map<String, Object> submitShiJuan(KsrDaAnVo ksrDaAnVo) {
		// TODO Auto-generated method stub
		List<KsrDaAnVo> list = new ArrayList<KsrDaAnVo>();
		String sjId = MyId.getMyId();
		KsrDaAn daAn = new KsrDaAn();
		daAn.setKdaId(MyId.getMyId());
		daAn.setSjId(sjId);
		daAn.setQuestId(ksrDaAnVo.getXzQuestId1());
		daAn.setKsrContent(ksrDaAnVo.getXzContent1());
		Date date = DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss");
		daAn.setCreateTime(date);
		daAn.setUpdateTime(date);
		daAn.setKsrQuestType("1");
		return null;
	}
	
	
	
}
