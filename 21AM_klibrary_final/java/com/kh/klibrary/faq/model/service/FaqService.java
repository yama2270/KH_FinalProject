package com.kh.klibrary.faq.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.faq.model.vo.Faq;

public interface FaqService {
	
	 List<Map> selectFaqList();
	 
	/*
	 * public List<Faq> listAll(String searchOption, String keyword) throws
	 * Exception; public int countArticle(String searchOption, String keyword)
	 * throws Exception;
	 */
}
