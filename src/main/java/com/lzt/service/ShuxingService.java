package com.lzt.service;

import java.util.List;

import com.lzt.entity.Shuxing;

public interface ShuxingService {

	Integer addShuxing(String erjiId, String shuxingName, String shuxingSVal);

	List<Shuxing> selectShuxing(Shuxing shuxing);

	Integer supdateShuxing(Shuxing shuxing);


}
