package com.kh.klibrary.qna.model.service;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.qna.model.dao.QnaDao;
import com.kh.klibrary.qna.model.vo.Attachment;
import com.kh.klibrary.qna.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao dao;
	
	@Autowired SqlSessionTemplate session;
	
	//QNA검색 타이틀
	
	@Override
	public List<Qna> searchQnaTitle(String keyWord) {
		// TODO Auto-generated method stub
		return dao.searchQnaTitle(session,keyWord);
	}
	//QNA검색 내용
	@Override
	public List<Qna> searchQnaContent(String keyWord) {
		// TODO Auto-generated method stub
		return dao.searchQnaContent(session, keyWord);
	}
	
	
	//페이징처리
	@Override
	public int CountQna() {
		// TODO Auto-generated method stub
		return dao.countQna(session);
	}

	@Override
	public List<Qna> selectQnaList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectQnaList(cPage, numPerPage, session);
	}

	@Override
	public Qna selectQna(int qnaNo) {
		// TODO Auto-generated method stub
		return dao.selectQna(qnaNo, session);
	}
	
	//QNA쓰기
	@Override
	public int insertQna(Qna q) throws RuntimeException {
		// TODO Auto-generated method stub
		
		int result =dao.insertQna(q, session);
		
		if(result>0) {
			if(q.getAttachments().size()>0) {
				for(Attachment a : q.getAttachments()) {
					dao.insertAttachment(session, a);
				}
			}
		}
		return result;
	}
	//QNA 보기

	@Override
	public Qna selectQnaView(int no) {
		// TODO Auto-generated method stub
		dao.updateQnaCount(session, no);
		return dao.selectQnaView(session, no);
	}

	//QNA 수정
	@Override
	public int updateQna(Qna q) {
		// TODO Auto-generated method stub
		return dao.updateQna(session, q);
	}
	@Override
	public int selectQnaCount() {
		// TODO Auto-generated method stub
		return dao.selectQnaCount(session);
	}
	@Override
	public int deleteQna1(int no) {
		// TODO Auto-generated method stub
		return dao.deleteQna1(session, no);
	}
	
	
}

