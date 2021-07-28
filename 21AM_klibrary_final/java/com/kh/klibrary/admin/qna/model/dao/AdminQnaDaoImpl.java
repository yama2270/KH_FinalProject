package com.kh.klibrary.admin.qna.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.qna.model.vo.Qna;
@Repository
public class AdminQnaDaoImpl implements AdminQnaDao {

	@Override
	public int selectQnaCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("qna.selectQnaCount");
	}

	@Override
	public List<Qna> selectQnaList(SqlSessionTemplate session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("qna.selectQnaList",null,
				new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public Qna selectQnaView(SqlSessionTemplate session, int qnaNo) {
		// TODO Auto-generated method stub
		return session.selectOne("qna.selectQnaView", qnaNo);
	}

	@Override
	public int updateQnaCount(SqlSessionTemplate session, int qnaNo) {
		// TODO Auto-generated method stub
		return session.update("qna.updateQnaCount", qnaNo);
	}

	@Override
	public int deleteQna(SqlSessionTemplate session, String qnaNo) {
		// TODO Auto-generated method stub
		return session.delete("qna.deleteQna", qnaNo);
	}

}
