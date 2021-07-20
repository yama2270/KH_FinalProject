package com.kh.klibrary.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;
import com.kh.klibrary.member.model.vo.MemberT;

public interface MemberTDao {
	MemberT selectMember(SqlSessionTemplate session, Map m1);
	int updateMember(SqlSessionTemplate session, MemberT m);
	List<LendingHistory> selectLHList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	List<Lending> selectLendingList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	List<LendingHistory> selectDate(SqlSessionTemplate session, Map m1, int cPage, int numPerpage);
	List<Booking> selectBookingList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	int selectLendingCount(SqlSessionTemplate session, String userId);
	int selectLHCount(SqlSessionTemplate session, String userId);
	int selectDateCount(SqlSessionTemplate session, Map m1);
	int selectBookingCount(SqlSessionTemplate session, String userId);
	int cancelBooking(SqlSessionTemplate session, Map m1);
}
