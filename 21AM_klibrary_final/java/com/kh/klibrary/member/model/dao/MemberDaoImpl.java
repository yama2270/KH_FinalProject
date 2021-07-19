package com.kh.klibrary.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		
		return session.insert("member.insertMember", m);
	}

	@Override
	public Member selectMember1(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMember1", param);
	}

}
