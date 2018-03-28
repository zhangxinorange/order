package com.ognice.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ognice.controller.common.PageResult;
import com.ognice.controller.common.PageSearchParam;
import com.ognice.domain.Store;
import com.ognice.service.IStoreService;

/**
 * @author ..(952396697@qq.com)<br>
 * @date 2017-06-21
 * 库存表 controller
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/store", method = RequestMethod.GET)
public class StoreController {
    @Resource
    private IStoreService storeService;

    /**
     *列表
     */
    @RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
    public String index(ModelMap model, Store searchParam, Integer page, Integer pageSize) {
        PageSearchParam pageSearch = new PageSearchParam();
        pageSearch.setPage(page == null ? 1 : page);
        pageSearch.setPagesize(pageSize == null ? 20000 : pageSize);
        pageSearch.setParams(searchParam);
        PageResult pageResult = storeService.getPages(pageSearch);
        model.addAttribute("list", pageResult);
        return "pre/storeList";
    }

    // 查看
    @RequestMapping(value = "/view")
    public String view(ModelMap model, Long id) {
        Store record = storeService.getStoreById(id);
        model.addAttribute("record", record);
        model.addAttribute("edit", false);
        return "pre/storeView";
    }

    // 编辑
    @RequestMapping(value = "/edit")
    public String edit(ModelMap model, Long id) {
        Store record = storeService.getStoreById(id);
        model.addAttribute("record", record);
        model.addAttribute("edit", true);
        return "pre/storeEdit";
    }

    // 更新
    @RequestMapping(value = "/update", method = { RequestMethod.GET, RequestMethod.POST })
    public String update(HttpServletRequest request, Store record, ModelMap model) {
        storeService.update(record);
        return "redirect:/index/storeList";
    }

    // 删除
    @RequestMapping(value = "/del")
    public String del(ModelMap model, Long id) {
        storeService.delete(id);
        return "redirect:/index/storeList";
    }
}
