package com.kh.klibrary.admin.member.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.admin.member.vo.AdminMember;
import com.kh.klibrary.admin.member.vo.AdminMemberDrop;

public interface AdminMemberService {
	
	List<AdminMember> selectMemberList(int cPage,int numPerpage);
	int selectMemberCount();
	List<AdminMember> searchMember(Map param, int cPage, int numPerpage);
	int totalsearchMember(Map param);
	int deletemember(String userId);
	int deletememberList(Map m);
	AdminMember selectMember(String userId);
	int updateMember(AdminMember m);
	List<AdminMemberDrop> selectDropList(int cPage,int numPerpage);
	int selectDropCount();
	List<AdminMember> memberWithdrawSearch(Map param, int cPage, int numPerpage);
	int totalmemberWithdrawSearch(Map param);
	int memberWithdrawDelete(String userId);
	int memberWirthdrawNo(String userId);
	int memberWithdrawDeleteList(Map m);
	int memberWirthdrawNoList(Map m);

}
