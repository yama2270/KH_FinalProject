package com.kh.klibrary.admin.studyroom.model.service;

import java.util.List;
import java.util.Map;

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
	
}
