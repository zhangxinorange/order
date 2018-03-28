/**
 *
 */
package com.ognice.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ognice.controller.common.PageResult;
import com.ognice.controller.common.PageSearchParam;
import com.ognice.domain.Storedetail;

/**
* 
* 明细表 service接口类
*
**/
public interface IStoredetailService {
	//根据id获取
    public Storedetail getStoredetailById(Long id);
	//保存入库
    public String save(Storedetail record);
    //获取全部数据
    public List<Storedetail> all();
	//分页获取
    public PageResult getPages(PageSearchParam param);
	//更新
    public int update(Storedetail record);
    //删除
    public int delete(Long id);

}
