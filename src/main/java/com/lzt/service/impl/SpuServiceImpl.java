package com.lzt.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lzt.dao.MyPictureMapper;
import com.lzt.dao.ShuxingMapper;
import com.lzt.dao.SpuMapper;
import com.lzt.entity.MyPicture;
import com.lzt.entity.ProdVo;
import com.lzt.entity.Shuxing;
import com.lzt.entity.Spu;
import com.lzt.myutils.MyId;
import com.lzt.myutils.UpdateFile;
import com.lzt.service.SpuService;
@Service
public class SpuServiceImpl implements SpuService {
	@Autowired(required=false)
	private SpuMapper spuMapper;
	@Autowired(required=false)
	private MyPictureMapper myPictureMapper;
	@Autowired(required=false)
	private ShuxingMapper shuxingMapper;
	
	@Transactional(rollbackFor = Exception.class)
	public Integer addSpu(List<MultipartFile> list, String erjiId, String chanpinName, HttpServletRequest request) {
		// TODO Auto-generated method stub
		Spu spu = new Spu();
		String myId = MyId.getMyId();
		spu.setSpuId(myId);
		spu.setErjiId(erjiId);
		spu.setChanpinName(chanpinName);
		int insert = spuMapper.insert(spu);
		if(insert==0){
			throw new RuntimeException("添加spu失败!");
		}
		List<String> uploadFile = UpdateFile.uploadFile(list, request);
		for(String file:uploadFile){
			MyPicture myPicture = new MyPicture();
			myPicture.setPicId(MyId.getMyId());
			myPicture.setSpuId(myId);
			myPicture.setTupianName(file);
			int insert2 = myPictureMapper.insert(myPicture);
			if(insert2==0){
				throw new RuntimeException("添加图片失败！");
			}
		};
		return 1;
	}

	public Map<String,Object> selectSpu(Spu spu) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		List<Spu> spuList = spuMapper.selectByAll(spu);
		
		Shuxing shuxing = new Shuxing();
		shuxing.setErjiId(spu.getErjiId());
		List<Shuxing> shuxingList = shuxingMapper.selectByAll(shuxing);
		
		map.put("spuList", spuList);
		map.put("shuxingList", shuxingList);
		return map;
	}

	public List<ProdVo> selectProd(Spu spu) {
		// TODO Auto-generated method stub
		List<ProdVo> prodVos = spuMapper.selectProd(spu);
		return prodVos;
	}

}
