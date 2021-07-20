package com.kh.klibrary.qna.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.qna.model.vo.Attachment;
import com.kh.klibrary.qna.model.vo.Qna;

public interface QnaDao {
	
	
	
	//페이징처리
	int countQna(SqlSessionTemplate session);
	
	List<Qna> selectQnaList(int cPage, int numPerPage, SqlSessionTemplate session);
	
	Qna selectQna(int qnaNo, SqlSessionTemplate session);

	//QNA 쓰기
	int insertQna(Qna q, SqlSessionTemplate session);
	
	int insertAttachment(SqlSessionTemplate session, Attachment a);
	
	//QNA 읽기
	
	Qna selectQnaView(SqlSessionTemplate session, int no );
	
	//QNA 수정
	int updateQna(SqlSessionTemplate session, Qna q);
}
