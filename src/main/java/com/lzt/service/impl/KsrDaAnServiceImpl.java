package com.lzt.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lzt.dao.DaAnMapper;
import com.lzt.dao.KsrDaAnMapper;
import com.lzt.dao.ShiJuanMapper;
import com.lzt.entity.FenShuVo;
import com.lzt.entity.KsrDaAn;
import com.lzt.entity.KsrDaAnVo;
import com.lzt.entity.ShiJuan;
import com.lzt.myutils.DateUtil;
import com.lzt.myutils.MyId;
import com.lzt.service.KsrDaAnService;
@Service
public class KsrDaAnServiceImpl implements KsrDaAnService {
	
	@Autowired(required=false)
	private KsrDaAnMapper ksrDaAnMapper;
	@Autowired(required=false)
	private DaAnMapper daAnMapper;
	@Autowired(required=false)
	private ShiJuanMapper shiJuanMapper;
	
	public FenShuVo submitDaAn(KsrDaAnVo ksrDaAnVo) {
		// TODO Auto-generated method stub
		List<KsrDaAn> list = new ArrayList<KsrDaAn>();
		String sjId = ksrDaAnVo.getSjId();
		Map<String,Object> mapXz1 = makeKDA(sjId,ksrDaAnVo.getXzQuestId1(),ksrDaAnVo.getXzContent1(),"1");
		KsrDaAn xz1 = (KsrDaAn)mapXz1.get("kda");
		FenShuVo xzFsv1= (FenShuVo)mapXz1.get("fsv");
		Map<String,Object> mapXz2 = makeKDA(sjId,ksrDaAnVo.getXzQuestId2(),ksrDaAnVo.getXzContent2(),"1");
		KsrDaAn xz2 = (KsrDaAn)mapXz2.get("kda");
		FenShuVo xzFsv2= (FenShuVo)mapXz2.get("fsv");
		Map<String,Object> mapXz3 = makeKDA(sjId,ksrDaAnVo.getXzQuestId3(),ksrDaAnVo.getXzContent3(),"1");
		KsrDaAn xz3 = (KsrDaAn)mapXz3.get("kda");
		FenShuVo xzFsv3= (FenShuVo)mapXz3.get("fsv");
		Map<String,Object> mapXz4 = makeKDA(sjId,ksrDaAnVo.getXzQuestId4(),ksrDaAnVo.getXzContent4(),"1");
		KsrDaAn xz4 = (KsrDaAn)mapXz4.get("kda");
		FenShuVo xzFsv4= (FenShuVo)mapXz4.get("fsv");
		Map<String,Object> mapXz5 = makeKDA(sjId,ksrDaAnVo.getXzQuestId5(),ksrDaAnVo.getXzContent5(),"1");
		KsrDaAn xz5 = (KsrDaAn)mapXz5.get("kda");
		FenShuVo xzFsv5= (FenShuVo)mapXz5.get("fsv");
		Map<String,Object> mapXz6 = makeKDA(sjId,ksrDaAnVo.getXzQuestId6(),ksrDaAnVo.getXzContent6(),"1");
		KsrDaAn xz6 = (KsrDaAn)mapXz6.get("kda");
		FenShuVo xzFsv6= (FenShuVo)mapXz6.get("fsv");
		Map<String,Object> mapXz7 = makeKDA(sjId,ksrDaAnVo.getXzQuestId7(),ksrDaAnVo.getXzContent7(),"1");
		KsrDaAn xz7 = (KsrDaAn)mapXz7.get("kda");
		FenShuVo xzFsv7= (FenShuVo)mapXz7.get("fsv");
		Map<String,Object> mapXz8 = makeKDA(sjId,ksrDaAnVo.getXzQuestId8(),ksrDaAnVo.getXzContent8(),"1");
		KsrDaAn xz8 = (KsrDaAn)mapXz8.get("kda");
		FenShuVo xzFsv8= (FenShuVo)mapXz8.get("fsv");
		Map<String,Object> mapXz9 = makeKDA(sjId,ksrDaAnVo.getXzQuestId9(),ksrDaAnVo.getXzContent9(),"1");
		KsrDaAn xz9 = (KsrDaAn)mapXz9.get("kda");
		FenShuVo xzFsv9= (FenShuVo)mapXz9.get("fsv");
		Map<String,Object> mapXz10 = makeKDA(sjId,ksrDaAnVo.getXzQuestId10(),ksrDaAnVo.getXzContent10(),"1");
		KsrDaAn xz10 = (KsrDaAn)mapXz10.get("kda");
		FenShuVo xzFsv10= (FenShuVo)mapXz10.get("fsv");
		
		Map<String,Object> mapWd1 = makeKDA(sjId,ksrDaAnVo.getWdQuestId1(),ksrDaAnVo.getWdContent1(),"2");
		KsrDaAn wd1 = (KsrDaAn)mapWd1.get("kda");
		FenShuVo wdFsv1= (FenShuVo)mapWd1.get("fsv");
		Map<String,Object> mapWd2 = makeKDA(sjId,ksrDaAnVo.getWdQuestId2(),ksrDaAnVo.getWdContent2(),"2");
		KsrDaAn wd2 = (KsrDaAn)mapWd2.get("kda");
		FenShuVo wdFsv2= (FenShuVo)mapWd2.get("fsv");
		Map<String,Object> mapWd3 = makeKDA(sjId,ksrDaAnVo.getWdQuestId3(),ksrDaAnVo.getWdContent3(),"2");
		KsrDaAn wd3 = (KsrDaAn)mapWd3.get("kda");
		FenShuVo wdFsv3= (FenShuVo)mapWd3.get("fsv");
		Map<String,Object> mapWd4 = makeKDA(sjId,ksrDaAnVo.getWdQuestId4(),ksrDaAnVo.getWdContent4(),"2");
		KsrDaAn wd4 = (KsrDaAn)mapWd4.get("kda");
		FenShuVo wdFsv4= (FenShuVo)mapWd4.get("fsv");
		Map<String,Object> mapWd5 = makeKDA(sjId,ksrDaAnVo.getWdQuestId5(),ksrDaAnVo.getWdContent5(),"2");
		KsrDaAn wd5 = (KsrDaAn)mapWd5.get("kda");
		FenShuVo wdFsv5= (FenShuVo)mapWd5.get("fsv");
		
		Map<String,Object> mapDt1 = makeKDA(sjId,ksrDaAnVo.getDtQuestId1(),ksrDaAnVo.getDtContent1(),"3");
		KsrDaAn dt1 = (KsrDaAn)mapDt1.get("kda");
		FenShuVo dtFsv1= (FenShuVo)mapDt1.get("fsv");
		
		list.add(xz1);
		list.add(xz2);
		list.add(xz3);
		list.add(xz4);
		list.add(xz5);
		list.add(xz6);
		list.add(xz7);
		list.add(xz8);
		list.add(xz9);
		list.add(xz10);
		list.add(wd1);
		list.add(wd2);
		list.add(wd3);
		list.add(wd4);
		list.add(wd5);
		list.add(dt1);
		Integer i = ksrDaAnMapper.batchInsert(list);
		if(i==0){
			throw new RuntimeException("批量插入考试人答案失败！");
		}
		
		// 返回 分数和 不正确的选择题信息
		FenShuVo vo = new FenShuVo();
		ArrayList<FenShuVo> list2 = new ArrayList<FenShuVo>();
		double xzScore1 = xzFsv1.getScore();
		if(xzScore1!=3){
			list2.add(xzFsv1);
		}
		double xzScore2 = xzFsv2.getScore();
		if(xzScore2!=3){
			list2.add(xzFsv2);
		}
		double xzScore3 = xzFsv3.getScore();
		if(xzScore3!=3){
			list2.add(xzFsv3);
		}
		double xzScore4 = xzFsv4.getScore();
		if(xzScore4!=3){
			list2.add(xzFsv4);
		}
		double xzScore5 = xzFsv5.getScore();
		if(xzScore5!=3){
			list2.add(xzFsv5);
		}
		double xzScore6 = xzFsv6.getScore();
		if(xzScore6!=3){
			list2.add(xzFsv6);
		}
		double xzScore7 = xzFsv7.getScore();
		if(xzScore7!=3){
			list2.add(xzFsv7);
		}
		double xzScore8 = xzFsv8.getScore();
		if(xzScore8!=3){
			list2.add(xzFsv8);
		}
		double xzScore9 = xzFsv9.getScore();
		if(xzScore9!=3){
			list2.add(xzFsv9);
		}
		double xzScore10 = xzFsv10.getScore();
		if(xzScore10!=3){
			list2.add(xzFsv10);
		}
		double wdScore1 = wdFsv1.getScore();
		double wdScore2 = wdFsv2.getScore();
		double wdScore3 = wdFsv3.getScore();
		double wdScore4 = wdFsv4.getScore();
		double wdScore5 = wdFsv5.getScore();
		double dtScore1 = dtFsv1.getScore();
		double score= xzScore1+xzScore2+xzScore3+xzScore4+xzScore5+xzScore6+xzScore7+xzScore8+xzScore9+xzScore10+wdScore1+wdScore2+wdScore3+wdScore4+wdScore5+dtScore1;
		ShiJuan shiJuan = new ShiJuan();
		shiJuan.setSjId(sjId);
		shiJuan.setKsrTotal(score+"");
		int j = shiJuanMapper.updateByPrimaryKeySelective(shiJuan);
		if(j==0){
			throw new RuntimeException("试卷添加分数失败！");
		}
		vo.setScore(score);
		vo.setList(list2);
		return vo;
	}
	
