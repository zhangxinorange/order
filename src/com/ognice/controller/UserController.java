/**
 *
 */
package com.ognice.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ognice.controller.common.JsonResult;
import com.ognice.domain.User;
import com.ognice.service.IUserService;

/**
 *
 *
 * <br>
 * ========================== <br>
 * 开发：952396697@qq.com <br>
 * 版本：1.0 <br>
 * 创建时间：2016年11月25日 <br>
 * ==========================
 */
@Controller
@RequestMapping(value = "/user", method = RequestMethod.GET)
public class UserController {
	@Resource
	private IUserService userservice;



	

	@RequestMapping(value = "/lock")
	@ResponseBody
	public JsonResult lock(@RequestParam Long id) {
		JsonResult result = new JsonResult();
		User u = userservice.getUserById(id);
		if (null == u) {
			result.setResult(false);
			result.setMsg("用户不存在");
		} else {
			if (u.getRole().equals(0)) {
				u.setRole(1);
			} else {
				u.setRole(0);
			}
			userservice.update(u);
			result.setResult(false);
			result.setMsg("操作成功");
		}

		return result;
	}



}
