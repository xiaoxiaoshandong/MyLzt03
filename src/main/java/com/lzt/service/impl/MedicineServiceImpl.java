package com.lzt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.MedicineMapper;
import com.lzt.entity.Medicine;
import com.lzt.service.MedicineService;
@Service
public class MedicineServiceImpl implements MedicineService{
	
	@Autowired(required=false)
	private MedicineMapper medicineMapper;
	public List<Medicine> getMedicineList() {
		// TODO Auto-generated method stub
		 List<Medicine> list  = medicineMapper.getMedicineList();
		return list;
	}

}
