package com.kh.klibrary.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.member.vo.AdminMember;
import com.kh.klibrary.admin.member.vo.AdminMemberDrop;

public interface AdminMemberDao {
	
	List<AdminMember> selectMemberList(SqlSessionTemplate session,int cPage,int numPerpage);
	int selectMemberCount(SqlSessionTemplate session);
	List<AdminMember> searchMember(SqlSessionTemplate session,Map param, int cPage, int numPerpage);
	int totalsearchMember(SqlSessionTemplate session,Map param);
	int deletemember(SqlSessionTemplate session,String userId);
	int deletememberList(SqlSessionTemplate session,Map m);
	AdminMember selectMember(SqlSessionTemplate session,String userId);
	int updateMember(SqlSessionTemplate session,AdminMember m);
	List<AdminMemberDrop> selectDropList(SqlSessionTemplate session,int cPage,int numPerpage);
	int selectDropCount(SqlSessionTemplate session);
	List<AdminMember> memberWithdrawSearch(SqlSessionTemplate session,Map param, int cPage, int numPerpage);
	int totalmemberWithdrawSearch(SqlSessionTemplate session,Map param);
	int memberWithdrawDelete(SqlSessionTemplate session,String userId);
	int memberWirthdrawNo(SqlSessionTemplate session,String userId);
	int memberWithdrawDeleteList(SqlSessionTemplate session, Map m);
	int memberWirthdrawNoList(SqlSessionTemplate session, Map m);

}
