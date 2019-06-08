package com.lzt.service;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.lzt.entity.ShiJuan;
import com.lzt.entity.ShiJuanVo;
public interface ShiJuanService {

	HashMap<String,Object> prodShiJuan(HttpServletRequest request);

	List<ShiJuan> selByKsrSjNum(Integer userId);

	List<ShiJuanVo> selBysjId(String sjId);


}
