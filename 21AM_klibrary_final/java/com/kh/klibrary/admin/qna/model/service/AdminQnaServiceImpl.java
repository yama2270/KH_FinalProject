package com.kh.klibrary.admin.qna.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.klibrary.admin.qna.model.dao.AdminQnaDao;
import com.kh.klibrary.qna.model.vo.Qna;

@Transactional
@Service

public class AdminQnaServiceImpl implements AdminQnaService{
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private AdminQnaDao dao;

	@Override
	public List<Qna> selectQnaList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna selectQnaView(int qnaNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectQnaCount() {
		// TODO Auto-generated method stub
		return dao.selectQnaCount(session);
	}

}
