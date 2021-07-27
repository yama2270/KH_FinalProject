package com.kh.klibrary.admin.member.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.admin.member.dao.AdminMemberDao;
import com.kh.klibrary.admin.member.vo.AdminMember;
@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private AdminMemberDao dao;
	
	@Override
	public List<AdminMember> selectMemberList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectMemberList(session,cPage,numPerpage);
	}

	@Override
	public int selectMemberCount() {
		// TODO Auto-generated method stub
		return dao.selectMemberCount(session);
	}

	@Override
	public List<AdminMember> searchMember(Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.searchMember(session,param,cPage,numPerpage);
	}

	@Override
	public int totalsearchMember(Map param) {
		// TODO Auto-generated method stub
		return dao.totalsearchMember(session,param);
	}

	@Override
	public int deletemember(String userId) {
		// TODO Auto-generated method stub
		return dao.deletemember(session,userId);
	}
	
	
	
	
	
	
	
	

}
