package com.kh.klibrary.member.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.member.model.dao.MemberTDao;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;
import com.kh.klibrary.member.model.vo.MemberT;
@Service
public class MemberTServiceImpl implements MemberTService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MemberTDao dao;
	
	@Override
	public MemberT selectMember(Map m1) {
		// TODO Auto-generated method stub
		return dao.selectMember(session, m1);
	}
	@Override
	public int updateMember(MemberT m) {
		// TODO Auto-generated method stub
		return dao.updateMember(session, m);
	}
	
	@Override
	public List<LendingHistory> selectLHList(String userId) {
		// TODO Auto-generated method stub
		return dao.selectLHList(session, userId);
	}
	
	@Override
	public List<Lending> selectLendingList(String userId, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectLendingList(session, userId, cPage, numPerpage);
	}
	
	@Override
	public int insertMember(MemberT m) {
		// TODO Auto-generated method stub
		
		return dao.insertMember(session, m);
	}

}
