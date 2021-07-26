package com.kh.klibrary.calender.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.calender.vo.Calender;

public interface CalenderService {
	
	int insertCalender(Map param);
	List<Calender> calenderlist();

}
