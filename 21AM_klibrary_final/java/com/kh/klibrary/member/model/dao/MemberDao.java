package com.kh.klibrary.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.member.model.vo.Member;

public interface MemberDao {

	int insertMember(SqlSessionTemplate session, Member m);
	Member selectMember1(SqlSessionTemplate session, Map param);
	
}
