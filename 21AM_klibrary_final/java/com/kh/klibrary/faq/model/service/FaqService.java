package com.kh.klibrary.faq.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.faq.model.vo.Faq;

public interface FaqService {
	
	  List<Faq> selectFaqList();
	 	
	  //faq검색
	  List<Faq> searchFaqTitle(String keyWord);
	  List<Faq> searchFaqContent(String keyWord);
}
