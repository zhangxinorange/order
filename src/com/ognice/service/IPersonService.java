package com.ognice.service;

import java.util.List;

import com.ognice.domain.Person;
import com.ognice.domain.User;

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
    
    List<Person> queryAllPersonList(String personName,String userName,Integer pageIndex);
    
    public Person login(String userName, String password);
    
    public Person getPersonByUNameAndPName(String uName,String pName);
}
