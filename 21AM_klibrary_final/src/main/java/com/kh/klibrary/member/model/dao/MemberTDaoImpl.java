package com.kh.klibrary.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public List<LendingHistory> selectLHList(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectLHList", userId);
	}
	
	@Override
	public List<Lending> selectLendingList(SqlSessionTemplate session, String userId, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectLendingList", userId, new RowBounds((cPage-1)*numPerpage, numPerpage));
	}

	@Override
	public int insertMember(SqlSessionTemplate session, MemberT m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertMember", m);
	}

	
	
	

}
