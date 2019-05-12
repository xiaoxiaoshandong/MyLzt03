package com.lzt.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.lzt.service.CartProdService;
import com.lzt.service.CartService;
import com.lzt.service.SpuService;
import com.lzt.entity.Cart;
import com.lzt.entity.CartProd;
import com.lzt.entity.ProdVo;
import com.lzt.myexception.TokenException;
import com.lzt.myutils.CookieUtil;
import com.lzt.myutils.DateUtil;
import com.lzt.myutils.JwtToken;
import com.lzt.myutils.MyId;
@RestController  
@RequestMapping("/cart") 
public class CartController {
	
	@Autowired(required=false)
	private CartService cartService;
	@Autowired(required=false)
	private CartProdService cartProdService;  
	@Autowired(required=false)
	private SpuService spuService;
	private static Logger log=LoggerFactory.getLogger(CartController.class);
	
	/**
	 * 
	 * @param skuId 商品ID
	 * @param num 商品数量
	 * @param addOrSub 0：减商品数量 1：加商品数量
	 * @param request
	 * @param response
	 * @return  1:购物车添加成功  0：购物车添加失败
	 */
	@RequestMapping(value="/addCart")  
	public Integer addCart(int addOrSub, String skuId,Integer num,HttpServletRequest request,HttpServletResponse response){
		//验证用户是否登录  未登录 存入cookie  已登录 存入数据库 
		Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
		Cookie tokenCookie = cookieMap.get("login_token_id");
		Cookie spCoodie = cookieMap.get("gwcId");
		String gwcVal = null;
		if(tokenCookie == null){//用户 未登录
			Cookie cookie =null;
			if(spCoodie==null){// cookie没有购物车信息
				gwcVal=skuId+"="+num;
			}else{ //cookie有购物车 信息
				
				String gwcVals = spCoodie.getValue();
				gwcVal = CookieUtil.updOrAddCookieGwc(gwcVals, num, skuId, addOrSub);
			}
			cookie = new Cookie("gwcId",gwcVal);
			// 关闭浏览器就失效
			cookie.setMaxAge(-1);
			 //可在同一应用服务器内共享cookie
			cookie.setPath("/");
			response.addCookie(cookie);
		}else{
			//获取用户ID
			String token = tokenCookie.getValue();
			Integer userId=null;
			try {
				userId = JwtToken.getAppUID(token);
			} catch (TokenException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//获取购物车ID 并添加购物车商品信息
			Cart cart2 = new Cart();
			cart2.setUserId(userId+"");
			Cart cart = cartService.selectByColumn(cart2);
			String cartId = cart.getCartId();
			if(cartId == null ){
				return 0;
			}
			// 查询此商品是否存在 存在：更新 不存在：添加
			CartProd prod = new CartProd();
			prod.setSkuId(skuId);
			CartProd cp= cartProdService.selectByColumn(prod);
			if(cp == null){
				CartProd cartProd = new CartProd();
				cartProd.setCpId(MyId.getMyId());
				cartProd.setCartId(cartId);
				cartProd.setSkuId(skuId);
				Date date = DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss");
				cartProd.setCreateTime(date);
				cartProd.setUpdateTime(date);
				cartProd.setNum(num);
				Integer cps = cartProdService.insertCartProd(cartProd);
				if(cps==0){
					return 0;
				}
			}else{
				String cpId = cp.getCpId();
				CartProd cartProd = new CartProd();
				cartProd.setCpId(cpId);
				Date date = DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss");
				cartProd.setUpdateTime(date);
				Integer num2 = cp.getNum();
				cartProd.setNum(num2+1);
				Integer ucp = cartProdService.updateCartProd(cartProd);
				if(ucp==0){
					return 0;
				}
			}
			
		}
		return 1;
	}
	
	/**
	 * 查询购物车
	 * @return 购物车集合 按更新时间排序
	 */
	@RequestMapping(value="/selCartAll")  
	public ModelAndView selCartAll(String cbl,HttpServletRequest request){
		ModelAndView mav =null;
		// 用户未登录 查询cookie购物车信息
		
		//用户已登录 查询数据库中购物车信息
		
		// 判断用户是否登录
		Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
	     Cookie tokenCoodie = cookieMap.get("login_token_id");
	    
		if(tokenCoodie==null){ // 从cookie中获取购物车信息
			Cookie gwcCookie = cookieMap.get("gwcId");
			if(gwcCookie != null){
				String gwcVals = gwcCookie.getValue();
				 mav = gwcCookieToMAV(gwcVals,cbl);
			}else{
				return newMAV();
			}
		}else{
			     mav= gwcDBToMAV(tokenCoodie,cbl);
		}
		return mav;
	}
	
	/**
	 * 
	 * @param addOrSub 0:减数量 1：加数量
	 * @param skuId 商品skuId
	 * @param cbl 复选框被选中的元素组成的字符串 格式：111,222,333...
	 * @return 0：失败 1：成功
	 */
	@RequestMapping(value="/updNum")  
	public ModelAndView updNum(String cbl,int addOrSub,Integer num,String skuId,HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav =null;
		// 判断 用户是否登录 
		Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
	     Cookie tokenCoodie = cookieMap.get("login_token_id");
	    
		if(tokenCoodie==null){ // 用户未登录 修改cookie中商品数量
			Cookie gwcCookie = cookieMap.get("gwcId");
			Cookie cookie =null;
			if(gwcCookie != null){
				String gwcVals = gwcCookie.getValue();
				String gwcVal = CookieUtil.updOrAddCookieGwc(gwcVals, num, skuId, addOrSub);
				cookie = new Cookie("gwcId",gwcVal);
				// 关闭浏览器就失效
				cookie.setMaxAge(-1);
				 //可在同一应用服务器内共享cookie
				cookie.setPath("/");
				response.addCookie(cookie);
				
				// 视图渲染
				mav = gwcCookieToMAV( gwcVal,cbl);
			}else{
				return newMAV();
			}
		}else{ // 用户已登录 修改数据库中商品数量
			CartProd prod = new CartProd();
			prod.setSkuId(skuId);
			CartProd cp = cartProdService.selectByColumn(prod);
			String cpId = cp.getCpId();
			Integer num2 = cp.getNum();
			if(addOrSub == 0){
				num2 =num2-num;
				if(num2<=0){
					num2=num;
				}
			}else{
				num2 =num2+num;
			}
			prod.setNum(num2);
			prod.setCpId(cpId);
			Integer cps = cartProdService.updCartProd(prod);
			mav = gwcDBToMAV(tokenCoodie,cbl );
		}
		return mav;
	}
	
	
	/**
	 * 用户未登录时 视图渲染
	 * @param gwcVal cookie内的购物车信息 格式：skuId1=num1,skuId2=num2 ...;
	 * @param cbl 复选框被选中的skuId集合字符串 格式：111,222,333...
	 * @return ModelAndView
	 */
	public ModelAndView gwcCookieToMAV(String gwcVal,String cbl){
		if(gwcVal == null || gwcVal==""){
			ModelAndView mav1 =new ModelAndView();
			mav1.setViewName("forward:/jsp/ShoppingCart.jsp");
			mav1.addObject("ynlogin",0);
			return mav1;
		}
		ModelAndView mav =new ModelAndView();
		mav.setViewName("forward:/jsp/ShoppingCart.jsp");
		BigDecimal total = new BigDecimal("0");
		List<ProdVo> pvList = new ArrayList<ProdVo>();
		List<Map<String,Object>> list = CookieUtil.gwcCookieToList(gwcVal);
		for(int i=0;i<list.size();i++){
			Map<String, Object> map = list.get(i);
			String skuId1 = (String)map.get("skuId");
			String num1 = (String)map.get("num");
			ProdVo pv = spuService.selCartProdByskuId(skuId1);
			pv.setNum(num1);
			
			BigDecimal jiage = pv.getJiage();
			BigDecimal cookieNum = new BigDecimal(num1);
			if(cbl == null || cbl==""){
				BigDecimal total1 = jiage.multiply(cookieNum);
				total = total.add(total1);
			}else if(cbl=="-1"){
			}else{
				ArrayList<String> cblToList = CookieUtil.gwcToList(cbl);
				boolean contains = cblToList.contains(skuId1);
				if(contains){
					BigDecimal total1 = jiage.multiply(cookieNum);
					total = total.add(total1);
				}
			}
			pvList.add(pv);
		}
		mav.addObject("pvs",pvList);
		mav.addObject("zongHe",total);
		mav.addObject("cbl",cbl);
		mav.addObject("ynlogin",0);
		return mav;
	}
	
	/**
	 * 用户登录时 视图渲染
	 * @param tokenCoodie 
	 * @param cbl 复选框被选中的skuId集合字符串 格式：111,222,333...
	 * @return ModelAndView
	 */
	public  ModelAndView gwcDBToMAV(Cookie tokenCoodie,String cbl ){
		ModelAndView mav =new ModelAndView();
		mav.setViewName("forward:/jsp/ShoppingCart.jsp");
		
		 String token = tokenCoodie.getValue();
			Integer userId = null;
			try {
				userId = JwtToken.getAppUID(token);
			} catch (TokenException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		List<ProdVo> pvs = spuService.selCartAll(userId+"");
		BigDecimal total = new BigDecimal("0");
		if(pvs != null){
			for(int i=0;i<pvs.size();i++){
				ProdVo vo = pvs.get(i);
				String skuId1 = vo.getSkuId();
				BigDecimal jiage = vo.getJiage();
				String num = vo.getNum();
				BigDecimal bdnum = new BigDecimal(num);
				
				if(cbl == null || cbl==""){
					BigDecimal total1 = jiage.multiply(bdnum);
					total = total.add(total1);
				}else if(cbl=="-1"){
				}else{
					ArrayList<String> cblToList = CookieUtil.gwcToList(cbl);
					boolean contains = cblToList.contains(skuId1);
					if(contains){
						BigDecimal total1 = jiage.multiply(bdnum);
						total = total.add(total1);
					}
				}
			}
		}
		mav.addObject("pvs",pvs);
		mav.addObject("zongHe",total);
		mav.addObject("cbl",cbl);
		mav.addObject("ynlogin",1);
		return mav;
	}
	/**
	 * 
	 * @param SkuId  商品信息ID或集合字符串 格式：111,222,333...
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping(value="/delGwc")  
	public ModelAndView delGwcBySkuId(String cbl,String skuId,HttpServletRequest request,HttpServletResponse response){
		ArrayList<String> skuIdList = CookieUtil.gwcToList(skuId);
		// 判断用户是否登录  
		Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
	     Cookie tokenCoodie = cookieMap.get("login_token_id");
	     Cookie cookie = null;
	     ModelAndView mav =null;
	     if(tokenCoodie == null){ // 未登录 查询cookie是否有购物车信息
	    	 Cookie gwcCookie = cookieMap.get("gwcId");
	    	 if(gwcCookie != null){ // 有购物车信息 删除指定商品信息 并返回视图
	    		 String gwcVal = gwcCookie.getValue();
	    		/* String gwcVal = null;*/
	    		 for(int i=0;i<skuIdList.size();i++){
	    			 String skuID = skuIdList.get(i);
	    			 gwcVal = CookieUtil.delGwcFromCookie(gwcVal, skuID);
	    			
	    		 }
	    		 if(gwcVal == null){
	    			 cookie = new Cookie("gwcId",gwcVal);
                     cookie.setMaxAge(0);// 立即销毁cookie  
	    		 }else{
	    			 cookie = new Cookie("gwcId",gwcVal);
						// 关闭浏览器就失效
						cookie.setMaxAge(-1);
	    		 }
	    		 	//可在同一应用服务器内共享cookie
					cookie.setPath("/");
					response.addCookie(cookie);
					mav = gwcCookieToMAV(gwcVal,cbl);
	    	 }else{// 未有购物车信息 返回空的ModelAndView 对象
	    		 	return newMAV();
	    	 }
	     }else{// 已登录 数据库删除指定购物车信息 并返回视图
	    	 Integer a =  null;
	    	 for(int i=0;i<skuIdList.size();i++){
	    		 String skuID = skuIdList.get(i);
	    		 a = cartProdService.delGwcBySkuId(skuID);
	    	 }
	    	 if(a==0){
	    		 ModelAndView mav1 =new ModelAndView();
	    		 mav1.setViewName("forward:/jsp/ShoppingCart.jsp");
	 			 mav1.addObject("ynlogin",1);
	    		 	return mav1;
	    	 }else{
	    		 mav = gwcDBToMAV(tokenCoodie,cbl); 
	    	 }
	    	 
	     }
		return mav;
	}

	/**
	 * 返回空的视图
	 * @return
	 */
	private ModelAndView newMAV() {
		ModelAndView view = new ModelAndView();
		view.setViewName("forward:/jsp/ShoppingCart.jsp");
		view.addObject("ynlogin",0);
		return view;
	}
	
	@RequestMapping(value="/getTotalByCheck")  
	public Object getTotalByCheck(String cbl,HttpServletRequest request){
		ModelAndView view = selCartAll(cbl,request);
		Object tt = view.getModel().get("zongHe");
		return tt;
	}
	
	@RequestMapping(value="/cleanGwc")  
	public ModelAndView cleanGwc(HttpServletRequest request,HttpServletResponse response){
		// 验证用户是否登录
		Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
		Cookie tokenCookie = cookieMap.get("login_token_id");
		Cookie cookie = null;
		ModelAndView mav =null;
		if(tokenCookie == null){ //用户未登录
			Cookie spCoodie = cookieMap.get("gwcId");
			if(spCoodie != null){
				cookie = new Cookie("gwcId","");
				// 立即失效
				cookie.setMaxAge(0);
				 //可在同一应用服务器内共享cookie
				cookie.setPath("/");
				response.addCookie(cookie);
			}
				return newMAV();
		}else{ // 用户已登录
			//获取用户ID
			String token = tokenCookie.getValue();
			Integer userId=null;
			try {
				userId = JwtToken.getAppUID(token);
			} catch (TokenException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 根据用户ID 删除DB所有购物车商品信息
			Integer i = cartProdService.cleanGwc(userId+"");
			if(i==0){
				ModelAndView view = new ModelAndView();
				view.setViewName("forward:/jsp/ShoppingCart.jsp");
				view.addObject("ynlogin",1);
				return view;
			}
		}
		mav = gwcDBToMAV(tokenCookie,"2" );
		return mav;
	}
}

