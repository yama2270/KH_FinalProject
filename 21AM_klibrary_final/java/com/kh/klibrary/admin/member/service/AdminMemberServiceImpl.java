package com.kh.klibrary.admin.member.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.admin.member.dao.AdminMemberDao;
import com.kh.klibrary.admin.member.vo.AdminMember;
import com.kh.klibrary.admin.member.vo.AdminMemberDrop;
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

	@Override
	public int deletememberList(Map m) {
		// TODO Auto-generated method stub
		return dao.deletememberList(session,m);
	}

	@Override
	public AdminMember selectMember(String userId) {
		// TODO Auto-generated method stub
		return dao.selectMember(session,userId);
	}

	@Override
	public int updateMember(AdminMember m) {
		// TODO Auto-generated method stub
		return dao.updateMember(session,m);
	}

	@Override
	public List<AdminMemberDrop> selectDropList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectDropList(session,cPage,numPerpage);
	}

	@Override
	public int selectDropCount() {
		// TODO Auto-generated method stub
		return dao.selectDropCount(session);
	}

	@Override
	public List<AdminMember> memberWithdrawSearch(Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.memberWithdrawSearch(session,param,cPage,numPerpage);
	}

	@Override
	public int totalmemberWithdrawSearch(Map param) {
		// TODO Auto-generated method stub
		return dao.totalmemberWithdrawSearch(session,param);
	}

	@Override
	public int memberWithdrawDelete(String userId) {
		// TODO Auto-generated method stub
		return dao.memberWithdrawDelete(session,userId);
	}

	@Override
	public int memberWirthdrawNo(String userId) {
		// TODO Auto-generated method stub
		return dao.memberWirthdrawNo(session,userId);
	}

	@Override
	public int memberWithdrawDeleteList(Map m) {
		// TODO Auto-generated method stub
		return dao.memberWithdrawDeleteList(session,m);
	}

	@Override
	public int memberWirthdrawNoList(Map m) {
		// TODO Auto-generated method stub
		return dao.memberWirthdrawNoList(session,m);
	}
	
	
	
	

	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
