package com.lzt.dao;

import java.util.List;
import java.util.Map;


import com.lzt.entity.ProdVo;
import com.lzt.entity.Spu;

public interface SpuMapper {
    int deleteByPrimaryKey(Integer spuId);

    int insert(Spu record);

    int insertSelective(Spu record);

    Spu selectByPrimaryKey(Integer spuId);

    int updateByPrimaryKeySelective(Spu record);

    int updateByPrimaryKey(Spu record);
    
    List<Spu> selectByAll(Spu record);

    List<ProdVo> selectProd(Map<String,Object> map);

	Integer selectProdCount(Spu spu);

	List<ProdVo> selectProdBySkuId(Map<String, Object> map);
}