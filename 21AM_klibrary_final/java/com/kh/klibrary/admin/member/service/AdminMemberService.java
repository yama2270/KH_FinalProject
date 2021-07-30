package com.kh.klibrary.admin.member.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.admin.member.vo.AdminMember;
import com.kh.klibrary.admin.member.vo.MemberDrop;

public interface AdminMemberService {
	
	List<AdminMember> selectMemberList(int cPage,int numPerpage);
	int selectMemberCount();
	List<AdminMember> searchMember(Map param, int cPage, int numPerpage);
	int totalsearchMember(Map param);
	int deletemember(String userId);
	int deletememberList(Map m);
	AdminMember selectMember(String userId);
	int updateMember(AdminMember m);
	List<MemberDrop> selectDropList(int cPage,int numPerpage);
	int selectDropCount();

}
