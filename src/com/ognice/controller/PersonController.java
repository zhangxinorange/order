package com.ognice.controller;

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

import com.ognice.domain.Person;
import com.ognice.domain.Result;
import com.ognice.service.IPersonService;
import com.ognice.util.PageConstants;
import com.ognice.util.ResultUtil;

@SuppressWarnings("rawtypes")
@Controller
@RequestMapping("/person")
public class PersonController {
	
	@Autowired
	private IPersonService personService;
	
	
	@RequestMapping(value="/pList")
	public String getAllPerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,String personName,String userName,Integer pageIndex)
	{
		if (pageIndex==null||pageIndex<1) {
			pageIndex=1;
		}
		Integer pageSize=(Integer)request.getServletContext().getAttribute("uPage");
		if (pageSize==null) {
			pageSize=PageConstants.PAGESIZE;
		}
		Map map=personService.queryAllPersonList(personName, userName, pageIndex, pageSize);
		model.addAttribute("data", map);
		return "admin/pList";
		
	}
	@RequestMapping(value="/addPerson",method=RequestMethod.GET)
	public String gotoAddPerson(HttpServletRequest request,HttpServletResponse response,ModelMap model)
	{
		return "admin/addPerson";
	}
	@RequestMapping(value="/savePerson",method=RequestMethod.POST)
	public String savePerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,Person person)
	{
		int num= personService.insert(person);
		if (num==1) {
			Result result=new Result<>(1, "保存用户成功!", "/person/pList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "保存用户失败", "/person/pList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	
	@RequestMapping(value="/checkUser",method=RequestMethod.POST)
	public @ResponseBody Result checkUserName(HttpServletRequest request,HttpServletResponse response,String userName)
	{
		if (personService.checkUser(userName)) {
			return ResultUtil.success();
		}
		else {
			return ResultUtil.error(2, "用户登录名已经存在请重新输入");
		}
	}
	@RequestMapping(value="editPerson",method=RequestMethod.GET)
	public String editPerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,Long id)
	{
		Person person=personService.selectByPrimaryKey(id);
		model.addAttribute("person", person);
		return "admin/editPerson";
	}
	@RequestMapping(value="updatePerson",method=RequestMethod.POST)
	public String updatePerson(HttpServletRequest request,HttpServletResponse response,Person person,ModelMap model)
	{
		int num=personService.updateByPrimaryKeySelective(person);
		if (num==1) {
			Result result=new Result<>(1, "更新用户成功!", "/person/pList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "更新用户失败", "/person/pList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	
	@RequestMapping(value="deletePerson",method=RequestMethod.GET)
	public String deletePerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,Long pId)
	{
		int num=personService.deleteByPrimaryKey(pId);
		if (num==1) {
			Result result=new Result<>(1, "删除用户成功!", "/person/pList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "删除用户失败", "/person/pList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	
	@RequestMapping(value="changeUser",method=RequestMethod.GET)
	public String changeUser(HttpServletRequest request,HttpServletResponse response,ModelMap model,Long uId,Integer type)
	{
		Person person=personService.selectByPrimaryKey(uId);
		person.setStatus(type);
		int num=personService.updateByPrimaryKeySelective(person);
		if (num==1) {
			Result result=new Result<>(1, "操作成功!", "/person/pList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "操作失败", "/person/pList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	@RequestMapping(value="resetPwd",method=RequestMethod.GET)
	public String resetPwd(HttpServletRequest request,HttpServletResponse response,ModelMap model,Long uId)
	{
		Person person=personService.selectByPrimaryKey(uId);
		person.setPassword("1");
		int num=personService.updateByPrimaryKeySelective(person);
		if (num==1) {
			Result result=new Result<>(1, "操作成功,密码已成功修改为1，请牢记!", "/person/pList");
			model.addAttribute("result", result);
			return "admin/success";
		}
		else {
			Result result=new Result<>(2, "操作失败", "/person/pList");
			model.addAttribute("result", result);
			return "admin/error";
		}
	}
	@RequestMapping(value="gotoPage",method=RequestMethod.GET)
	public 	String gotoPageChage(HttpServletRequest request,HttpServletResponse response,ModelMap model)
	{
		
		Integer upageSize=(Integer)request.getServletContext().getAttribute("uPage");
		if (upageSize==null) {
			upageSize=PageConstants.PAGESIZE;
		}
		model.addAttribute("usize", upageSize);
		Integer opageSize=(Integer)request.getServletContext().getAttribute("oPage");
		if (opageSize==null) {
			opageSize=PageConstants.PAGESIZE;
		}
		model.addAttribute("osize", opageSize);
		return "admin/changePage";
	}
	@RequestMapping(value="updatePage",method=RequestMethod.POST)
	public String changePage(HttpServletRequest request,HttpServletResponse response,Integer userPage,Integer orderPage,ModelMap model)
	{
		ServletContext app = request.getServletContext();
		app.setAttribute("uPage", userPage);
		app.setAttribute("oPage", orderPage);
		model.addAttribute("result", new Result<>(0, "修改成功!", "/person/pList"));
		return "admin/success";
	}
}
