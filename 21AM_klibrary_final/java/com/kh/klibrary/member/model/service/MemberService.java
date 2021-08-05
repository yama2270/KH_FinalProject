package com.kh.klibrary.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomBooking;
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
	//로그인
	Member selectMember(Map m1);
	//회원정보수정
	int updateMember(Member m);
	//대출내역조회
	List<LendingHistory> selectLHList(String userId, int cPage, int numPerpage);
	//대출조회
	List<Lending> selectLendingList(String userId, int cPage, int numPerpage);
	//대출 날짜 검색
	List<LendingHistory> selectDate(Map m1, int cPage, int numPerpage);
	//예약 리스트
	List<Booking> selectBookingList(String userId, int cPage, int numPerpage);
	//관심 리스트
	List<Likes> selectBookMarkList(String userId, int cPage, int numPerpage);
	//희망도서 신청 내역
	List<WishBook> selectHopeRecordList(String userId, int cPage, int numPerpage);
	//회원 탈퇴 요청
	Member selectMemberDropRequestList(Map m1);
	//대출리스트 카운트
	int selectLendingCount(String userId);
	//대출내역 리스트 카운트
	int selectLHCount(String userId);
	//대출 날짜별 검색 리스트 카운트
	int selectDateCount(Map m1);
	//예약 리스트 카운트
	int selectBookingCount(String userId);
	//예약 취소
	int cancelBooking(Map m1);
	//관심 도서 리스트 카운트
	int selectBookMarkCount(String userId);
	//관심 도서 취소
	int cancelMark(Map m1);
	//희망 도서 리스트 카운트
	int selectHopeRecordCount(String userId);
	// 회원 탈퇴 요청
	int insertMemberDropRequest(Map m1);
	// 홈페이지 방문자 count
	int countUser(String today);
	//열람실 회원 예약 현황
	AdminStudyroomBooking selectSRBooing(String userId);
	//열람실 예약 취소
	int cancelSRBooking(String bookingNo);
}
