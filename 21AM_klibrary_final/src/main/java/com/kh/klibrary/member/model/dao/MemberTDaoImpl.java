package com.kh.klibrary.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.member.model.vo.MemberT;
@Repository
public class MemberTDaoImpl implements MemberTDao {

	@Override
	public MemberT selectMember(SqlSessionTemplate session, Map m1) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMember", m1);
	}

}
