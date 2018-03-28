package com.ognice.dao;

import java.util.List;
import java.util.Map;

import com.ognice.domain.Person;

public interface PersonMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Person record);

    int insertSelective(Person record);

    Person selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Person record);

    int updateByPrimaryKey(Person record);
    
    Person login(String userName, String passoword);
    
    
    public Person getPersonByUNameAndPName(String uName,String pName);
    
    
    public List<Person> getAllPerson(Map map);
    
    public List<Person> queryAllPerson();
    
    public Integer countAllPerson(Person person);
    
    Integer checkUserName(String userName);
}