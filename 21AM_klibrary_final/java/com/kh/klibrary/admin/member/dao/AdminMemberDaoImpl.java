package com.kh.klibrary.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.admin.member.vo.AdminMember;
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
	
	
	
	
	
	
	
	
	
	
	

}
