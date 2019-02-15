package com.lzt.controller;



import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.lzt.service.SkuService;

@RestController  
@RequestMapping("/sku") 
public class SkuController {
	
	@Autowired(required=false)
	private SkuService skuService;
	
	private static Logger log=LoggerFactory.getLogger(SkuController.class);
	
	/**
	 * 
	 * @param skuName
	 * @param kucun
	 * @param jiage
	 * @param shuxingSId
	 * @return 0:添加失败 1：添加成功
	 */
	@RequestMapping(value="/insert")
	public String insertSku(String spuId,String skuName,Integer kucun,BigDecimal jiage,String shuxingSId){
		Integer integer = null;
		if(spuId=="" ||spuId==null || skuName=="" || skuName==null || kucun==null || jiage==null || shuxingSId==null || shuxingSId==""){
			return "0";
		}
		/* Random random = new Random();
		 int cont =0;
		 for(int i=0;i<200;i++){
		
		List<String> spuIds  = new ArrayList<String>();
		List<String> skuNames  = new ArrayList<String>();
		List<Integer> kucuns  = new ArrayList<Integer>();
		List<BigDecimal> jiages  = new ArrayList<BigDecimal>();
	
		spuIds.add("154580283280383");
		spuIds.add("154580291627821");
		spuIds.add("154580296961767");
		spuIds.add("15458030068486");
		spuId = spuIds.get(random.nextInt(spuIds.size()));
		
		skuNames.add("sku名称测试1");
		skuNames.add("sku名称测试2");
		skuNames.add("sku名称测试3");
		skuNames.add("sku名称测试4");
		skuName = skuNames.get(random.nextInt(skuNames.size()));
		
		kucuns.add(100);
		kucuns.add(200);
		kucuns.add(300);
		kucuns.add(400);
		kucun = kucuns.get(random.nextInt(kucuns.size()));
		
		jiages.add(new BigDecimal(1111));
		jiages.add(new BigDecimal(2222));
		jiages.add(new BigDecimal(3333));
		jiages.add(new BigDecimal(4444));
		jiage = jiages.get(random.nextInt(jiages.size()));
		
		List<String> s1  = new ArrayList<String>();
		s1.add("154528880844333");
		s1.add("154528880844334");
		s1.add("154528880844497");
		s1.add("154528880844777");
		s1.add("154528880844969");
		String ss1 = s1.get(random.nextInt(s1.size()));
		
		List<String> s2  = new ArrayList<String>();
		s2.add("15452889795121");
		s2.add("154528897951362");
		s2.add("154528897951579");
		s2.add("154528897951867");
		s2.add("15452889795206");
		String ss2 = s2.get(random.nextInt(s2.size()));
		
		List<String> s3  = new ArrayList<String>();
		s3.add("154528906740189");
		s3.add("154528906740291");
		s3.add("154528906740475");
		s3.add("154528906740646");
		String ss3 = s3.get(random.nextInt(s3.size()));
		
		List<String> s4  = new ArrayList<String>();
		s4.add("154528915983312");
		s4.add("154528915983410");
		s4.add("154528915983689");
		s4.add("154528915983762");
		s4.add("154528915983982");
		s4.add("154528915984032");
		String ss4 = s4.get(random.nextInt(s4.size()));
		
		List<String> s5  = new ArrayList<String>();
		s5.add("154528925703420");
		s5.add("154528925703797");
		s5.add("154528925703832");
		s5.add("154528925704027");
		s5.add("154528925704267");
		String ss5 = s5.get(random.nextInt(s5.size()));
		
		List<String> s6  = new ArrayList<String>();
		s6.add("154528935878729");
		s6.add("154528935878892");
		s6.add("154528935879238");
		s6.add("154528935879824");
		s6.add("154528935880080");
		String ss6 = s6.get(random.nextInt(s6.size()));
		shuxingSId = ss1+","+ss2+","+ss3+","+ss4+","+ss5+","+ss6;
		
		System.out.println("spuId:"+spuId+" skuName:"+skuName+" kucun:"+kucun+" jiage:"+jiage+" shuxingSId:"+shuxingSId);
		 integer = skuService.insertSku(spuId,skuName,kucun,jiage,shuxingSId);
		 cont++;
		 }
		 System.out.println("总共执行次数："+cont);*/
		 
		integer = skuService.insertSku(spuId,skuName,kucun,jiage,shuxingSId);
		return integer+"";
	}
}
