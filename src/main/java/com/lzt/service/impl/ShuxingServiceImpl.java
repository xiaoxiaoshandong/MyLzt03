package com.lzt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lzt.dao.ShuxingMapper;
import com.lzt.dao.ShuxingSMapper;
import com.lzt.entity.Shuxing;
import com.lzt.entity.ShuxingS;
import com.lzt.myutils.MyId;
import com.lzt.service.ShuxingService;
@Service
public class ShuxingServiceImpl implements ShuxingService {
	@Autowired(required=false)
	private ShuxingMapper shuxingMapper;
	@Autowired(required=false)
	private ShuxingSMapper shuxingSMapper;
	
	/**
	 * @return 1:添加成功 0：添加失败
	 */
	@Transactional(rollbackFor = Exception.class)
	public Integer addShuxing(String erjiId, String shuxingName, String shuxingSVal) {
		// TODO Auto-generated method stub
			Integer add = 0;
			String[] split = shuxingSVal.split(",");
			int integer = 0;
			try {
				Shuxing shuxing = new Shuxing();
				String myId = MyId.getMyId();
				shuxing.setShuxingId(myId);
				shuxing.setErjiId(erjiId);
				shuxing.setShuxingName(shuxingName);
				integer = shuxingMapper.insert(shuxing);
				if(integer==0){
					throw new RuntimeException("添加属性失败！");
				}
				for(int i=0;i<split.length;i++){
					String sxz = split[i];
					ShuxingS shuxingS = new ShuxingS();
					shuxingS.setShuxingId(myId);
					shuxingS.setShuxingSVal(sxz);
					shuxingS.setShuxingSId(MyId.getMyId());
					int insert = shuxingSMapper.insert(shuxingS);
					add = add+insert;
					if(insert==0){
						throw new RuntimeException("添加属性值失败");
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Integer a1 = add+integer;
			Integer a2 = split.length+integer;
		if(a1==a2){
			return 1;
		}
		return 0;
	}

	public List<Shuxing> selectShuxing(Shuxing shuxing) {
		// TODO Auto-generated method stub
		List<Shuxing> sx = shuxingMapper.selectByAll(shuxing);
		return sx;
	}

	public Integer supdateShuxing(Shuxing shuxing) {
		// TODO Auto-generated method stub
		int i = shuxingMapper.updateByPrimaryKeySelective(shuxing);
		return i;
	}
}
