package com.lzt.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lzt.dao.DaAnMapper;
import com.lzt.dao.WenTiMapper;
import com.lzt.entity.DaAn;
import com.lzt.entity.WenTi;
import com.lzt.myutils.DateUtil;
import com.lzt.myutils.MyId;
import com.lzt.service.WenTiService;
@Service
public class WenTiServiceImpl implements WenTiService {
	
	@Autowired(required=false)
	private WenTiMapper wenTiMapper;
	@Autowired(required=false)
	private DaAnMapper daAnMapper;
	
	@Transactional(rollbackFor = Exception.class)
	public Integer addWenTi(WenTi wt, String ansContent) {
		// TODO Auto-generated method stub
		String questId = MyId.getMyId();
		wt.setQuestId(questId);
		Date date = DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss");
		wt.setCreateTime(date);
		wt.setUpdateTime(date);
		Integer i = wenTiMapper.insertSelective(wt);
		if(i==0){
			throw new RuntimeException("添加题目异常！");
		}
		DaAn daAn = new DaAn();
		daAn.setAnsId(MyId.getMyId());
		daAn.setAnsContent(ansContent);
		daAn.setQuestId(questId);
		daAn.setCreateTime(date);
		daAn.setUpdateTime(date);
		int j = daAnMapper.insertSelective(daAn);
		if(j==0){
			throw new RuntimeException("添加答案异常！");
		}
		return 1;
	}
	
}
