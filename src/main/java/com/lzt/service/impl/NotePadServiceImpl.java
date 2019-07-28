package com.lzt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.NotePadMapper;
import com.lzt.entity.NotePad;
import com.lzt.service.NotePadService;
@Service
public class NotePadServiceImpl implements NotePadService {
	
	@Autowired(required=false)
	private NotePadMapper notePadMapper;
	public Integer addNotePad(NotePad notePad) {
		// TODO Auto-generated method stub
		int i = notePadMapper.insertSelective(notePad);
		return i;
	}
	public List<NotePad> notePadSel() {
		// TODO Auto-generated method stub
		List<NotePad> list = notePadMapper.notePadSel();
		return list;
	}

}
