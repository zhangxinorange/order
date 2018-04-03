package com.ognice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ognice.domain.Goods;
import com.ognice.domain.GoodsType;
import com.ognice.domain.Person;
import com.ognice.domain.Result;
import com.ognice.service.IGoodsService;
import com.ognice.service.IPersonService;
import com.ognice.util.PageConstants;
import com.ognice.util.ResultUtil;

@SuppressWarnings("rawtypes")
@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private IGoodsService goodsService;
	
	
	@RequestMapping(value="/gList")
	public String getAllPerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,String goodName,Integer pageIndex,Long goodtype)
	{
		if (pageIndex==null||pageIndex<1) {
			pageIndex=1;
		}
		Integer pageSize=(Integer)request.getServletContext().getAttribute("gPage");
		if (pageSize==null) {
			pageSize=PageConstants.PAGESIZE;
		}
		List<GoodsType> gtList=goodsService.getAllGoodsType();
		Map map=goodsService.queryGoodsList(goodName, pageIndex, pageSize,goodtype);
		model.addAttribute("data", map);
		model.addAttribute("tList", gtList);
		return "admin/gList";
		
	}
	@RequestMapping(value="/addGoods",method=RequestMethod.GET)
	public String gotoAddPerson(HttpServletRequest request,HttpServletResponse response,ModelMap model)
	{
		List<GoodsType> gtList=goodsService.getAllGoodsType();
		model.addAttribute("tList", gtList);
		return "admin/addGoods";
	}
	@RequestMapping(value="/saveGoods",method=RequestMethod.POST)
	public String savePerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,Goods good)
	{
		int num= goodsService.insert(good);
		if (num==1) {
			Result result=new Result<>(1, "保存商品成功!", "/goods/gList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "保存商品失败", "/goods/gList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	
	
	@RequestMapping(value="editGoods",method=RequestMethod.GET)
	public String editPerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,Long id)
	{
		Goods goods=goodsService.selectGoods(id);
		model.addAttribute("goods", goods);
		List<GoodsType> gtList=goodsService.getAllGoodsType();
		model.addAttribute("tList", gtList);
		return "admin/editGoods";
	}
	@RequestMapping(value="updateGoods",method=RequestMethod.POST)
	public String updatePerson(HttpServletRequest request,HttpServletResponse response,Goods goods,ModelMap model)
	{
		int num=goodsService.updateGoods(goods);
		if (num==1) {
			Result result=new Result<>(1, "更新商品成功!", "/goods/gList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "更新商品失败", "/goods/gList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	
	@RequestMapping(value="deleteGoods",method=RequestMethod.GET)
	public String deletePerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,Long gId)
	{
		int num=goodsService.deleteGoods(gId);
		if (num==1) {
			Result result=new Result<>(1, "删除商品成功!", "/goods/gList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "删除商品失败", "/goods/gList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	
}
