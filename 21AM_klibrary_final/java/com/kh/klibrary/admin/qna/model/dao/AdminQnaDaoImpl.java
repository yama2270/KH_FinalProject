package com.kh.klibrary.admin.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminQnaDaoImpl implements AdminQnaDao {

	@Override
	public int selectQnaCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("qna.selectQnaCount");
	}

}
