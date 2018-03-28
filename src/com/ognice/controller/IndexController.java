/**
 *
 */
package com.ognice.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ognice.controller.common.PageResult;
import com.ognice.controller.common.PageSearchParam;
import com.ognice.domain.Order;
import com.ognice.domain.Person;
import com.ognice.domain.Preuser;
import com.ognice.domain.Result;
import com.ognice.domain.Store;
import com.ognice.service.IMenuService;
import com.ognice.service.IPersonService;
import com.ognice.service.IPreuserService;
import com.ognice.service.IStoreService;
import com.ognice.service.IUserService;
import com.ognice.service.iOrderService;
import com.ognice.util.ResultUtil;
import com.sun.xml.internal.ws.util.StringUtils;

/****
 * 用户登录
 * @author zx
 *
 */
@Controller
public class IndexController {
    @Resource
    private IUserService userservice;

    @Resource
    private IPreuserService preuserservice;

    @Resource
    private IStoreService storeService;

    @Resource
    private IMenuService menuservice;
    
    
    @Autowired
    private IPersonService personService;
    
    @Autowired
    private iOrderService orderService;

    /**
    *
    */
    @RequestMapping(value = "/index/reset", method = RequestMethod.GET)
    public String index(ModelMap model) {
        model.addAttribute("message", "Hello Spring MVC Framework!");
        return "pre/resetPsw";
    }

    @RequestMapping(value = "/index/repsw", method = RequestMethod.POST)
    public String repsw(HttpServletRequest request, ModelMap model, String psw1, String psw2) {
        Preuser user = (Preuser) request.getSession().getAttribute("indexUser");
        if (psw1.equals(psw2)) {
            user.setC_passwd(psw1);
            preuserservice.update(user);
        } else {
            model.addAttribute("msg", "两次密码不一致");
        }
        request.getSession().removeAttribute("indexUser");
        return "redirect:/";
    }

    /**
    *
    */
    @RequestMapping(value = "/index")
    public String preindex(HttpServletRequest request, Model model) {
    	Person person=(Person)request.getSession().getAttribute("indexUser");
    	if (person==null) {
			return "pre/login";
		}
    	else {
    		if (person.getRole()==null||person.getRole().equals(1)) {

    			List<Order> oList=orderService.queryAllOrderByUserIdList(person.getId(),null);
    			model.addAttribute("oList", oList);
    			model.addAttribute("person", person);
    			return "user/main";
			}
    		else {
    			return "admin/main";
			}
		}
    }
    
    @RequestMapping(value="/index/top")
    public String gotoTop(HttpServletRequest request,Model model)
    {
    	Person person=(Person)request.getSession().getAttribute("indexUser");
    	model.addAttribute("person", person);
    	if (person.getRole()==null||person.getRole().equals(1)) {
        	return "user/top";
		}
    	else {
			return "admin/top";
		}
    }
    
    @RequestMapping(value="/index/left")
    public String gotoLeft(HttpServletRequest request,Model model)
    {
    	Person person=(Person)request.getSession().getAttribute("indexUser");
    	model.addAttribute("person", person);
    	if (person.getRole()==null||person.getRole().equals(1)) {
			return "user/left";
		}
    	else {
    		return "admin/left";
		}
    	
    }
    @RequestMapping(value="/index/out")
    public String out(HttpServletRequest request,Model model)
    {
    	request.getSession().removeAttribute("indexUser");
    	return "redirect:/index/login";
    	
    }
    
    @RequestMapping(value="/index/forgetPwd",method=RequestMethod.GET)
    public String gtoforgetPwd(HttpServletRequest request,Model model)
    {
    	return "user/forgetPwd";
    }
    
    @SuppressWarnings("rawtypes")
	@RequestMapping(value="/index/forgetPwd",method=RequestMethod.POST)
    public @ResponseBody Result forgetPwd(HttpServletRequest request,Model model,String uName,String pName)
    {
    	Person person=personService.getPersonByUNameAndPName(uName, pName);
    	if (person==null) {
			return ResultUtil.error(2, "用户名或登录名输入有误，查无此人");
		}
    	else {
			person.setPassword("1");
			int num=personService.updateByPrimaryKeySelective(person);
			if (num==1) {
				return ResultUtil.success("密码已重置为1，请牢记");
			}
			else {
				return ResultUtil.error(1,"修改用户密码失败");
			}
		}
    	//return ResultUtil.success();
    }
    

    /**
    *登录方法
    */
    @SuppressWarnings("rawtypes")
	@RequestMapping(value = "/index/login", method = RequestMethod.POST)
    public @ResponseBody Result login(HttpServletRequest request, ModelMap model,String userName,String password) throws Exception{

        Person person=personService.login(userName, password);
        if (null == person) {
        	
            return ResultUtil.error(2, "用户名密码错误，请重新输入");

        }
        request.getSession().setAttribute("indexUser", person);
        return ResultUtil.success();
    }
    
    @RequestMapping(value = "/index/login", method = RequestMethod.GET)
    public String gotologin(HttpServletRequest request, ModelMap model) {
        return "pre/login";
    }

    
   /* *//**
    *
    *//*
    @RequestMapping(value = "/index/detail", method = RequestMethod.GET)
    public String detail(HttpServletRequest request, ModelMap model) {
        Preuser user = (Preuser) request.getSession().getAttribute("indexUser");
        Integer num = storeService.allNum(1L);
        model.addAttribute("allNum", num == null ? 0 : num);
        model.addAttribute("jiyaNum", num == null ? 0 : num);
        model.addAttribute("duanqueNum", num == null ? 0 : num);
        return "pre/detailForm";
    }

    *//**
    *
    *//*
    @RequestMapping(value = "/index/store", method = RequestMethod.GET)
    public String store(HttpServletRequest request, ModelMap model) {
        return "pre/storeForm";
    }

    *//**
    *
    *//*
    @RequestMapping(value = "/index/storeList", method = RequestMethod.GET)
    public String storeList(HttpServletRequest request, ModelMap model) {
        Preuser user = (Preuser) request.getSession().getAttribute("indexUser");
        Store s = new Store();
        s.setC_id(user.getId().intValue());
        PageSearchParam param = new PageSearchParam();
        param.setPage(1);
        param.setPagesize(100000);
        param.setParams(s);
        model.addAttribute("list", storeService.getPages(param));
        return "pre/storeList";
    }

    *//**
    *
    *//*
    @RequestMapping(value = "/index/saveStore", method = RequestMethod.POST)
    public String saveStore(HttpServletRequest request, ModelMap model, Store s) {
        Preuser user = (Preuser) request.getSession().getAttribute("indexUser");
        s.setC_id(user.getId().intValue());
        s.setR_date(new Date());
        s.setR_state(0);
        s.setR_comp(user.getC_ind());
        storeService.save(s);
        return "redirect:/index/storeList";
    }

    @RequestMapping(value = "/index/userinfo", method = RequestMethod.GET)
    public String userinfo(HttpServletRequest request, ModelMap model, Store s) {
        return "pre/userInfo";
    }
*/
    /**
    *
    */

    /**
    *
    */
   /* @RequestMapping(value = "/index")
    public String index(HttpServletRequest request, HttpServletResponse response) {
        return "pre/index";
    }*/

    /**
    *
    */
    @RequestMapping(value = "/index/logout")
    public String logout2(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute("indexUser");
        return "redirect:/";
    }

    /**
    *
    */

}
