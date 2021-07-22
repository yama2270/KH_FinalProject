package com.kh.klibrary.faq.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.faq.model.vo.Faq;
@Repository
public class FaqDaoImpl implements FaqDao {
	@Inject
	SqlSession sqlSession;

	
  	@Override public List<Faq> selectFaqList(SqlSessionTemplate sqlsession) { 
	  //TODO Auto-generated method stub 
	  // returnsqlsession.selectList("faq.selectFaqList"); 
	  
	  return sqlSession.selectList("faq.selectFaqList"); }

  	
  	//Faq  검색
	@Override
	public List<Faq> searchFaqTitle(SqlSessionTemplate sqlsession, String keyWord) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("faq.searchFaqTitle",keyWord);
	}

	//Faq 검색
	@Override
	public List<Faq> searchFaqContent(SqlSessionTemplate sqlsession, String keyWord) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("faq.searchFaqContent", keyWord);
	}
	
	  
}
