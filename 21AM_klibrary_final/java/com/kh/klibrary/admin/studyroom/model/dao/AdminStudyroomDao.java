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
	
	// 열람실 수정 - 예약테이블 좌석 이용시간 
	List<Map> selBookingTime(SqlSessionTemplate session,Map param);
	
	// 열람실 수정 - 열람실 좌석 이용시간 
	Map selUsingTime(SqlSessionTemplate session,AdminStudyroomBooking booking);
	
	// 열람실 수정 - 열람실 좌석 이용시간 
	Map selUsingTime(SqlSessionTemplate session,Map param);
	
	// 열람실 에약 정보 수정
	int updateStuBooking(SqlSessionTemplate session,AdminStudyroomBooking booking);
	
	// --- A열람실 ----
	
	// 열람실A 현황조회
	List<Map> selectInfoA(SqlSessionTemplate session);
	
	// 열람실A 좌석조회
	List<AdminStudyroom> selectListA(SqlSessionTemplate session);
	
	// 열람실A 이용자 조회
	List<AdminStudyroom> selUsingListA(SqlSessionTemplate session,int cPage,int numPerPage);
	
	// 열람실A 이용자 전체회원수
	int selUsingCountA(SqlSessionTemplate session);
	
	// --- B열람실 ----
	
	// 열람실B 현황조회
	List<Map> selectInfoB(SqlSessionTemplate session);
	
	// 열람실B 좌석조회
	List<AdminStudyroom> selectListB(SqlSessionTemplate session);
	
	// 열람실B 이용자 조회
	List<AdminStudyroom> selUsingListB(SqlSessionTemplate session,int cPage,int numPerPage);
	
	// 열람실B 이용자 전체회원수
	int selUsingCountB(SqlSessionTemplate session);
	
	// --- C열람실 ----
	
	// 열람실C 현황조회
	List<Map> selectInfoC(SqlSessionTemplate session);
	
	// 열람실C 좌석조회
	List<AdminStudyroom> selectListC(SqlSessionTemplate session);
	
	// 열람실C 이용자 조회
	List<AdminStudyroom> selUsingListC(SqlSessionTemplate session,int cPage,int numPerPage);
	
	// 열람실C 이용자 전체회원수
	int selUsingCountC(SqlSessionTemplate session);
	
	// --- D열람실 ----
	
	// 열람실D 현황조회
	List<Map> selectInfoD(SqlSessionTemplate session);
	
	// 열람실D 좌석조회
	List<AdminStudyroom> selectListD(SqlSessionTemplate session);
	
	// 열람실D 이용자 조회
	List<AdminStudyroom> selUsingListD(SqlSessionTemplate session,int cPage,int numPerPage);
	
	// 열람실D 이용자 전체회원수
	int selUsingCountD(SqlSessionTemplate session);
	
}
