package com.lzt.service.impl;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lzt.dao.SkuMapper;
import com.lzt.dao.SkuShuxingSMapper;
import com.lzt.entity.Sku;
import com.lzt.entity.SkuShuxingS;
import com.lzt.myutils.MyId;
import com.lzt.service.SkuService;
@Service
public class SkuServiceImpl implements SkuService {
	
	@Autowired(required=false)
	private SkuMapper skuMapper;
	@Autowired(required=false)
	private SkuShuxingSMapper skuShuxingSMapper;
	
	@Transactional(rollbackFor = Exception.class)
	public Integer insertSku(String spuId,String skuName, Integer kucun, BigDecimal jiage, String shuxingSId) {
		// TODO Auto-generated method stub
		String myId = MyId.getMyId();
		Sku sku = new Sku();
		sku.setSkuId(myId);
		sku.setSpuId(spuId);
		sku.setSkuName(skuName);
		sku.setKucun(kucun);
		sku.setJiage(jiage);
		int i = skuMapper.insertSelective(sku);
		if(i==0){
			throw new RuntimeException("添加sku失败！");
		}
		
		String[] split = shuxingSId.split(",");
		for(String spl:split){
			SkuShuxingS skuShuxingS = new SkuShuxingS();
			skuShuxingS.setSkuShuxingSId(MyId.getMyId());
			skuShuxingS.setSkuId(myId);
			skuShuxingS.setShuxingSId(spl);
			int j = skuShuxingSMapper.insertSelective(skuShuxingS);
			if(j==0){
				throw new RuntimeException("添加sku属性值失败！");
			}
		}
		return 1;
	}
	
}
