package com.ognice.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ognice.controller.common.PageResult;
import com.ognice.controller.common.PageSearchParam;
import com.ognice.domain.Preuser;
import com.ognice.domain.Store;
import com.ognice.domain.Storedetail;
import com.ognice.service.IStoreService;
import com.ognice.service.IStoredetailService;
/**
 * @author ..(952396697@qq.com)<br>
 * @date 2017-06-21
 * 明细表 controller
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/storedetail", method = RequestMethod.GET)
public class StoredetailController {
    @Resource
    private IStoredetailService storedetailService;
    @Resource
    private IStoreService storeService;
    /**
     *列表
     */
    @RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
    public String index(ModelMap model, Storedetail searchParam, Integer page, Integer pageSize) {
        PageSearchParam pageSearch = new PageSearchParam();
        pageSearch.setPage(page == null ? 1 : page);
        pageSearch.setPagesize(pageSize == null ? 20000 : pageSize);
        pageSearch.setParams(searchParam);
        PageResult pageResult = storedetailService.getPages(pageSearch);
        model.addAttribute("datas", pageResult);
        return "pre/detailList";
    }
	//新增
    @RequestMapping(value = "/add", method = { RequestMethod.GET, RequestMethod.POST })
    public String add(HttpServletRequest request, Storedetail record, ModelMap model,String datestr) {
        if(record.getR_id()!=null){
            Store s=storeService.getStoreById(record.getR_id().longValue());
            record.setR_name(s.getR_name());
            record.setR_unit(s.getR_unit());
        }

      
        model.addAttribute("record", record);
        if ("post".equals(request.getMethod().toLowerCase())) {
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Date d;
            try {
                d = sdf.parse(datestr);
                record.setOrder_date(d);
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            
            Preuser user = (Preuser) request.getSession().getAttribute("indexUser");
            record.setC_id(user.getId().intValue());
            String msg = storedetailService.save(record);
            Store s=storeService.getStoreById(record.getR_id().longValue());
            if(record.getType()==0){
                s.setR_num(s.getR_num()+record.getS_num());
            }else if(record.getType()==1){
                s.setR_num(s.getR_num()-record.getS_num());
            }else if(record.getType()==2){
                s.setR_num(s.getR_num()-record.getS_num());

            }
            if(s.getR_num()<0){
                model.addAttribute("msg", "库存数量不足");
                return "pre/detailForm";

            }
            storeService.update(s);
            
            if (msg.equals("添加成功")) {
                return "redirect:/storedetail?c_id="+user.getId();
            }
            model.addAttribute("msg", msg);
        }


        return "pre/detailForm";
    }
	
    //更新
    @RequestMapping(value = "/update",method = { RequestMethod.GET, RequestMethod.POST })
    public String update(HttpServletRequest request, Storedetail record, ModelMap model) {
    	storedetailService.update(record);
    	  Store s=storeService.getStoreById(record.getR_id().longValue());
          if(record.getType()==0){
              s.setR_num(s.getR_num()+record.getS_num());
          }else if(record.getType()==1){
              s.setR_num(s.getR_num()-record.getS_num());
          }else if(record.getType()==2){
              s.setR_num(s.getR_num()-record.getS_num());

          }
        return "redirect:/storedetail";
    }
    //删除
    @RequestMapping(value = "/del")
    public String del(ModelMap model,Long id) {
        Storedetail record=storedetailService.getStoredetailById(id);
        Store s=storeService.getStoreById(record.getR_id().longValue());
            s.setR_num(s.getR_num()-record.getS_num());
            if(s.getR_num()<0){
                s.setR_num(0);
            }
            storeService.update(s);
        storedetailService.delete(id);

        return "redirect:/storedetail";
    }
}
