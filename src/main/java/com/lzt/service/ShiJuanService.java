package com.lzt.service;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.lzt.entity.KsrDaAnVo;
public interface ShiJuanService {

	HashMap<String,Object> prodShiJuan(HttpServletRequest request);

	Map<String, Object> submitShiJuan(KsrDaAnVo ksrDaAnVo);

}
