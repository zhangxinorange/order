package com.ognice.service.impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ognice.dao.OrderMapper;
import com.ognice.domain.Order;
import com.ognice.service.iOrderService;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Service
public class OrderServiceImpl implements iOrderService {
	
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public int deleteByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return orderMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Order record) {
		// TODO Auto-generated method stub
		return orderMapper.insert(record);
	}

	@Override
	public int insertSelective(Order record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Order selectByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return orderMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Order record) {
		// TODO Auto-generated method stub
		try {
			return orderMapper.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Order record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Order> queryAllOrderByUserIdList(Long id,String orderName) {
		try {
			Order order=new Order();
			order.setId(id);
			order.setOrdername(orderName);
			List<Order> oList=orderMapper.queryAllOrderByUserIdList(order);
			return oList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	
	@Override
	public Map getMapOrderForUserId(Long id) {
		Order orders=new Order();
		orders.setId(id);
		List<Order> oList=orderMapper.queryAllOrderByUserIdList(orders);
		Map map=new HashMap<>();
		List<String> set=new LinkedList<>();
		List<Map> lst=new LinkedList<>();
		if (oList!=null&&oList.size()>0) {
			for (Order order : oList) {
				Map dMap=new LinkedHashMap<>();
				set.add(order.getOrdername());
				dMap.put("name", order.getOrdername());
				dMap.put("value", order.getOrdertotal());
				lst.add(dMap);
			}
			
		}
		map.put("title", set);
		map.put("value", lst);
		return map;
	}

	@Override
	public Map queryAllOrderByUserIdListForPage(Long id, String orderName, Integer pageIndex,
			Integer pageSize) {
		Order order=new Order(id,orderName);
		Integer total=orderMapper.countAllOrderByUserIdList(order);
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
		map.put("data", order);
		map.put("start", start);
		map.put("end", end);
		List<Order> oList=orderMapper.queryAllOrderByUserIdListPage(map);
		Map result=new HashMap<>();
		result.put("data", oList);
		result.put("total", total);
		result.put("pageIndex", pageIndex);
		result.put("pageCount", pageCount);
		return result;
	}

	@Override
	public Map queryAllOrderListForPage(String orderName, String userName, Integer pageIndex, Integer pageSize) {
		Order order=new Order(orderName,userName);
		Integer total=orderMapper.countAllOrderByUserIdList(order);
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
		map.put("data", order);
		map.put("start", start);
		map.put("end", end);
		List<Order> oList=orderMapper.queryAllOrderByUserIdListPage(map);
		Map result=new HashMap<>();
		result.put("data", oList);
		result.put("total", total);
		result.put("pageIndex", pageIndex);
		result.put("pageCount", pageCount);
		return result;	}

	@Override
	public Map getMapOrder() {
		List<Order> oList=orderMapper.queryAllOrderByUserIdList(new Order());
		Map map=new HashMap<>();
		
		Map map1=new HashMap<>();
		
		Map map2=new HashMap<>();
		Set<String> set=new LinkedHashSet<>();
		List<String> set2=new LinkedList<>();
		List<Double> lst=new LinkedList<>();
		List<Integer> lst2=new LinkedList<>();
		List<Map> lst3=new LinkedList<>();
		if (oList!=null&&oList.size()>0) {
			for (Order order : oList) {
				String userName=order.getUserName();
				set.add(userName);
			}
			
			for (String name : set) {
				double num=0;
				int n=0;
				for (int i=0;i<oList.size();i++) {
					String userName=oList.get(i).getUserName();
					if (userName.equals(name)) {
						Double s=oList.get(i).getOrdertotal();
						if (s!=null) {
							num=num+s;
						}
						n++;
					}
				}
				lst.add(num);
				lst2.add(n);
			}
			
			if (oList!=null&&oList.size()>0) {
				for (Order order : oList) {
					Map dMap=new LinkedHashMap<>();
					set2.add(order.getOrdername());
					dMap.put("name", order.getOrdername());
					dMap.put("value", order.getOrdertotal());
					lst3.add(dMap);
				}
				
			}
		}
		map1.put("title", set);
		map1.put("value", lst);
		map1.put("value2", lst2);
		
		
		map2.put("title", set2);
		map2.put("value", lst3);
		
		map.put("d1", map1);
		map.put("d2", map2);
		return map;
	}

	@Override
	public Map querydAllOrderByUserIdListForPage(Long id,Integer pageIndex, Integer pageSize) {
		Order order=new Order(id,null);
		Integer total=orderMapper.countdAllOrderByUserIdList(order);
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
		map.put("data", order);
		map.put("start", start);
		map.put("end", end);
		List<Order> oList=orderMapper.querydAllOrderByUserIdListPage(map);
		Map result=new HashMap<>();
		result.put("data", oList);
		result.put("total", total);
		result.put("pageIndex", pageIndex);
		result.put("pageCount", pageCount);
		return result;	
	}

}
