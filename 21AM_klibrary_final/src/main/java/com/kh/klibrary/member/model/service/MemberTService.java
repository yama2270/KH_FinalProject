package com.kh.klibrary.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;
import com.kh.klibrary.member.model.vo.MemberT;

public interface MemberTService {
	
	MemberT selectMember(Map m1);
	int updateMember(MemberT m);
	List<LendingHistory> selectLHList(String userId);
	List<Lending> selectLendingList(String userId, int cPage, int numPerpage);
	
	//회원가입 
	int insertMember(MemberT m);
}	
