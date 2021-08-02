package com.kh.klibrary.admin.studyroom.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
}