	private Map<String, Object> makeKDA(String sjId,String questId ,String ksrContent ,String num){
		KsrDaAn daAn = new KsrDaAn();
		FenShuVo fenShuVo = new FenShuVo();
		fenShuVo.setQuestId(questId);
		Map<String, Object> map = new HashMap<String,Object>();
		
		// 封装 考试人答案成对象
		daAn.setKdaId(MyId.getMyId());
		daAn.setSjId(sjId);
		daAn.setQuestId(questId);
		daAn.setKsrContent(ksrContent);
		Date date = DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss");
		daAn.setCreateTime(date);
		daAn.setUpdateTime(date);
		daAn.setKsrQuestType(num);
		
		// 判断答案是否正确并计算分数
		String ansContent  = daAnMapper.selectDaAnByQuestId(questId);
		String[] ac = ansContent.split(",");
		List<String> asList = Arrays.asList(ac);
		if(num=="1"){ // 选择题
			double t = getScore(ksrContent,asList,3,1.5,1);
			fenShuVo.setScore(t);
			fenShuVo.setKsrContent(ksrContent);
			fenShuVo.setAnsContent(ansContent);
		}else if(num=="2"){// 问答题
				double t = getScore(ksrContent,asList,6,3,2);
				fenShuVo.setScore(t);
		}else{ // 大题
			double t = getScore(ksrContent,asList,30,15,10);
			fenShuVo.setScore(t);
		}
		
		map.put("kda", daAn);
		map.put("fsv", fenShuVo);
		return map;
	} 
	
	private double getScore(String ksrContent,List<String> asList,double num1,double num2,double num3){
		if(ksrContent==null){
			ksrContent="";
		}
		int size = asList.size();
		double myScore =0;
		double t =0;
		if(size==1){
			myScore=num1;
		}else if(size==2){
			myScore=num2;
		}else{
			myScore=num3;
		}
		for(int i=0;i<asList.size();i++){
			String str = asList.get(i);
			 boolean b = ksrContent.contains(str);
			 if(b){
				 t = myScore+t;
				 if(t==num1){
					 break;
				 }
			 }
		}
		return t;
	}
}
