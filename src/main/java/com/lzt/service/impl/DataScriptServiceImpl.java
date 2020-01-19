package com.lzt.service.impl;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.ConsumerMapper;
import com.lzt.dao.DataScriptMapper;
import com.lzt.dao.MedicineMapper;
import com.lzt.entity.Consumer;
import com.lzt.entity.DataScript;
import com.lzt.entity.Medicine;
import com.lzt.myutils.RedisUtil;
import com.lzt.service.DataScriptService;

import redis.clients.jedis.Jedis;
@Service
public class DataScriptServiceImpl implements DataScriptService{
	
	@Autowired(required=false)
	private DataScriptMapper dataScriptMapper;
	
	@Autowired(required=false)
	private MedicineMapper medicineMapper;
	
	@Autowired(required=false)
	private ConsumerMapper consumerMapper;
	
	public List<DataScript> getTableNames() {
		// TODO Auto-generated method stub
		return dataScriptMapper.getTableNames();
	}

	public List<String> getTablecolumns(String tableName) {
				// TODO Auto-generated method stub
		return dataScriptMapper.getTablecolumns(tableName);
	}

	public void createData(String dataCont, String tableName) {
		// TODO Auto-generated method stub
		dataScriptMapper.createData(dataCont,tableName);
		
	}
	
	// 商品秒杀
	public List<String> medicineRob(String medicineId, String consumerNumb) {
		int conNum = Integer.parseInt(consumerNumb);
		List<String> list  = new ArrayList<String>();
		// 获取此商品数量，并缓存入redis中
		Medicine medicine  = medicineMapper.selectByPrimaryKey(Integer.parseInt(medicineId));
		String medicineNumb = medicine.getMedicineNumb();
		Jedis jedis = RedisUtil.getJedis();
		jedis.set("medicineNumb",medicineNumb);
		String num = jedis.get("medicineNumb");
		// 随机抽取一批顾客并初始化
		Random random = new Random();
		int size  = consumerMapper.selectConsumerSize();
		if(conNum>size ){
			list.add("顾客人数超出范围，请重新输入！");
			return list;
		}
		if (size == 0 ){
			list.add("数据库中没有顾客信息，请联系管理员！");
			return list;
			
		}
		List<Consumer>  consumerList  = consumerMapper.selectConsumerList("0",consumerNumb);
		//返回秒杀成功的顾客信息
		
		//https://www.cnblogs.com/youcong/p/8098881.html
		return null;
	}

}
