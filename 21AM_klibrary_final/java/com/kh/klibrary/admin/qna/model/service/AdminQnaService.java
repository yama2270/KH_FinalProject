package com.kh.klibrary.admin.qna.model.service;

import java.util.List;

import com.kh.klibrary.qna.model.vo.Qna;

public interface AdminQnaService {
	
	List<Qna> selectQnaList(int cPage, int numPerpage);
	
	//게시글 보기
	Qna selectQnaView(int qnaNo);
	
	int selectQnaCount();
	
	int deleteQna(String qnaNo);
	
	List<Qna> searchQnaTitle(String keyWord);
	List<Qna> searchQnaContent(String keyWord);
	
	int qnaAnswerUpdate(Qna qna);
	
	int insertQnaAnswer(Qna qna);
}
