package com.lzt.controller;

import java.math.BigDecimal;
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
	public ModelAndView selCartAll(){
		List<ProdVo> pvs = null;
		ModelAndView mav =new ModelAndView();
		mav.setViewName("forward:/jsp/ShoppingCart.jsp");
		// 用户未登录 查询cookie购物车信息
		
		//用户已登录 查询数据库中购物车信息
		
		// 判断用户是否登录
		HttpServletRequest request = 
				((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		if(userId==null){
			
		}else{
			pvs = spuService.selCartAll(userId);
			BigDecimal total = new BigDecimal("0");
			if(pvs != null){
				for(int i=0;i<pvs.size();i++){
					ProdVo vo = pvs.get(i);
					BigDecimal jiage = vo.getJiage();
					String num = vo.getNum();
					BigDecimal bdnum = new BigDecimal(num);
					BigDecimal total1 = jiage.multiply(bdnum);
					total = total.add(total1);
				}
			}
			mav.addObject("pvs",pvs);
			mav.addObject("zongHe",total);
		}
		return mav;
	}
}
