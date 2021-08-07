package com.kh.klibrary.admin.studyroom.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroom;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomBooking;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomManage;

public interface AdminStudyroomDao {
	
	// 총 열람실 현황
	Map toManage(SqlSessionTemplate session);
	
	// 열람실 리스트 조회
	List<AdminStudyroomManage> selectManageList(SqlSessionTemplate session);
	
	// 예약현황 조회
	List<AdminStudyroomBooking> selectBookingList(SqlSessionTemplate session);
	
	// 예약삭제
	int delBooking(SqlSessionTemplate session,int bookingNo);
	
	// 열람실 수정 - 예약테이블 좌석 이용시간 
	List<Map> selBookingTime(SqlSessionTemplate session,AdminStudyroomBooking booking);
	
	// 열람실 수정 - 열람실 좌석 이용시간 
	Map selUsingTime(SqlSessionTemplate session,AdminStudyroomBooking booking);
	
	// 열람실A 현황조회
	List<Map> selectInfoA(SqlSessionTemplate session);
	
	// 열람실A 좌석조회
	List<AdminStudyroom> selectListA(SqlSessionTemplate session);
	
}
