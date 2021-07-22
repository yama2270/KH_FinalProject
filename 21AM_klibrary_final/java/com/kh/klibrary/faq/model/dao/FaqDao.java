package com.kh.klibrary.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.faq.model.vo.Faq;

public interface FaqDao {
	  //faq리스트 불러오기
	  List<Faq> selectFaqList(SqlSessionTemplate sqlSession);
	  
	  //faq검색
	  List<Faq> searchFaqTitle(SqlSessionTemplate sqlsession, String keyWord);
	  List<Faq> searchFaqContent(SqlSessionTemplate sqlsession, String keyWord);
	  

}
