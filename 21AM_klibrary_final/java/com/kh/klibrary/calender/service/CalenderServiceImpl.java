package com.kh.klibrary.calender.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.calender.dao.CalenderDao;
import com.kh.klibrary.calender.vo.Calender;
@Service
public class CalenderServiceImpl implements CalenderService{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private CalenderDao dao;

	@Override
	public int insertCalender(Map param) {
		// TODO Auto-generated method stub
		return dao.insertCalender(session,param);
	}

	@Override
	public List<Calender> calenderlist() {
		// TODO Auto-generated method stub
		return dao.calenderlist(session);
	}
	
	
	
	
	
	

}
