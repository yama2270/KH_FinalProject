package com.kh.klibrary.member.model.service;

import java.util.Map;

import com.kh.klibrary.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);
	Member selectMember1(Map param);
}
