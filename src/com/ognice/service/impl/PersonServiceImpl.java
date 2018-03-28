package com.ognice.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ognice.dao.PersonMapper;
import com.ognice.domain.Person;
import com.ognice.service.IPersonService;


@Service
public class PersonServiceImpl implements IPersonService {
	public static final Logger log = Logger.getLogger(PersonServiceImpl.class);
	
	
	@Autowired
	private PersonMapper personMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return personMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Person record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Person record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Person selectByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Person record) {
		// TODO Auto-generated method stub
		return personMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Person record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Person> queryAllPersonList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Person login(String userName, String password) {
		Person person=personMapper.login(userName, password);
		return person;
	}

	@Override
	public Person getPersonByUNameAndPName(String uName, String pName) {
		Person person=null;
		try {
			person = personMapper.getPersonByUNameAndPName(uName, pName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return person;
	}

	@Override
	public List<Person> queryAllPersonList(String personName, String userName, Integer pageIndex) {
		// TODO Auto-generated method stub
		return null;
	}

}
