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
	
	// 열람실 예약 정보 수정 
	public int updateStuBooking(AdminStudyroomBooking booking) {
		return dao.updateStuBooking(session,booking);
	}
	
	// ---- A열람실 -----
	
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
	
	// A열람실 이용자 조회
	@Override
	public List<AdminStudyroom> selUsingListA(int cPage,int numPerPage){
		return dao.selUsingListA(session,cPage,numPerPage);
	}
	
	// A열람실 이용자 전체 회원수
	@Override
	public int selUsingCountA(){
		return dao.selUsingCountA(session);
	}
	
	// ---- B열람실 -----
	
	// B열람실 현황조회
	@Override
	public List<Map> selectInfoB() {
		return dao.selectInfoB(session);
	}
	
	// B열람실 좌석조회
	@Override
	public List<AdminStudyroom> selectListB(){
		return dao.selectListB(session);
	}
	
	// B열람실 이용자 조회
	@Override
	public List<AdminStudyroom> selUsingListB(int cPage,int numPerPage){
		return dao.selUsingListB(session,cPage,numPerPage);
	}
	
	// B열람실 이용자 전체 회원수
	@Override
	public int selUsingCountB(){
		return dao.selUsingCountB(session);
	}
	
	// ---- C열람실 -----
	
	// C열람실 현황조회
	@Override
	public List<Map> selectInfoC() {
		return dao.selectInfoC(session);
	}
	
	// C열람실 좌석조회
	@Override
	public List<AdminStudyroom> selectListC(){
		return dao.selectListC(session);
	}
	
	// C열람실 이용자 조회
	@Override
	public List<AdminStudyroom> selUsingListC(int cPage,int numPerPage){
		return dao.selUsingListC(session,cPage,numPerPage);
	}
	
	// C열람실 이용자 전체 회원수
	@Override
	public int selUsingCountC(){
		return dao.selUsingCountC(session);
	}
	
	// ---- D열람실 -----
	
	// D열람실 현황조회
	@Override
	public List<Map> selectInfoD() {
		return dao.selectInfoD(session);
	}
	
	// D열람실 좌석조회
	@Override
	public List<AdminStudyroom> selectListD(){
		return dao.selectListD(session);
	}
	
	// D열람실 이용자 조회
	@Override
	public List<AdminStudyroom> selUsingListD(int cPage,int numPerPage){
		return dao.selUsingListD(session,cPage,numPerPage);
	}
	
	// D열람실 이용자 전체 회원수
	@Override
	public int selUsingCountD(){
		return dao.selUsingCountD(session);
	}
	
}
