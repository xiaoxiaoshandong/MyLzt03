package com.lzt.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.ShuxingMapper;
import com.lzt.dao.ShuxingSMapper;
import com.lzt.entity.Shuxing;
import com.lzt.entity.ShuxingS;
import com.lzt.service.ShuxingSService;
@Service
public class ShuxingSServiceImpl implements ShuxingSService {
	@Autowired(required=false)
	private ShuxingSMapper shuxingSMapper;
	@Autowired(required=false)
	private ShuxingMapper shuxingMapper;
	public List<ShuxingS> selectByAll(ShuxingS shuxingS) {
		// TODO Auto-generated method stub
		List<ShuxingS> ss = shuxingSMapper.selectByAll(shuxingS);
		return ss;
	}
	
	public Integer updateShuxingS(ShuxingS shuxingS) {
		// TODO Auto-generated method stub
		int i = shuxingSMapper.updateByPrimaryKeySelective(shuxingS);
		return i;
	}
	
}
