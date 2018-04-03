package com.ognice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ognice.domain.Goods;
import com.ognice.domain.GoodsType;
import com.ognice.domain.Order;
import com.ognice.domain.Person;
import com.ognice.domain.Result;
import com.ognice.service.IGoodsService;
import com.ognice.service.iOrderService;
import com.ognice.util.PageConstants;
import com.ognice.util.ResultUtil;
@SuppressWarnings({ "unchecked", "rawtypes" })
@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private iOrderService orderService;
	
	@Autowired
	private IGoodsService goodsService;

	@RequestMapping(value = "/addOrder", method = RequestMethod.GET)
	public String addOrder(HttpServletRequest request, Model model) {
		List<GoodsType> gtList=goodsService.getAllGoodsType();
		model.addAttribute("tList", gtList);
		Person person = (Person) request.getSession().getAttribute("indexUser");
		model.addAttribute("person", person);
		return "user/addOrder";
	}
	@RequestMapping(value = "/editOrder", method = RequestMethod.GET)
	public String editOrder(HttpServletRequest request, Model model,String oId) {
		Person person = (Person) request.getSession().getAttribute("indexUser");
		model.addAttribute("person", person);
		List<GoodsType> gtList=goodsService.getAllGoodsType();
		model.addAttribute("tList", gtList);
		Order order=orderService.selectByPrimaryKey(Long.valueOf(oId));
		model.addAttribute("order", order);
		return "user/editOrder";
	}

	
	@RequestMapping(value = "/deleteOrder", method = RequestMethod.GET)
	public String deleteOrder(HttpServletRequest request, Model model,String oId,Integer type) {
		int num=0;
		if (type==null) {
			Order order=orderService.selectByPrimaryKey(Long.valueOf(oId));
			order.setoStatus(1);
			 num =orderService.updateByPrimaryKeySelective(order);
		}
		else {
			 num =orderService.deleteByPrimaryKey(Long.valueOf(oId));
		}
		
		if (num == 1) {
			Result result=new Result(0, "删除订单成功", "/order/orderList");
			model.addAttribute("result", result);
			return "user/success";
		} else {
			Result result=new Result(0, "删除订单失败", "/order/orderList");
			model.addAttribute("result", result);
			return "user/error";
		}
	}
	
	@RequestMapping(value = "/saveOrder", method = RequestMethod.POST)
	public String saveOrder(HttpServletRequest request, Model model, Order order) {
		int num = orderService.insert(order);
		if (num == 1) {
			Result result=new Result(0, "新增订单成功", "/order/orderList");
			model.addAttribute("result", result);
			return "user/success";
		} else {
			Result result=new Result(0, "新增订单失败", "/order/orderList");
			model.addAttribute("result", result);
			return "user/error";
		}
	}
	
	@RequestMapping(value = "/gototongji", method = RequestMethod.GET)
	public String gototongji(HttpServletRequest request, Model model) {
		Person person = (Person) request.getSession().getAttribute("indexUser");
		if (person.getRole()==null||person.getRole().equals(1)) {
			return "user/accOrder";
		}
		else
		{
			return "admin/accOrder";
		}
		/*Map map=orderService.getMapOrderForUserId(person.getId());
		map.put("userName", person.getUsername());
		model.addAttribute("data", map);*/
		
	}
	@RequestMapping(value = "/tongji", method = RequestMethod.POST)
	public @ResponseBody Map tongji(HttpServletRequest request) {
		Person person = (Person) request.getSession().getAttribute("indexUser");
		if (person.getRole()==null||person.getRole().equals(1)) {
			Map map=orderService.getMapOrderForUserId(person.getId());
			map.put("userName", person.getUsername());
			return map;
		}
		else{
			Map map=orderService.getMapOrder();
			return map;
		}
		
		
	}
	
	@RequestMapping(value = "/searchGoods", method = RequestMethod.POST)
	public @ResponseBody Result searchGoods(HttpServletRequest request,Long type) {
		List<Goods> gList=goodsService.getAllGodds(type);
		return ResultUtil.success(gList);
	}
	
	
	@RequestMapping(value = "/updateOrder", method = RequestMethod.POST)
	public String updateOrder(HttpServletRequest request, Model model, Order order) {
		int num = orderService.updateByPrimaryKeySelective(order);
		if (num == 1) {
			Result result=new Result(0, "修改订单成功", "/order/orderList");
			model.addAttribute("result", result);
			return "user/success";
		} else {
			Result result=new Result(0, "修改订单失败", "/order/orderList");
			model.addAttribute("result", result);
			return "user/error";
		}
	}
	
	@RequestMapping(value = "/reOrder", method = RequestMethod.GET)
	public String reOrder(HttpServletRequest request, Model model, Long oId) {
		Order order=orderService.selectByPrimaryKey(oId);
		order.setoStatus(0);
		int num = orderService.updateByPrimaryKeySelective(order);
		if (num == 1) {
			Result result=new Result(0, "恢复订单成功", "/order/dOrderList");
			model.addAttribute("result", result);
			return "user/success";
		} else {
			Result result=new Result(0, "恢复订单失败", "/order/dOrderList");
			model.addAttribute("result", result);
			return "user/error";
		}
	}
	/***
	 * 进入订单列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/orderList")
	public  String gotoOrderList(HttpServletRequest request, Model model,String orderName,Integer pageIndex,String userName)
	{
		Person person = (Person) request.getSession().getAttribute("indexUser");
		//List<Order> oList=orderService.queryAllOrderByUserIdList(person.getId(),orderName);
		if (pageIndex==null||pageIndex<1) {
			pageIndex=1;
		}
		Integer pageSize=(Integer)request.getServletContext().getAttribute("oPage");
		if (pageSize==null) {
			pageSize=PageConstants.PAGESIZE;
		}
		if (person.getRole()==null||person.getRole().equals(1)) {
			
			Map map=orderService.queryAllOrderByUserIdListForPage(person.getId(), orderName, pageIndex, pageSize);
			model.addAttribute("data", map);
			model.addAttribute("person", person);
			return "user/orderList";
		}
		else {
			Map map=orderService.queryAllOrderListForPage(orderName, userName, pageIndex, pageSize);
			model.addAttribute("data", map);
			model.addAttribute("person", person);
			return "admin/orderList";
		}
	}
	
	/***
	 * 进入删除订单列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/dOrderList")
	public  String dOrderList(HttpServletRequest request, Model model,Integer pageIndex)
	{
		Person person = (Person) request.getSession().getAttribute("indexUser");
		//List<Order> oList=orderService.queryAllOrderByUserIdList(person.getId(),orderName);
		if (pageIndex==null||pageIndex<1) {
			pageIndex=1;
		}
		Integer pageSize=(Integer)request.getServletContext().getAttribute("oPage");
		if (pageSize==null) {
			pageSize=PageConstants.PAGESIZE;
		}
			
			Map map=orderService.querydAllOrderByUserIdListForPage(person.getId(),pageIndex, pageSize);
			model.addAttribute("data", map);
			model.addAttribute("person", person);
			return "user/delOrderList";
	}
}
