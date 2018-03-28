package com.ognice.service;

import java.util.Map;

import com.ognice.domain.Person;

/***
 * 用户相关接口
 * @author pc
 *
 */
public interface IPersonService {
	int deleteByPrimaryKey(Long id);

    int insert(Person record);

    int insertSelective(Person record);

    Person selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Person record);

    int updateByPrimaryKey(Person record);
    
    @SuppressWarnings("rawtypes")
	Map queryAllPersonList(String personName,String userName,Integer pageIndex,Integer pageSize);
    
    public Person login(String userName, String password);
    
    public Person getPersonByUNameAndPName(String uName,String pName);
    
    boolean checkUser(String userName);
}
