package com.ognice.dao;

import com.ognice.domain.Person;
import com.ognice.domain.User;

public interface PersonMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Person record);

    int insertSelective(Person record);

    Person selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Person record);

    int updateByPrimaryKey(Person record);
    
    Person login(String userName, String passoword);
    
    
    public Person getPersonByUNameAndPName(String uName,String pName);
}