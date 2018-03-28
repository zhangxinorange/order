package com.ognice.service;

import java.util.List;
import java.util.Map;

import com.ognice.domain.Order;

public interface iOrderService {
	int deleteByPrimaryKey(Long id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> queryAllOrderByUserIdList(Long id,String orderName);
    
    Map queryAllOrderByUserIdListForPage(Long id,String orderName,Integer pageIndex,Integer pageSize);
    
    Map queryAllOrderListForPage(String orderName,String userName,Integer pageIndex,Integer pageSize);
    
    Map getMapOrderForUserId(Long id);
    Map getMapOrder();
}
