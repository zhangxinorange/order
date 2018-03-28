/**
 *
 */
package com.ognice.service;

import java.util.List;

import com.ognice.controller.common.PageResult;
import com.ognice.controller.common.PageSearchParam;
import com.ognice.domain.Store;

/**
*
* 库存表 service接口类
*
**/
public interface IStoreService {
    // 根据id获取
    public Store getStoreById(Long id);

    // 保存入库
    public String save(Store record);

    // 获取全部数据
    public List<Store> all();

    // 分页获取
    public PageResult getPages(PageSearchParam param);

    // 更新
    public int update(Store record);

    // 删除
    public int delete(Long id);

    // 库存总量
    public Integer allNum(Long userId);

    // status库存总量
    public Integer countNum(Integer status, Long userId);

}
