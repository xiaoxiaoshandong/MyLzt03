package com.lzt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.lzt.entity.Spu;

public interface SpuService {

	Integer addSpu(List<MultipartFile> list, String erjiId, String chanpinName, HttpServletRequest request);

	Map<String,Object> selectSpu(Spu spu);

}
