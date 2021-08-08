package com.kh.klibrary.qna.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
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

	//QNA 수정
	@Override
	public int updateQna(SqlSessionTemplate session, Qna q) {
		// TODO Auto-generated method stub
		return session.update("qna.updateQna", q);
	}

	//QNA 검색
	@Override
	public List<Qna> searchQnaTitle(SqlSessionTemplate session, String keyWord) {
		// TODO Auto-generated method stub
		return session.selectList("qna.searchQnaTitle", keyWord);
	}

	@Override
	public List<Qna> searchQnaContent(SqlSessionTemplate session, String keyWord) {
		// TODO Auto-generated method stub
		return session.selectList("qna.searchQnaContent", keyWord);
	}

	@Override
	public int selectQnaCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("qna.selectQnaCount");
	}
	
	//조회수 증가
	@Override
	public int updateQnaCount(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.update("qna.updateQnaCount",no);
	}
	
	//QNA 삭제
	@Override
	public int deleteQna1(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.delete("qna.deleteQna1",no);
	}
	
	
	
	
	
	
	
	
	
}