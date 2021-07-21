package com.kh.klibrary.search.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.kh.klibrary.book.model.vo.BookInfo;

public interface SearchService {

	ResponseEntity<String> searchNaverApi(String keyword,String category,int page,int size);
	List<BookInfo> selectBookInfoList(Map param);
	int insertWishBook(Map param);
	
}
