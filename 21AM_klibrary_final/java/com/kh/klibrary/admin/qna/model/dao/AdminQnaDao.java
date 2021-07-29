package com.kh.klibrary.admin.qna.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.qna.model.vo.Qna;

public interface AdminQnaDao {
	List<Qna> selectQnaList(SqlSessionTemplate session, int cPage, int numPerpage);
	int selectQnaCount(SqlSessionTemplate session);
	Qna selectQnaView(SqlSessionTemplate session, int qnaNo);
	int updateQnaCount(SqlSessionTemplate session, int qnaNo);
	int insertQnaAnswer(SqlSessionTemplate session, Qna qna);
	int deleteQna(SqlSessionTemplate session, String qnaNo);
	List<Qna> searchQnaTitle(SqlSessionTemplate session, String keyWord);
	List<Qna> searchQnaContent(SqlSessionTemplate session, String keyWord);
	int qnaAnswerUpdate(SqlSessionTemplate session, Qna qna);
}
