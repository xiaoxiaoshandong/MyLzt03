package com.lzt.service;

import java.util.List;

import com.lzt.entity.ShuxingS;

public interface ShuxingSService {

	List<ShuxingS> selectByAll(ShuxingS shuxingS);

	Integer updateShuxingS(ShuxingS shuxingS);

}
