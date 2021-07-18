package com.kh.klibrary.qna.model.service;

import java.util.List;

import com.kh.klibrary.qna.model.vo.Qna;

public interface QnaService {
	
	int CountQna();
	List<Qna> selectQnaList(int cPage, int numPerPage);
	
	Qna selectQna(int qnaNo);
}
