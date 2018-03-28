package com.ognice.dao;

import java.util.List;

import com.ognice.controller.common.PageSearchParam;
import com.ognice.domain.Store;
/**
* 
* 库存表 dao类
*
**/
public interface StoreMapper {
    int delete(Long id);

    int insert(Store record);

    Store selectStoreById(Long id);

    int update(Store record);

    List<Store> page(PageSearchParam param);
    Integer allNum(Long userId);

}