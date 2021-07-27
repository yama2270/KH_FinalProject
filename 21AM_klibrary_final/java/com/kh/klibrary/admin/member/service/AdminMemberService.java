package com.kh.klibrary.admin.member.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.admin.member.vo.AdminMember;

public interface AdminMemberService {
	
	List<AdminMember> selectMemberList(int cPage,int numPerpage);
	int selectMemberCount();
	List<AdminMember> searchMember(Map param, int cPage, int numPerpage);
	int totalsearchMember(Map param);
	int deletemember(String userId);

}
