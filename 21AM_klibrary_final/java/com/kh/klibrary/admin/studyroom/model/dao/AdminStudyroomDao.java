package com.kh.klibrary.admin.studyroom.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomBooking;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomManage;

public interface AdminStudyroomDao {
	
	// 총 열람실 현황
	Map toManage(SqlSessionTemplate session);
	
	// 열람실 리스트 조회
	List<AdminStudyroomManage> selectManageList(SqlSessionTemplate session);
	
	// 예약현황 조회
	List<AdminStudyroomBooking> selectBookingList(SqlSessionTemplate session);
	
}
