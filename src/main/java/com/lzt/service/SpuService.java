package com.lzt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.lzt.entity.ProdVo;
import com.lzt.entity.Spu;
import com.lzt.myutils.Page;

public interface SpuService {

	Integer addSpu(List<MultipartFile> list, String erjiId, String chanpinName, HttpServletRequest request);

	Map<String,Object> selectSpu(Spu spu);

	Map<String,Object> selectProd(Spu spu,Page page,Integer orderBy,Integer sc,String shuxingSIds);

	Integer selectProdCount(Spu spu);

	List<ProdVo> selectProdBySkuId(Map<String, Object> map);

}
