package com.kh.klibrary.admin.studyroom.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroom;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomBooking;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomManage;

@Repository
public class AdminStudyroomDaoImpl implements AdminStudyroomDao{
	
	// 총 열람실 조회
	@Override
	public Map toManage(SqlSessionTemplate session) {
		return session.selectOne("adminStudyroom.toManage");
	}
	
	// 열람실 조회
	@Override
	public List<AdminStudyroomManage> selectManageList(SqlSessionTemplate session){
		return session.selectList("adminStudyroom.selectManageList");
	}
	
	// 열람실 예약 리스트
	@Override
	public List<AdminStudyroomBooking> selectBookingList(SqlSessionTemplate session){
		return session.selectList("adminStudyroom.selectBookingList");
	}
	
	// 예약 삭제
	@Override
	public int delBooking(SqlSessionTemplate session,int bookingNo) {
		return session.delete("adminStudyroom.delBooking",bookingNo);
	}
	
	// 열람실 예약 수정 - 예약테이블 좌석 이용시간 
	public List<Map> selBookingTime(SqlSessionTemplate session,AdminStudyroomBooking booking){
		return session.selectList("adminStudyroom.selBookingTime",booking);
	}
	
	// 열람실 예약 수정 - 예약테이블 좌석 이용시간 
	public List<Map> selBookingTime(SqlSessionTemplate session,Map param){
		return session.selectList("adminStudyroom.selBookingTimeMap",param);
	}
	
	// 열람실 에약 수정 - 열람실 좌석 이용시간
	public Map selUsingTime(SqlSessionTemplate session,AdminStudyroomBooking booking) {
		return session.selectOne("adminStudyroom.selUsingTime",booking);
	}
	
	// 열람실 에약 수정 - 열람실 좌석 이용시간
	public Map selUsingTime(SqlSessionTemplate session,Map param) {
		return session.selectOne("adminStudyroom.selUsingTimeMap",param);
	}
	
	// 열람실A 현황조회
	public List<Map> selectInfoA(SqlSessionTemplate session) {
		return session.selectList("adminStudyroom.selectInfoA");
	}
	
	// 열람실A 좌석조회
	public List<AdminStudyroom> selectListA(SqlSessionTemplate session){
		return session.selectList("adminStudyroom.selectListA");
	}
	
}
