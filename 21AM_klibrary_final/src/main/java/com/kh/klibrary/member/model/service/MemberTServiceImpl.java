package com.kh.klibrary.member.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.member.model.dao.MemberTDao;
import com.kh.klibrary.member.model.vo.MemberT;
@Service
public class MemberTServiceImpl implements MemberTService {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MemberTDao dao;
	
	@Override
	public MemberT selectMember(Map m1) {
		// TODO Auto-generated method stub
		return dao.selectMember(session, m1);
	}

}
