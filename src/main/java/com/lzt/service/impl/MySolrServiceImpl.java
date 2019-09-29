package com.lzt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.SkuMapper;
import com.lzt.entity.Sku;
import com.lzt.myutils.SolrUtils;
import com.lzt.service.MySolrService;
@Service
public class MySolrServiceImpl implements MySolrService {
	@Autowired(required=false)
	 private SkuMapper skuMapper;
	 
	 
	public Integer addSolr() throws Exception{
		// TODO Auto-generated method stub
		
		/*// 查询sku商品信息
		List<Sku> skuList =  skuMapper.selectSkuAll();
		
		SolrUtils.addDoc(skuList);*/
		return 1;
	}
	 
	 
	 
	 
}
