package com.kh.klibrary.admin.studyroom.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroom;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomBooking;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomManage;

public interface AdminStudyroomService {
	
	// 열람실 총 조회 
	Map toManage();
	
	// 열람실 리스트 
	List<AdminStudyroomManage> selectManageList();
	
	//열람실 예약리스트
	List<AdminStudyroomBooking> selectBookingList();
	
	// 예약 삭제
	int delBooking(int bookingNo);
	
	// 열람실 예약 수정 - 예약테이블 예약시간 
	List<Map> selBookingTime(AdminStudyroomBooking booking);
	
	// 열람실 예약 수정 - 예약테이블 예약시간 
	List<Map> selBookingTime(Map param);
	
	// 열람실 예약 수정 - 열람식 현재 사용여부
	Map selUsingTime(AdminStudyroomBooking booking);
	
	// 열람실 예약 수정 - 열람식 현재 사용여부
	Map selUsingTime(Map param);
	
	// 열람실 예약 정보 수정 
	int updateStuBooking(AdminStudyroomBooking booking);
	
	// ---- A 열람실 ----
	
	// A열람실 현황조회 
	List<Map> selectInfoA();
	
	// A열람실 좌석조회
	List<AdminStudyroom> selectListA();
	
	// A열람실 이용자 조회
	List<AdminStudyroom> selUsingListA(int cPage,int numPerPage);
	
	// A열람실 이용자 전체회원수
	int selUsingCountA();
	
	// ---- B 열람실 ----

	// B열람실 현황조회 
	List<Map> selectInfoB();
	
	// B열람실 좌석조회
	List<AdminStudyroom> selectListB();
	
	// B열람실 이용자 조회
	List<AdminStudyroom> selUsingListB(int cPage,int numPerPage);
	
	// B열람실 이용자 전체회원수
	int selUsingCountB();
	
	// ---- C 열람실 ----

	// C열람실 현황조회 
	List<Map> selectInfoC();
	
	// C열람실 좌석조회
	List<AdminStudyroom> selectListC();
	
	// C열람실 이용자 조회
	List<AdminStudyroom> selUsingListC(int cPage,int numPerPage);
	
	// C열람실 이용자 전체회원수
	int selUsingCountC();
	
	// ---- D 열람실 ----

	// D열람실 현황조회 
	List<Map> selectInfoD();
	
	// D열람실 좌석조회
	List<AdminStudyroom> selectListD();
	
	// D열람실 이용자 조회
	List<AdminStudyroom> selUsingListD(int cPage,int numPerPage);
	
	// D열람실 이용자 전체회원수
	int selUsingCountD();
}
