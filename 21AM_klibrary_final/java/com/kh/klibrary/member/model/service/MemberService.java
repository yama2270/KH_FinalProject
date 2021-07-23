package com.kh.klibrary.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.book.model.vo.WishBook;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;
import com.kh.klibrary.member.model.vo.Likes;
import com.kh.klibrary.member.model.vo.Member;

public interface MemberService {
	//dg
	int insertMember(Member m);
	Member selectMember1(Map param);
	Member memberFindId(Map param);
	int memberFindPw(Member m);
	//cg
	Member selectMember(Map m1);
	int updateMember(Member m);
	List<LendingHistory> selectLHList(String userId, int cPage, int numPerpage);
	List<Lending> selectLendingList(String userId, int cPage, int numPerpage);
	List<LendingHistory> selectDate(Map m1, int cPage, int numPerpage);
	List<Booking> selectBookingList(String userId, int cPage, int numPerpage);
	List<Likes> selectBookMarkList(String userId, int cPage, int numPerpage);
	List<WishBook> selectHopeRecordList(String userId, int cPage, int numPerpage);
	Member selectMemberDropRequestList(Map m1);
	int selectLendingCount(String userId);
	int selectLHCount(String userId);
	int selectDateCount(Map m1);
	int selectBookingCount(String userId);
	int cancelBooking(Map m1);
	int selectBookMarkCount(String userId);
	int cancelMark(Map m1);
	int selectHopeRecordCount(String userId);
	int insertMemberDropRequest(Map m1);
}
