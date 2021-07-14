package com.kh.klibrary.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.member.model.vo.MemberT;

public interface MemberTDao {
	MemberT selectMember(SqlSessionTemplate session, Map m1);
}
