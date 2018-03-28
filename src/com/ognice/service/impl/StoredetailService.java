/**
 *
 */
package com.ognice.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ognice.controller.common.PageResult;
import com.ognice.controller.common.PageSearchParam;
import com.ognice.dao.StoredetailMapper;
import com.ognice.domain.Storedetail;
import com.ognice.service.IStoredetailService;
/**
* 
* 明细表 service接口实现类
*
**/
@Service("storedetailService")
public class StoredetailService implements IStoredetailService {
    @Resource
    private StoredetailMapper storedetailMapper;

    public Storedetail getStoredetailById(Long id) {
        return storedetailMapper.selectStoredetailById(id);
    }

    public String save(Storedetail record) {
            if (1 == storedetailMapper.insert(record)) {
                return "添加成功";
            }
        return "添加失败";
    }

    public PageResult getPages(PageSearchParam param) {
        PageResult pageResult = new PageResult();
        pageResult.setPagesize(param.getPagesize());
        pageResult.setPage(param.getPage());
        param.setPage((param.getPage() - 1) * param.getPagesize());
        List<Storedetail> storedetails = storedetailMapper.page(param);
        pageResult.setData(storedetails);
        param.setPage(null);
        pageResult.setTotal(storedetailMapper.page(param).size());
        pageResult.setTotalPage((int) Math.ceil(((double) pageResult.getTotal() / pageResult.getPagesize())));
        return pageResult;
    }

    public int update(Storedetail record) {
        return storedetailMapper.update(record);
    }
    
    public int delete(Long id) {
        return storedetailMapper.delete(id);
    }
    
    public List<Storedetail> all() {
		// TODO Auto-generated method stub
		return storedetailMapper.page(new PageSearchParam());
	}

}
