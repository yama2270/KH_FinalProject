package com.kh.klibrary.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.member.vo.AdminMember;

public interface AdminMemberDao {
	
	List<AdminMember> selectMemberList(SqlSessionTemplate session,int cPage,int numPerpage);
	int selectMemberCount(SqlSessionTemplate session);
	List<AdminMember> searchMember(SqlSessionTemplate session,Map param, int cPage, int numPerpage);
	int totalsearchMember(SqlSessionTemplate session,Map param);
	int deletemember(SqlSessionTemplate session,String userId);

}
