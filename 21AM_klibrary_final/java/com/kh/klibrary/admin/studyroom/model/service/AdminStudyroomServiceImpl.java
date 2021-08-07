package com.kh.klibrary.admin.studyroom.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.admin.studyroom.model.dao.AdminStudyroomDao;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroom;
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
	
	// 예약수정 - 예약테이블 좌석시간 
	public List<Map> selBookingTime(AdminStudyroomBooking booking){
		return dao.selBookingTime(session,booking);
	}
	
	// 예약수정 - 예약테이블 좌석시간 
	public List<Map> selBookingTime(Map param){
		return dao.selBookingTime(session,param);
	}
	
	// 예약수정 - 열람실 현재 이용좌석
	public Map selUsingTime(AdminStudyroomBooking booking) {
		return dao.selUsingTime(session,booking);
	}
	
	// 예약수정 - 열람실 현재 이용좌석
	public Map selUsingTime(Map param) {
		return dao.selUsingTime(session,param);
	}
	
	// A열람실 현황조회
	@Override
	public List<Map> selectInfoA() {
		return dao.selectInfoA(session);
	}
	
	// A열람실 좌석조회
	@Override
	public List<AdminStudyroom> selectListA(){
		return dao.selectListA(session);
	}
	
	
}
