package com.ognice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ognice.service.IPersonService;
import com.ognice.util.PageConstants;

@SuppressWarnings("rawtypes")
@Controller
@RequestMapping("/person")
public class PersonController {
	
	@Autowired
	private IPersonService personService;
	
	
	@RequestMapping(value="/pList")
	public String getAllPerson(HttpServletRequest request,HttpServletResponse response,ModelMap model,String personName,String userName,Integer pageIndex)
	{
		Integer pageSize=PageConstants.PAGESIZE;
		Map map=personService.queryAllPersonList(personName, userName, pageIndex, pageSize);
		model.addAttribute("data", map);
		return "admin/pList";
		
	}
}
