package com.lzt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.UserTMapper;
import com.lzt.entity.UserT;
import com.lzt.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Autowired(required=false)
	private UserTMapper userTMapper;
	public UserT selectUser(UserT user) {
		// TODO Auto-generated method stub
		UserT userT  = userTMapper.selectByPrimaryKey(user);
		return userT;
	}
	public Integer insertUserT(UserT user) {
		// TODO Auto-generated method stub
		Integer u = userTMapper.insertSelective(user);
		return u;
	}

}
