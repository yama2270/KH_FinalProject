package com.kh.klibrary.admin.qna.model.service;

import java.util.List;

import com.kh.klibrary.qna.model.vo.Qna;

public interface AdminQnaService {
	
	List<Qna> selectQnaList(int cPage, int numPerpage);
	
	Qna selectQnaView(int qnaNo);
	
	int selectQnaCount();
	
}
