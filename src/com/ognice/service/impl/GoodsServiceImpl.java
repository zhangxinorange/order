package com.ognice.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ognice.dao.GoodsMapper;
import com.ognice.dao.GoodsTypeMapper;
import com.ognice.domain.Goods;
import com.ognice.domain.GoodsType;
import com.ognice.service.IGoodsService;
@SuppressWarnings({ "unchecked", "rawtypes" })
@Service
public class GoodsServiceImpl implements IGoodsService {
	
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Autowired
	private GoodsTypeMapper goodsTypeMapper;
 
	@Override
	public int deleteGoods(Long gid) {
		// TODO Auto-generated method stub
		return goodsMapper.deleteByPrimaryKey(gid);
	}

	@Override
	public int insert(Goods record) {
		// TODO Auto-generated method stub
		return goodsMapper.insert(record);
	}

	@Override
	public Goods selectGoods(Long gid) {
		// TODO Auto-generated method stub
		return goodsMapper.selectByPrimaryKey(gid);
	}

	@Override
	public int updateGoods(Goods record) {
		// TODO Auto-generated method stub
		return goodsMapper.updateByPrimaryKey(record);
	}

	@Override
	public int countGoods(Goods goods) {
		// TODO Auto-generated method stub
		return goodsMapper.countGoods(goods);
	}

	@Override
	public int deleteByPrimaryKey(Long tid) {
		// TODO Auto-generated method stub
		return goodsTypeMapper.deleteByPrimaryKey(tid);
	}

	@Override
	public int insert(GoodsType record) {
		// TODO Auto-generated method stub
		return goodsTypeMapper.insert(record);
	}

	@Override
	public int insertSelective(GoodsType record) {
		// TODO Auto-generated method stub
		return goodsTypeMapper.insertSelective(record);
	}

	@Override
	public GoodsType selectGoodsType(Long tid) {
		// TODO Auto-generated method stub
		return goodsTypeMapper.selectByPrimaryKey(tid);
	}

	@Override
	public int updateByPrimaryKeySelective(GoodsType record) {
		// TODO Auto-generated method stub
		return goodsTypeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(GoodsType record) {
		// TODO Auto-generated method stub
		return goodsTypeMapper.updateByPrimaryKey(record);
	}

	@Override
	public int countGoodsType(GoodsType type) {
		// TODO Auto-generated method stub
		return goodsTypeMapper.countGoodsType(type);
	}

	@Override
	public Map queryGoodsList(String goodsName, Integer pageIndex,
			Integer pageSize,Long goodtype) {
		Goods goods=new Goods(goodsName,goodtype);
		Integer total=goodsMapper.countGoods(goods);
		if (pageSize==null) {
			pageSize=5;
		}
		Integer pageCount=(int)Math.ceil(1.0*total/pageSize);
		if (pageIndex==null) {
			pageIndex=1;
		}
		if (pageIndex>pageCount&&pageCount!=0) {
			pageIndex=pageCount;
		}
		Integer start=pageSize*(pageIndex-1);
		Integer end=pageSize;
		Map map=new HashMap<>();
		map.put("data", goods);
		map.put("start", start);
		map.put("end", end);
		List<Goods> oList=goodsMapper.queryGoodsList(map);
		Map result=new HashMap<>();
		result.put("data", oList);
		result.put("total", total);
		result.put("pageIndex", pageIndex);
		result.put("pageCount", pageCount);
		return result;
	}

	@Override
	public Map quertGoodsTypeList(String goodsName, Integer pageIndex,
			Integer pageSize) {
		GoodsType type=new GoodsType(goodsName);
		Integer total=goodsTypeMapper.countGoodsType(type);
		if (pageSize==null) {
			pageSize=5;
		}
		Integer pageCount=(int)Math.ceil(1.0*total/pageSize);
		if (pageIndex==null) {
			pageIndex=1;
		}
		if (pageIndex>pageCount&&pageCount!=0) {
			pageIndex=pageCount;
		}
		Integer start=pageSize*(pageIndex-1);
		Integer end=pageSize;
		Map map=new HashMap<>();
		map.put("data", type);
		map.put("start", start);
		map.put("end", end);
		List<GoodsType> oList=goodsTypeMapper.quertGoodsTypeList(map);
		Map result=new HashMap<>();
		result.put("data", oList);
		result.put("total", total);
		result.put("pageIndex", pageIndex);
		result.put("pageCount", pageCount);
		return result;
	}

	@Override
	public List<GoodsType> getAllGoodsType() {
		// TODO Auto-generated method stub
		return goodsTypeMapper.getAllGoodsType();
	}

	@Override
	public List<Goods> getAllGodds(Long type) {
		Goods  goods=new Goods(type);
		return goodsMapper.getAllGodds(goods);
	}

}
