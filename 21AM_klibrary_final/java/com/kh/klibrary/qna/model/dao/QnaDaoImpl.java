package com.kh.klibrary.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.qna.model.vo.Attachment;
import com.kh.klibrary.qna.model.vo.Qna;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	//페이징처리
	@Override
	public int countQna(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("qna.countQna");
	}

	@Override
	public List<Qna> selectQnaList(int cPage, int numPerPage, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		RowBounds row= new RowBounds ( (cPage-1)*numPerPage, numPerPage);
		return session.selectList("qna.selectQnaList",null, row);
	}

	@Override
	public Qna selectQna(int qnaNo, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("qna.selectQna", qnaNo);
	}

	//파일 업로드
	@Override
	public int insertQna(Qna q, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("qna.insertQna", q);
	}

	@Override
	public int insertAttachment(SqlSessionTemplate session, Attachment a) {
		// TODO Auto-generated method stub
		return session.insert("qna.insertAttachment",a);
	}
	
	//QNA 읽기
	@Override
	public Qna selectQnaView(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("qna.selectQnaView", no);
	}
	
	
	
	
	
}