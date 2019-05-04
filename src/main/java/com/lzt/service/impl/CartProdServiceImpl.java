package com.lzt.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.lzt.dao.CartMapper;
import com.lzt.dao.CartProdMapper;
import com.lzt.entity.Cart;
import com.lzt.entity.CartProd;
import com.lzt.entity.ProdVo;
import com.lzt.myutils.DateUtil;
import com.lzt.myutils.JwtToken;
import com.lzt.myutils.MyId;
import com.lzt.service.CartProdService;
@Service
public class CartProdServiceImpl implements CartProdService {
	@Autowired(required=false)
	private CartProdMapper cartProdMapper;
	@Autowired(required=false)
	private CartMapper cartMapper;
	
	public Integer insertCartProd(CartProd cartProd) {
		// TODO Auto-generated method stub
		 int i = cartProdMapper.insertSelective(cartProd);
		 return i;
	}
	public CartProd selectByColumn(CartProd cartProd) {
		// TODO Auto-generated method stub
		CartProd cp = cartProdMapper.selectByColumn(cartProd);
		return cp;
	}
	public Integer updateCartProd(CartProd cartProd) {
		// TODO Auto-generated method stub
		int i = cartProdMapper.updateByPrimaryKeySelective(cartProd);
		return i;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int addCookieSpToDB(String gwc,Integer userId) {
		// TODO Auto-generated method stub
		String[] spList = gwc.split(",");
    	List<String> asList = Arrays.asList(spList);
    	ArrayList<String> arrayList = new ArrayList<String>(asList);
    	
    	for(int i=0; i<arrayList.size();i++){
    		String sp = arrayList.get(i);
    		String skuId = StringUtils.substringBefore(sp, "=");
    		String num = StringUtils.substringAfter(sp, "=");
    		CartProd cartProd = new CartProd();
    		cartProd.setSkuId(skuId);
    		CartProd prod = cartProdMapper.selectByColumn(cartProd);
    		if(prod == null){ // 添加购物车商品信息
    			Cart cart = new Cart();
    			cart.setUserId(userId+"");
    			Cart cart2 = cartMapper.selectByColumn(cart);
    			CartProd CartProd2 = new CartProd();
    			CartProd2.setCpId(MyId.getMyId());
    			CartProd2.setCartId(cart2.getCartId());
    			CartProd2.setSkuId(skuId);
    			CartProd2.setNum(Integer.parseInt(num));
    			CartProd2.setCreateTime(DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss"));
    			int insertCp = cartProdMapper.insertSelective(CartProd2);
    			if(insertCp == 0){
    				throw new RuntimeException("购物车商品信息添加到数据库失败！");
    			}
    		}else{// 更新商品
    			Integer num2 = prod.getNum();
    			String cpId = prod.getCpId();
    			Integer newNum = Integer.parseInt(num)+num2;
    			CartProd cartProd2 = new CartProd();
    			cartProd2.setCpId(cpId);
    			cartProd2.setNum(newNum);
    			cartProd2.setUpdateTime(DateUtil.getTimeFormatDate("yyyy-MM-dd HH:mm:ss"));
    			int updateCp = cartProdMapper.updateByPrimaryKeySelective(cartProd2);
    			if(updateCp == 0){
    				throw new RuntimeException("购物车商品信息更新到数据库失败！");
    			}
    		}
    	}
		return 0;
	}
	public Integer updCartProd(CartProd prod) {
		// TODO Auto-generated method stub
		int selective = cartProdMapper.updateByPrimaryKeySelective(prod);
		return selective;
	}
	
}
