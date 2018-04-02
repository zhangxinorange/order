package com.ognice.dao;

import java.util.List;
import java.util.Map;

import com.ognice.domain.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> queryAllOrderByUserIdList(Order order);
    
    List<Order> queryAllOrderByUserIdListPage(Map data);
    
    
    int countAllOrderByUserIdList(Order order);
    
    int countdAllOrderByUserIdList(Order order);
    
    List<Order> querydAllOrderByUserIdListPage(Map data);
}