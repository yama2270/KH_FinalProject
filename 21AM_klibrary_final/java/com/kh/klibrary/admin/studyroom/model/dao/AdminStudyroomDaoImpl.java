package com.kh.klibrary.admin.studyroom.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	
	// 열람실 에약 정보 수정
	public int updateStuBooking(SqlSessionTemplate session,AdminStudyroomBooking booking) {
		return session.update("adminStudyroom.updateStuBooking",booking);
	}
	
	// ---- 열람실 A
	
	// 열람실A 현황조회
	public List<Map> selectInfoA(SqlSessionTemplate session) {
		return session.selectList("adminStudyroom.selectInfoA");
	}
	
	// 열람실A 좌석조회
	public List<AdminStudyroom> selectListA(SqlSessionTemplate session){
		return session.selectList("adminStudyroom.selectListA");
	}
	
	// 열람실A 이용자 조회
	public List<AdminStudyroom> selUsingListA(SqlSessionTemplate session,int cPage,int numPerPage){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adminStudyroom.selUsingListA",null,row);
	} 
	
	// 열람실A 이용자 전체회원수
	public int selUsingCountA(SqlSessionTemplate session){
		return session.selectOne("adminStudyroom.selUsingCountA");
	}
	
	// ---- 열람실 B ----
	
	// 열람실B 현황조회
	public List<Map> selectInfoB(SqlSessionTemplate session) {
		return session.selectList("adminStudyroom.selectInfoB");
	}
	
	// 열람실B 좌석조회
	public List<AdminStudyroom> selectListB(SqlSessionTemplate session){
		return session.selectList("adminStudyroom.selectListB");
	}
	
	// 열람실B 이용자 조회
	public List<AdminStudyroom> selUsingListB(SqlSessionTemplate session,int cPage,int numPerPage){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adminStudyroom.selUsingListB",null,row);
	} 
	
	// 열람실B 이용자 전체회원수
	public int selUsingCountB(SqlSessionTemplate session){
		return session.selectOne("adminStudyroom.selUsingCountB");
	}
	
	// ---- 열람실 C ----
	
	// 열람실C 현황조회
	public List<Map> selectInfoC(SqlSessionTemplate session) {
		return session.selectList("adminStudyroom.selectInfoC");
	}
	
	// 열람실C 좌석조회
	public List<AdminStudyroom> selectListC(SqlSessionTemplate session){
		return session.selectList("adminStudyroom.selectListC");
	}
	
	// 열람실C 이용자 조회
	public List<AdminStudyroom> selUsingListC(SqlSessionTemplate session,int cPage,int numPerPage){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adminStudyroom.selUsingListC",null,row);
	} 
	
	// 열람실C 이용자 전체회원수
	public int selUsingCountC(SqlSessionTemplate session){
		return session.selectOne("adminStudyroom.selUsingCountC");
	}
	
	// ---- 열람실 D ----
	
	// 열람실D 현황조회
	public List<Map> selectInfoD(SqlSessionTemplate session) {
		return session.selectList("adminStudyroom.selectInfoD");
	}
	
	// 열람실D 좌석조회
	public List<AdminStudyroom> selectListD(SqlSessionTemplate session){
		return session.selectList("adminStudyroom.selectListD");
	}
	
	// 열람실D 이용자 조회
	public List<AdminStudyroom> selUsingListD(SqlSessionTemplate session,int cPage,int numPerPage){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adminStudyroom.selUsingListD",null,row);
	} 
	
	// 열람실D 이용자 전체회원수
	public int selUsingCountD(SqlSessionTemplate session){
		return session.selectOne("adminStudyroom.selUsingCountD");
	}
	
}
