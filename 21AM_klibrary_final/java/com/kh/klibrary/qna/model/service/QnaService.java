package com.kh.klibrary.qna.model.service;

import java.util.List;

import com.kh.klibrary.qna.model.vo.Qna;

public interface QnaService {
	
	//페이징처리
	int CountQna();
	
	List<Qna> selectQnaList(int cPage, int numPerPage);
	
	Qna selectQna(int qnaNo);
	
	//QNA 쓰기
	int insertQna(Qna q);
	
	//QNA 보기
	Qna selectQnaView(int no);
	
}
