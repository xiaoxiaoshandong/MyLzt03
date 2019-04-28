package com.lzt.myutils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

public class CookieUtil {
	/**
     * 将cookie封装到Map里面
     * 
     * @param request
     * @return
     */
    public static Map<String, Cookie> readCookieMap(HttpServletRequest request) {
        Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
        Cookie[] cookies = request.getCookies();
        if (null != cookies) {
            for (Cookie cookie : cookies) {
                cookieMap.put(cookie.getName(), cookie);
            }
        }
        return cookieMap;
    }
    
    /**
     * 更新 cookie 内购物车信息
     *  @param gwc cookie中购物车信息字符串 字符串格式格式：skuId1=num1,skuId2=num2 ...;
     *  @param num 商品被更新的个数
     *  @param addOrSub 0:减 1：加
     */
    public static String updOrAddCookieGwc(String gwc,int num,String skuId,int addOrSub){
    	String[] spList = gwc.split(",");
    	List<String> asList = Arrays.asList(spList);
    	ArrayList<String> arrayList = new ArrayList<String>(asList);
    	for(int i=0; i<arrayList.size() ; i++){
    		String sp = arrayList.get(i);
    		String cookieSkuId = StringUtils.substringBefore(sp, "=");
    		String cookieNum = StringUtils.substringAfter(sp, "=");
    		if(cookieSkuId.equals(skuId)){
    			int subNum = 0;
    			if(addOrSub == 0){
    				subNum = Integer.parseInt(cookieNum)-num;
    				if(subNum<0){
    					return gwc;
    				}
    			}else{
    				subNum = Integer.parseInt(cookieNum)+num;
    			}
    			String newSp = cookieSkuId+"="+subNum;
    			arrayList.set(i, newSp);
    			String join = StringUtils.join(arrayList,",");
    			return join;
    		}
    	}
    	String newSp = skuId+"="+num;
    	String newGwc =gwc+","+newSp;
    	return newGwc;
    }
}
