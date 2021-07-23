package com.kh.klibrary.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.book.model.vo.WishBook;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;
import com.kh.klibrary.member.model.vo.Likes;
import com.kh.klibrary.member.model.vo.Member;

public interface MemberDao {
	//dg
	int insertMember(SqlSessionTemplate session, Member m);
	Member selectMember1(SqlSessionTemplate session, Map param);
	Member memberFindId(SqlSessionTemplate session, Map param);
	int memberFindPw(SqlSessionTemplate session, Member m);
	
	//cg
	Member selectMember(SqlSessionTemplate session, Map m1);
	int updateMember(SqlSessionTemplate session, Member m);
	List<LendingHistory> selectLHList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	List<Lending> selectLendingList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	List<LendingHistory> selectDate(SqlSessionTemplate session, Map m1, int cPage, int numPerpage);
	List<Booking> selectBookingList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	List<Likes> selectBookMarkList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	List<WishBook> selectHopeRecordList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	Member selectMemberDropRequestList(SqlSessionTemplate session, Map m1);
	int selectLendingCount(SqlSessionTemplate session, String userId);
	int selectLHCount(SqlSessionTemplate session, String userId);
	int selectDateCount(SqlSessionTemplate session, Map m1);
	int selectBookingCount(SqlSessionTemplate session, String userId);
	int cancelBooking(SqlSessionTemplate session, Map m1);
	int selectBookMarkCount(SqlSessionTemplate session, String userId);
	int cancelMark(SqlSessionTemplate session, Map m1);
	int selectHopeRecordCount(SqlSessionTemplate session, String userId);
	int insertMemberDropRequest(SqlSessionTemplate session, Map m1);
}
