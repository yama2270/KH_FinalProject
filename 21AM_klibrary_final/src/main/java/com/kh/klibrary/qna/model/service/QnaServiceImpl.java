package com.kh.klibrary.qna.model.service;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.qna.model.dao.QnaDao;
import com.kh.klibrary.qna.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao dao;
	
	@Autowired SqlSessionTemplate session;

	@Override
	public int CountQna() {
		// TODO Auto-generated method stub
		return dao.countQna(session);
	}

	@Override
	public List<Qna> selectQnaList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectQnaList(cPage, numPerPage, session);
	}

	@Override
	public Qna selectQna(int qnaNo) {
		// TODO Auto-generated method stub
		return dao.selectQna(qnaNo, session);
	}
	
}

