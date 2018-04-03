package com.ognice.dao;

import java.util.List;
import java.util.Map;

import com.ognice.domain.Goods;

public interface GoodsMapper {
    int deleteByPrimaryKey(Long gid);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Long gid);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
    
    int countGoods(Goods goods);
    
    List<Goods> queryGoodsList(Map map);
    
    List<Goods> getAllGodds(Goods goods);
    
}