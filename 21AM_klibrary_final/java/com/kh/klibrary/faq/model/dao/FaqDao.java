package com.kh.klibrary.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.faq.model.vo.Faq;

public interface FaqDao {
	
	  List<Map> selectFaqList(SqlSessionTemplate sqlsession);
	 	
	/*
	 * public List<Faq> listAll(String searchOption, String keyword) throws
	 * Exception; public int countArticle (String searchOption, String keyword)
	 * throws Exception;
	 */
}
