package com.lzt.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.lzt.entity.Spu;

public interface SkuService {

	Integer insertSku(String spuId,String skuName, Integer kucun, BigDecimal jiage, String shuxingSId);


}
