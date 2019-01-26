package com.lzt.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.lzt.entity.ProdVo;
import com.lzt.entity.Spu;
import com.lzt.service.SpuService;

@RestController  
@RequestMapping("/spu") 
public class SpuController {
	
	@Autowired(required=false)
	private SpuService spuService;
	
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
	public List<ProdVo> selectProd(Spu spu){
		String erjiId = spu.getErjiId();
		if(erjiId==null){
			return null;
		}
		List<ProdVo> prodVos = spuService.selectProd(spu);
		System.out.println(prodVos);
		return prodVos;
	}
}
