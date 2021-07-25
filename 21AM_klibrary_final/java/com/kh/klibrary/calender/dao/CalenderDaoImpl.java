package com.kh.klibrary.calender.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.calender.vo.Calender;

@Repository
public class CalenderDaoImpl implements CalenderDao{

	@Override
	public int insertCalender(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("calender.insertCalender",param);
	}

	@Override
	public List<Calender> calenderlist(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("calender.calenderlist");
	}
	
	
}
