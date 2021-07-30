package com.kh.klibrary.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.member.vo.AdminMember;
import com.kh.klibrary.admin.member.vo.MemberDrop;

public interface AdminMemberDao {
	
	List<AdminMember> selectMemberList(SqlSessionTemplate session,int cPage,int numPerpage);
	int selectMemberCount(SqlSessionTemplate session);
	List<AdminMember> searchMember(SqlSessionTemplate session,Map param, int cPage, int numPerpage);
	int totalsearchMember(SqlSessionTemplate session,Map param);
	int deletemember(SqlSessionTemplate session,String userId);
	int deletememberList(SqlSessionTemplate session,Map m);
	AdminMember selectMember(SqlSessionTemplate session,String userId);
	int updateMember(SqlSessionTemplate session,AdminMember m);
	List<MemberDrop> selectDropList(SqlSessionTemplate session,int cPage,int numPerpage);
	int selectDropCount(SqlSessionTemplate session);

}
