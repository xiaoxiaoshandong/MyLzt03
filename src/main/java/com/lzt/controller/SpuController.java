package com.lzt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.lzt.entity.ProdVo;
import com.lzt.entity.ShuxingVo;
import com.lzt.entity.Spu;
import com.lzt.myutils.Page;
import com.lzt.service.ShuxingService;
import com.lzt.service.SpuService;

@RestController  
@RequestMapping("/spu") 
public class SpuController {
	
	@Autowired(required=false)
	private SpuService spuService;
	
	@Autowired(required=false)
	private ShuxingService shuxingService;
	private static Logger log=LoggerFactory.getLogger(SpuController.class);
	
	/**
	 * 
	 * @param list
	 * @param erjiId
	 * @param chanpinName
	 * @param request
	 */
	@RequestMapping(value="/add")  
    public String addSpu(@RequestParam("file") List<MultipartFile> list,
    		@RequestParam("erjiId") String erjiId,@RequestParam("chanpinName") String chanpinName
    		, HttpServletRequest request){ 
		int size = list.size();
		 
		if(erjiId==null || chanpinName==null || size==0 ){
			return "0";
		}
		try {
			Integer Integer = spuService.addSpu(list,erjiId,chanpinName,request);
			if(Integer==0){
				return "0";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "1";
	}
	
	/**
	 * 
	 * @param spu
	 */
	@RequestMapping(value="/select") 
	public Map<String,Object> selectSpu(Spu spu){
		String erjiId = spu.getErjiId();
		if(erjiId==null){
			return null;
		}
		Map<String,Object> map = spuService.selectSpu(spu);
		
		return map;
	}
	
	@RequestMapping(value="/selectProd") 
	public Map<String,Object> selectProd(Spu spu,Page page, @Param("orderBy") Integer orderBy,@Param("sc") Integer sc){
		String erjiId = spu.getErjiId();
		if(erjiId==null){
			return null;
		}
		// 商品属性
		Map<String,Object> map = new HashMap<String,Object>();
		List<ShuxingVo> sv = shuxingService.selectAll(spu);
		
		// 商品总数
		int total =0 ;
			int count = spuService.selectProdCount(spu);
			System.out.println("count:"+count);
			if(count%12 !=0){
				total = count/12+1;
			}else{
				total = count/12;
			}
			map.put("total", total);
			map.put("count", count);
//		查询商品信息
			Map<String,Object> pv = spuService.selectProd(spu,page,orderBy,sc);
			Object prodVos = pv.get("pv");
			Object prodVos1 = pv.get("pv1");
			
		map.put("sv", sv);
		map.put("prodVos", prodVos);
		System.out.println(prodVos);
		map.put("prodVos1", prodVos1);
		/*System.out.println(map);*/
		return map;
	}
}
