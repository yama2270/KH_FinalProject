package com.kh.klibrary.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;
import com.kh.klibrary.member.model.vo.MemberT;

public interface MemberTService {
	
	MemberT selectMember(Map m1);
	int updateMember(MemberT m);
	List<LendingHistory> selectLHList(String userId, int cPage, int numPerpage);
	List<Lending> selectLendingList(String userId, int cPage, int numPerpage);
	List<LendingHistory> selectDate(Map m1, int cPage, int numPerpage);
	List<Booking> selectBookingList(String userId, int cPage, int numPerpage);
	int selectLendingCount(String userId);
	int selectLHCount(String userId);
	int selectDateCount(Map m1);
	int selectBookingCount(String userId);
	int cancelBooking(Map m1);
}	
