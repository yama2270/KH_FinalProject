package com.kh.klibrary.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;
import com.kh.klibrary.member.model.vo.MemberT;

public interface MemberTDao {
	MemberT selectMember(SqlSessionTemplate session, Map m1);
	int updateMember(SqlSessionTemplate session, MemberT m);
	List<LendingHistory> selectLHList(SqlSessionTemplate session, String userId);
	List<Lending> selectLendingList(SqlSessionTemplate session, String userId, int cPage, int numPerpage);
	
	//회원가입
	int insertMember(SqlSessionTemplate session, MemberT m);
}
