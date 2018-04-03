package com.ognice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ognice.domain.Goods;
import com.ognice.domain.GoodsType;
import com.ognice.domain.Result;
import com.ognice.service.IGoodsService;
import com.ognice.util.PageConstants;

@SuppressWarnings("rawtypes")
@Controller
@RequestMapping("/goodsType")
public class GoodsTypeController {
	
	@Autowired
	private IGoodsService goodsService;
	
	
	@RequestMapping(value="/gtList")
	public String getAllPerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,String tName,Integer pageIndex)
	{
		if (pageIndex==null||pageIndex<1) {
			pageIndex=1;
		}
		Integer pageSize=(Integer)request.getServletContext().getAttribute("gtPage");
		if (pageSize==null) {
			pageSize=PageConstants.PAGESIZE;
		}
		Map map=goodsService.quertGoodsTypeList(tName, pageIndex, pageSize);
		model.addAttribute("data", map);
		if (Integer.valueOf(String.valueOf(map.get("total")))==0) {
			model.addAttribute("pageIndex", 1);
		}
		return "admin/gtList";
		
	}
	@RequestMapping(value="/addGoodsType",method=RequestMethod.GET)
	public String gotoAddPerson(HttpServletRequest request,HttpServletResponse response,ModelMap model)
	{
		return "admin/addGoodsType";
	}
	@RequestMapping(value="/saveGoodsType",method=RequestMethod.POST)
	public String savePerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,GoodsType  goodsType)
	{
		int num= goodsService.insert(goodsType);
		if (num==1) {
			Result result=new Result<>(1, "保存商品类型成功!", "/goodsType/gtList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "保存商品类型失败", "/goodsType/gtList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	
	
	@RequestMapping(value="editGoodsType",method=RequestMethod.GET)
	public String editPerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,Long id)
	{
		GoodsType goods=goodsService.selectGoodsType(id);
		model.addAttribute("goodsType", goods);
		return "admin/editGoodsType";
	}
	@RequestMapping(value="updateGoodsType",method=RequestMethod.POST)
	public String updatePerson(HttpServletRequest request,HttpServletResponse response,GoodsType  goodsType,ModelMap model)
	{
		int num=goodsService.updateByPrimaryKeySelective(goodsType);
		if (num==1) {
			Result result=new Result<>(1, "更新商品类型成功!", "/goodsType/gtList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "更新商品类型失败", "/goodsType/gtList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	
	@RequestMapping(value="deleteGoodsType",method=RequestMethod.GET)
	public String deletePerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,Long tId)
	{
		int num=goodsService.deleteByPrimaryKey(tId);
		if (num==1) {
			Result result=new Result<>(1, "删除商品类型成功!", "/goodsType/gtList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "删除商品类型失败", "/goodsType/gtList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	
}
