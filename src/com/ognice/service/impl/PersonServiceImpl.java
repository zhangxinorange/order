package com.ognice.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ognice.dao.PersonMapper;
import com.ognice.domain.Person;
import com.ognice.service.IPersonService;

@SuppressWarnings({ "rawtypes", "unchecked" })
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
		return personMapper.insert(record);
	}

	@Override
	public int insertSelective(Person record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Person selectByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return personMapper.selectByPrimaryKey(id);
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
		return personMapper.queryAllPerson();
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
	public Map queryAllPersonList(String personName, String userName, Integer pageIndex,Integer pageSize) {
		Person person=new Person(personName, userName);
		Integer total=personMapper.countAllPerson(person);
		if (pageSize==null) {
			pageSize=5;
		}
		Integer pageCount=(int)Math.ceil(1.0*total/pageSize);
		if (pageIndex==null) {
			pageIndex=1;
		}
		if (pageIndex>pageCount&&pageCount!=0) {
			pageIndex=pageCount;
		}
		Integer start=pageSize*(pageIndex-1);
		Integer end=pageSize;
		Map map=new HashMap<>();
		map.put("data", person);
		map.put("start", start);
		map.put("end", end);
		List<Person> pList=personMapper.getAllPerson(map);
		Map result=new HashMap<>();
		result.put("data", pList);
		result.put("total", total);
		result.put("pageIndex", pageIndex);
		result.put("pageCount", pageCount);
		return result;
	}

}
