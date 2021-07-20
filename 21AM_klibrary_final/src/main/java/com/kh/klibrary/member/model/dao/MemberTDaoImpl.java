package com.kh.klibrary.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;
import com.kh.klibrary.member.model.vo.MemberT;
@Repository
public class MemberTDaoImpl implements MemberTDao {

	@Override
	public MemberT selectMember(SqlSessionTemplate session, Map m1) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMember", m1);
	}
	
	@Override
	public int updateMember(SqlSessionTemplate session, MemberT m) {
		// TODO Auto-generated method stub
		return session.update("member.updateMember", m);
	}
	
	@Override
	public List<LendingHistory> selectLHList(SqlSessionTemplate session, String userId, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectLHList", userId, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	
	@Override
	public List<Lending> selectLendingList(SqlSessionTemplate session, String userId, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectLendingList", userId, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	
	@Override
	public List<LendingHistory> selectDate(SqlSessionTemplate session, Map m1, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectDate", m1, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public List<Booking> selectBookingList(SqlSessionTemplate session, String userId, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectBookingList", userId, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}
	
	@Override
	public int selectLendingCount(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectLendingCount", userId);
	}
	
	@Override
	public int selectLHCount(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectLHCount", userId);
	}
	
	@Override
	public int selectBookingCount(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectBookingCount", userId);
	}
	
	@Override
	public int selectDateCount(SqlSessionTemplate session, Map m1) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectDateCount", m1);
	}
	
	@Override
	public int cancelBooking(SqlSessionTemplate session, Map m1) {
		// TODO Auto-generated method stub
		return session.delete("member.cancelBooking", m1);
	}
}

