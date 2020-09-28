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
     * 新增，更新 cookie 内购物车信息
     *
     * @param gwc      cookie中购物车信息字符串 字符串格式格式：skuId1=num1,skuId2=num2 ...;
     * @param skuId    商品skuId
     * @param num      商品被更新的个数
     * @param addOrSub 0:减 1：加
     */
    public static String updOrAddCookieGwc(String gwc, int num, String skuId, int addOrSub) {
        ArrayList<String> arrayList = gwcToList(gwc);
        for (int i = 0; i < arrayList.size(); i++) {
            String sp = arrayList.get(i);
            String cookieSkuId = StringUtils.substringBefore(sp, "=");
            String cookieNum = StringUtils.substringAfter(sp, "=");
            if (cookieSkuId.equals(skuId)) {
                int subNum = 0;
                if (addOrSub == 0) {
                    subNum = Integer.parseInt(cookieNum) - num;
                    if (subNum <= 0) {
                        return gwc;
                    }
                } else {
                    subNum = Integer.parseInt(cookieNum) + num;
                }
                String newSp = cookieSkuId + "=" + subNum;
                arrayList.set(i, newSp);
                String join = StringUtils.join(arrayList, ",");
                return join;
            }
        }
        String newSp = skuId + "=" + num;
        String newGwc = gwc + "," + newSp;
        return newGwc;
    }

    /**
     * 购物车信息字符串转换成List<Map<String,Object>>
     *
     * @param gwc 从浏览器获取的购物车信息字符串 格式：skuId1=num1,skuId2=num2 ...;
     * @return List<Map<String,Object>>
     */
    public static List<Map<String, Object>> gwcCookieToList(String gwc) {

        if (gwc == null || gwc == "") {
            return null;
        }
        ArrayList<String> arrayList = gwcToList(gwc);
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < arrayList.size(); i++) {
            String sp = arrayList.get(i);
            String cookieSkuId = StringUtils.substringBefore(sp, "=");
            String cookieNum = StringUtils.substringAfter(sp, "=");
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("skuId", cookieSkuId);
            map.put("num", cookieNum);
            list.add(map);
        }
        return list;
    }

    /**
     * @param gwc
     * @return
     */
    public static ArrayList<String> gwcToList(String gwc) {
        String[] spList = gwc.split(",");
        List<String> asList = Arrays.asList(spList);
        ArrayList<String> arrayList = new ArrayList<String>(asList);
        return arrayList;
    }

    /**
     * @param gwc   从浏览器获取的购物车信息字符串 格式：skuId1=num1,skuId2=num2 ...;
     * @param skuId 商品Id
     * @return 0:删除失败 1：删除成功
     */
    public static String delGwcFromCookie(String gwc, String skuId) {
        if (gwc == null || gwc == "") {
            return null;
        }
        String join = null;
        ArrayList<String> arrayList = gwcToList(gwc);
        for (int i = 0; i < arrayList.size(); i++) {
            String sp = arrayList.get(i);
            String cookieSkuId = StringUtils.substringBefore(sp, "=");
            if (cookieSkuId.equals(skuId)) {
                arrayList.remove(i);
                boolean e = arrayList.isEmpty();
                if (!e) {
                    join = StringUtils.join(arrayList, ",");
                    return join;
                } else {
                    return null;
                }

            }
        }
        return gwc;
    }
}

