package com.kh.klibrary.faq.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.faq.model.dao.FaqDao;
import com.kh.klibrary.faq.model.vo.Faq;

@Service//서비스 어노테이션
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FaqDao dao;
	
	
	  @Override public List<Faq> selectFaqList() { 
		  // TODO Auto-generated method stub 
		  return dao.selectFaqList(sqlSession); }

	//faq검색  
	@Override
	public List<Faq> searchFaqTitle(String keyWord) {
		// TODO Auto-generated method stub
		return dao.searchFaqTitle(sqlSession,keyWord);
	}

	//faq검색
	@Override
	public List<Faq> searchFaqContent(String keyWord) {
		// TODO Auto-generated method stub
		return dao.searchFaqContent(sqlSession,keyWord);
	}
	 
		/*
		 * @Override public List<Faq> listAll(String searchOption, String keyword)
		 * throws Exception { // TODO Auto-generated method stub return
		 * dao.listAll(searchOption, keyword); }
		 * 
		 * @Override public int countArticle(String searchOption, String keyword) throws
		 * Exception { // TODO Auto-generated method stub return
		 * dao.countArticle(searchOption, keyword); }
		 */
	
}
