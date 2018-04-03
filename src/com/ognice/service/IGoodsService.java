package com.ognice.service;

import java.util.List;
import java.util.Map;

import com.ognice.domain.Goods;
import com.ognice.domain.GoodsType;

public interface IGoodsService {
	int deleteGoods(Long gid);

    int insert(Goods record);

    Goods selectGoods(Long gid);

    int updateGoods(Goods record);
    
    int countGoods(Goods goods);
    
    int deleteByPrimaryKey(Long tid);

    int insert(GoodsType record);

    int insertSelective(GoodsType record);

    GoodsType selectGoodsType(Long tid);

    int updateByPrimaryKeySelective(GoodsType record);

    int updateByPrimaryKey(GoodsType record);
    
    
    Map queryGoodsList(String goodsName, Integer pageIndex,
			Integer pageSize,Long goodtype);
    
    int countGoodsType(GoodsType type);
    
    
    Map quertGoodsTypeList(String tName, Integer pageIndex,
			Integer pageSize);

    List<GoodsType> getAllGoodsType();
    
    List<Goods> getAllGodds(Long type);
}
