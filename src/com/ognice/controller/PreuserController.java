package com.ognice.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ognice.domain.Preuser;
import com.ognice.service.IPreuserService;
/**
 * @author ..(952396697@qq.com)<br>
 * @date 2017-06-21
 *  controller
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/preuser", method = RequestMethod.GET)
public class PreuserController {
    @Resource
    private IPreuserService preuserService;




    //更新
    @RequestMapping(value = "/update",method = { RequestMethod.GET, RequestMethod.POST })
    public String update(HttpServletRequest request, Preuser record, ModelMap model) {
    	preuserService.update(record);
        request.getSession().setAttribute("indexUser", preuserService.getPreuserById(record.getId()));

        return "redirect:/";
    }
  
}
