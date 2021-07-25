package com.kh.klibrary.calender.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.calender.vo.Calender;

public interface CalenderDao {
	
	int insertCalender(SqlSessionTemplate session,Map param);
	List<Calender> calenderlist(SqlSessionTemplate session);

}
