package com.kh.klibrary.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.qna.model.vo.Qna;

@Repository
public class QnaDaoImpl implements QnaDao {

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
	
}