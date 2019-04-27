package com.lzt.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lzt.dao.CartMapper;
import com.lzt.dao.UserTMapper;
import com.lzt.entity.Cart;
import com.lzt.entity.UserT;
import com.lzt.myutils.DateUtil;
import com.lzt.myutils.MyId;
import com.lzt.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Autowired(required=false)
	private UserTMapper userTMapper;
	@Autowired(required=false)
	private CartMapper cartMapper;
	public UserT selectUser(UserT user) {
		// TODO Auto-generated method stub
		UserT userT  = userTMapper.selectByPrimaryKey(user);
		return userT;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Integer insertUserT(UserT user){
		// TODO Auto-generated method stub
		Integer u = userTMapper.insertSelective(user);
		if(u==0){
			throw new RuntimeException("添加用户信息异常！");
		}
		
		// 创建用户的购物车信息
		UserT userT = new UserT();
		userT.setUserName(user.getUserName());
		UserT user2 = userTMapper.selectByPrimaryKey(userT);
		Integer userId = user2.getId();
		Cart cart = new Cart();
		cart.setCartId(MyId.getMyId());
		Date date = DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss");
		cart.setCreateTime(date);
		cart.setUserId(userId+"");
		int i = cartMapper.insertSelective(cart);
		if(i==0){
			throw new RuntimeException("添加购物车信息异常！");
		}
		return u;
	}

}
