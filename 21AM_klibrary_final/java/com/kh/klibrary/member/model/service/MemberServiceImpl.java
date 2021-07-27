package com.kh.klibrary.member.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.book.model.vo.WishBook;
import com.kh.klibrary.member.model.dao.MemberDao;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;
import com.kh.klibrary.member.model.vo.Likes;
import com.kh.klibrary.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MemberDao dao;
	
	//dg
	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(session, m);
	}

	@Override
	public Member selectMember1(Map param) {
		// TODO Auto-generated method stub
		return dao.selectMember1(session, param);
	}
	
	@Override
	public Member memberFindId(Map param) {
		// TODO Auto-generated method stub
		return dao.memberFindId(session, param);
	}
	
	@Override
	public int memberFindPw(Member m) {
		// TODO Auto-generated method stub
		return dao.memberFindPw(session, m);
	}
	
	//cg
	
	@Override
	public Member selectMember(Map m1) {
		// TODO Auto-generated method stub
		return dao.selectMember(session, m1);
	}
	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return dao.updateMember(session, m);
	}
	
	@Override
	public List<LendingHistory> selectLHList(String userId, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectLHList(session, userId, cPage, numPerpage);
	}
	
	@Override
	public List<Lending> selectLendingList(String userId, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectLendingList(session, userId, cPage, numPerpage);
	}
	
	@Override
	public List<LendingHistory> selectDate(Map m1, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectDate(session, m1, cPage, numPerpage);
	}

	@Override
	public List<Booking> selectBookingList(String userId, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectBookingList(session, userId, cPage, numPerpage);
	}
	
	@Override
	public List<Likes> selectBookMarkList(String userId, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectBookMarkList(session, userId, cPage, numPerpage);
	}
	
	@Override
	public List<WishBook> selectHopeRecordList(String userId, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectHopeRecordList(session,userId, cPage, numPerpage);
	}
	
	@Override
	public Member selectMemberDropRequestList(Map m1) {
		// TODO Auto-generated method stub
		return dao.selectMemberDropRequestList(session, m1);
	}
	
	@Override
	public int selectLendingCount(String userId) {
		// TODO Auto-generated method stub
		return dao.selectLendingCount(session, userId);
	}
	
	@Override
	public int selectLHCount(String userId) {
		// TODO Auto-generated method stub
		return dao.selectLHCount(session, userId);
	}
	
	@Override
	public int selectDateCount(Map m1) {
		// TODO Auto-generated method stub
		return dao.selectDateCount(session, m1);
	}
	
	@Override
	public int selectBookingCount(String userId) {
		// TODO Auto-generated method stub
		return dao.selectBookingCount(session, userId);
	}
	
	@Override
	public int cancelBooking(Map m1) {
		// TODO Auto-generated method stub
		return dao.cancelBooking(session, m1);
	}
	
	@Override
	public int selectBookMarkCount(String userId) {
		// TODO Auto-generated method stub
		return dao.selectBookMarkCount(session, userId);
	}
	
	@Override
	public int cancelMark(Map m1) {
		// TODO Auto-generated method stub
		return dao.cancelMark(session, m1);
	}
	
	@Override
	public int selectHopeRecordCount(String userId) {
		// TODO Auto-generated method stub
		return dao.selectHopeRecordCount(session, userId);
	}
	
	@Override
	public int insertMemberDropRequest(Map m1) {
		// TODO Auto-generated method stub
		return dao.insertMemberDropRequest(session, m1);
	}
	
	@Override
	public int countUser(String today) {
		return dao.countUser(session,today);
	}
}
