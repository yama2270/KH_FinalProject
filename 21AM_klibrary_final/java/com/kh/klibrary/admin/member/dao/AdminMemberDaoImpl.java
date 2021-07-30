package com.kh.klibrary.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.admin.member.vo.AdminMember;
import com.kh.klibrary.admin.member.vo.AdminMemberDrop;
@Repository
public class AdminMemberDaoImpl implements AdminMemberDao{

	@Override
	public List<AdminMember> selectMemberList(SqlSessionTemplate session,int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectMemberList",null,new RowBounds(((cPage-1)*numPerpage),numPerpage));
	}

	@Override
	public int selectMemberCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectMemberCount");
	}

	@Override
	public List<AdminMember> searchMember(SqlSessionTemplate session, Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.searchMember",param,new RowBounds(((cPage-1)*numPerpage),numPerpage));
	}

	@Override
	public int totalsearchMember(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.totalsearchMember",param);
	}

	@Override
	public int deletemember(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.delete("admin.deletemember",userId);
	}

	@Override
	public int deletememberList(SqlSessionTemplate session, Map m) {
		// TODO Auto-generated method stub
		return session.delete("admin.deletememberList",m);
	}

	@Override
	public AdminMember selectMember(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectMember",userId);
	}

	@Override
	public int updateMember(SqlSessionTemplate session, AdminMember m) {
		// TODO Auto-generated method stub
		return session.update("admin.updateMember",m);
	}

	@Override
	public List<AdminMemberDrop> selectDropList(SqlSessionTemplate session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectDropList",null,new RowBounds(((cPage-1)*numPerpage),numPerpage));
	}

	@Override
	public int selectDropCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectDropCount");
	}

	@Override
	public List<AdminMember> memberWithdrawSearch(SqlSessionTemplate session, Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		System.out.println(param);
		return session.selectList("admin.memberWithdrawSearch",param,new RowBounds(((cPage-1)*numPerpage),numPerpage));
	}

	@Override
	public int totalmemberWithdrawSearch(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.totalmemberWithdrawSearch",param);
	}

	@Override
	public int memberWithdrawDelete(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.delete("admin.memberWithdrawDelete",userId);
	}

	@Override
	public int memberWirthdrawNo(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.delete("admin.memberWirthdrawNo",userId);
	}

	@Override
	public int memberWithdrawDeleteList(SqlSessionTemplate session, Map m) {
		// TODO Auto-generated method stub
		return session.delete("admin.memberWithdrawDeleteList",m);
	}

	@Override
	public int memberWirthdrawNoList(SqlSessionTemplate session, Map m) {
		// TODO Auto-generated method stub
		return session.delete("admin.memberWirthdrawNoList",m);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
