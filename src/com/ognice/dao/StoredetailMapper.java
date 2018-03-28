package com.ognice.dao;

import java.util.List;

import com.ognice.controller.common.PageSearchParam;
import com.ognice.domain.Storedetail;
/**
* 
* 明细表 dao类
*
**/
public interface StoredetailMapper {
    int delete(Long id);

    int insert(Storedetail record);

    Storedetail selectStoredetailById(Long id);

    int update(Storedetail record);

    List<Storedetail> page(PageSearchParam param);
}