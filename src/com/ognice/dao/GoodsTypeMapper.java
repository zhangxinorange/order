package com.ognice.dao;

import java.util.List;
import java.util.Map;

import com.ognice.domain.GoodsType;

public interface GoodsTypeMapper {
    int deleteByPrimaryKey(Long tid);

    int insert(GoodsType record);

    int insertSelective(GoodsType record);

    GoodsType selectByPrimaryKey(Long tid);

    int updateByPrimaryKeySelective(GoodsType record);

    int updateByPrimaryKey(GoodsType record);
    
    
    int countGoodsType(GoodsType type);
    
    
    List<GoodsType> quertGoodsTypeList(Map map);
    
    List<GoodsType> getAllGoodsType();
}