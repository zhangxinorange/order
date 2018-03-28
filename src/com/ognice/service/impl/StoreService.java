/**
 *
 */
package com.ognice.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ognice.controller.common.PageResult;
import com.ognice.controller.common.PageSearchParam;
import com.ognice.dao.StoreMapper;
import com.ognice.domain.Store;
import com.ognice.service.IStoreService;

/**
*
* 库存表 service接口实现类
*
**/
@Service("storeService")
public class StoreService implements IStoreService {
    @Resource
    private StoreMapper storeMapper;

    public Store getStoreById(Long id) {
        return storeMapper.selectStoreById(id);
    }

    public String save(Store record) {
        if (1 == storeMapper.insert(record)) {
            return "添加成功";
        }
        return "添加失败";
    }

    public PageResult getPages(PageSearchParam param) {
        PageResult pageResult = new PageResult();
        pageResult.setPagesize(param.getPagesize());
        pageResult.setPage(param.getPage());
        param.setPage((param.getPage() - 1) * param.getPagesize());
        List<Store> stores = storeMapper.page(param);
        pageResult.setData(stores);
        param.setPage(null);
        pageResult.setTotal(storeMapper.page(param).size());
        pageResult.setTotalPage((int) Math.ceil(((double) pageResult.getTotal() / pageResult.getPagesize())));
        return pageResult;
    }

    public int update(Store record) {
        return storeMapper.update(record);
    }

    public int delete(Long id) {
        return storeMapper.delete(id);
    }

    public List<Store> all() {
        // TODO Auto-generated method stub
        return storeMapper.page(new PageSearchParam());
    }

    public Integer countNum(Integer status, Long userId) {
        Store s = new Store();
        s.setR_state(status);
        s.setC_id(userId.intValue());
        PageSearchParam param = new PageSearchParam();
        param.setParams(s);
        List<Store> stores = storeMapper.page(param);

        return stores.size();

    }

    /*
     * (non-Javadoc)
     *
     * @see com.ognice.service.IStoreService#allNum()
     */
    @Override
    public Integer allNum(Long userId) {
        // TODO Auto-generated method stub
        return storeMapper.allNum(userId);
    }

}
