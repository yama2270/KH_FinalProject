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
		return dao.selectQnaList(session, cPage, numPerpage);
	}

	@Override
	public Qna selectQnaView(int qnaNo) {
		// TODO Auto-generated method stub
		dao.updateQnaCount(session, qnaNo);
		return dao.selectQnaView(session, qnaNo);
	}

	@Override
	public int selectQnaCount() {
		// TODO Auto-generated method stub
		return dao.selectQnaCount(session);
	}

	@Override
	public int deleteQna(String qnaNo) {
		// TODO Auto-generated method stub
		return dao.deleteQna(session, qnaNo);
	}

	@Override
	public List<Qna> searchQnaTitle(String keyWord) {
		// TODO Auto-generated method stub
		return dao.searchQnaTitle(session, keyWord);
	}

	@Override
	public List<Qna> searchQnaContent(String keyWord) {
		// TODO Auto-generated method stub
		return dao.searchQnaContent(session, keyWord);
	}


	@Override
	public int insertQnaAnswer(Qna qna) {
		// TODO Auto-generated method stub
		int result=dao.insertQnaAnswer(session, qna);
		return result;
	}

	@Override
	public int qnaAnswerUpdate(Qna qna) {
		// TODO Auto-generated method stub
		return dao.qnaAnswerUpdate(session, qna);
	}

}
