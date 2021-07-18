package com.kh.klibrary.qna.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.qna.model.vo.Qna;

public interface QnaDao {
	
	int countQna(SqlSessionTemplate session);
	
	List<Qna> selectQnaList(int cPage, int numPerPage, SqlSessionTemplate session);
	
	Qna selectQna(int qnaNo, SqlSessionTemplate session);
}
