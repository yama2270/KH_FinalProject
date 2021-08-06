package com.kh.klibrary.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomBooking;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomHistory;
import com.kh.klibrary.book.model.vo.WishBook;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;
import com.kh.klibrary.member.model.vo.Likes;
import com.kh.klibrary.member.model.vo.Member;
import com.kh.klibrary.member.model.vo.MemberDrop;

public interface MemberDao {
	//dg
	int insertMember(SqlSessionTemplate session, Member m);
	Member selectMember1(SqlSessionTemplate session, Map param);
	Member memberFindId(SqlSessionTemplate session, Map param);
	int memberFindPw(SqlSessionTemplate session, Member m);
	
	//cg
	Member selectMember(SqlSessionTemplate session, Map m1);
	//회원정보수정
	int updateMember(SqlSessionTemplate session, Member m);
	//대출내역조회
	List<LendingHistory> selectLHList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	//대출조회
	List<Lending> selectLendingList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	//대출 날짜 검색
	List<LendingHistory> selectDate(SqlSessionTemplate session, Map m1, int cPage, int numPerpage);
	//예약 리스트
	List<Booking> selectBookingList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	//관심 리스트
	List<Likes> selectBookMarkList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	//희망도서 신청 내역
	List<WishBook> selectHopeRecordList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	//회원 탈퇴 요청
	MemberDrop selectMemberDropRequestList(SqlSessionTemplate session, Map m1);
	//대출리스트 카운트
	int selectLendingCount(SqlSessionTemplate session, String userId);
	//대출내역 리스트 카운트
	int selectLHCount(SqlSessionTemplate session, String userId);
	//대출 날짜별 검색 리스트 카운트
	int selectDateCount(SqlSessionTemplate session, Map m1);
	//예약 리스트 카운트
	int selectBookingCount(SqlSessionTemplate session, String userId);
	//예약 취소
	int cancelBooking(SqlSessionTemplate session, Map m1);
	//관심 도서 리스트 카운트
	int selectBookMarkCount(SqlSessionTemplate session, String userId);
	//관심 도서 취소
	int cancelMark(SqlSessionTemplate session, Map m1);
	//희망 도서 리스트 카운트
	int selectHopeRecordCount(SqlSessionTemplate session, String userId);
	// 회원 탈퇴 요청
	int insertMemberDropRequest(SqlSessionTemplate session, Map m1);
	// 홈페이지 방문자 count
	int countUser(SqlSessionTemplate session,String today);
	//열람실 회원 예약 현황
	AdminStudyroomBooking selectSRBooing(SqlSessionTemplate session, String userId);
	//열람실 회원 예약 취소
	int cancelSRBooking(SqlSessionTemplate session, String bookingNo);
	//열람실 내역 리스트
	List<AdminStudyroomHistory> selectSRHList(SqlSessionTemplate session, String userId, int cPage, int numPerPage);
	//열람실 내역 리스트 카운트
	int selectSRHCount(SqlSessionTemplate session, String userId);
	
}
