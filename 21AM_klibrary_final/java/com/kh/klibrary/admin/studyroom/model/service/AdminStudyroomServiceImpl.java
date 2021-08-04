package com.kh.klibrary.admin.studyroom.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.admin.studyroom.model.dao.AdminStudyroomDao;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomBooking;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomManage;

@Service
public class AdminStudyroomServiceImpl implements AdminStudyroomService {
	
	@Autowired 
	private AdminStudyroomDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	// 열람실 총 조회
	@Override 
	public Map toManage() {
		return dao.toManage(session);
	}
	
	// 열람실 리스트 조회
	@Override
	public List<AdminStudyroomManage> selectManageList(){
		return dao.selectManageList(session);
	}
	
	// 열람실 예약리스트 
	@Override
	public List<AdminStudyroomBooking> selectBookingList(){
		return dao.selectBookingList(session);
	}
	
	// 예약삭제
	@Override
	public int delBooking(int bookingNo) {
		return dao.delBooking(session,bookingNo);
	}
	
}
