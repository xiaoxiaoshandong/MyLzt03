package com.lzt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	
	@Autowired(required=false)
	HttpServletRequest request;
	
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
	public Map<String,Object> selectProd(@RequestParam Map<String,Object> map){
		
		
		Integer orderBy = null;
		Integer sc =null;
		
		String shuxingSIds = (String)map.get("shuxingSIds");
		
		String erjiId = (String)map.get("erjiId");
		if(map.containsKey("orderBy") && map.containsKey("sc")){
			orderBy = Integer.parseInt((String)map.get("orderBy"));
			sc = Integer.parseInt((String)map.get("sc"));;
		}
		Integer m = Integer.parseInt((String)map.get("m"));
		Integer n = Integer.parseInt((String)map.get("n"));;
		Page page = new Page();
		page.setM(m);
		page.setN(n);
		if(erjiId==null){
			return null;
		}
		// 商品属性
		Map<String,Object> map1 = new HashMap<String,Object>();
		Spu spu = new Spu();
		spu.setErjiId(erjiId);
		List<ShuxingVo> sv = shuxingService.selectAll(spu);
		
		// 商品总数
		int total =0 ;
			int count = spuService.selectProdCount(spu);
			if(count%12 !=0){
				total = count/12+1;
			}else{
				total = count/12;
			}
			map1.put("total", total);
			map1.put("count", count);
//		查询商品信息
			Map<String,Object> pv = spuService.selectProd(spu,page,orderBy,sc,shuxingSIds);
			Object prodVos = pv.get("pv");
			Object prodVos1 = pv.get("pv1");
			
		map1.put("sv", sv);
		map1.put("prodVos", prodVos);
		map1.put("prodVos1", prodVos1);
		return map1;
	}
	
	//根据 skuId 查询商品信息
	@RequestMapping(value="/selectProdBySkuId",method=RequestMethod.GET,produces = {"text/html;charset=utf-8"}) 
	public ModelAndView  selectProdBySkuId(@RequestParam Map<String,Object> map,HttpServletRequest request) throws Exception{
		boolean key = map.containsKey("erjiName");
		if(key){
			String erjiName = (String)map.get("erjiName");
			String name = java.net.URLDecoder.decode(erjiName,"utf-8");
			request.setAttribute("erjiName", name);
		}
		List<ProdVo> prodVos = spuService.selectProdBySkuId(map);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forward:/jsp/oneProdShow.jsp");
        //封装要显示到视图的数据
        mv.addObject("prodVos",prodVos);
        return mv;
	}
}
