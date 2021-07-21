package com.kh.klibrary.search.service;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.kh.klibrary.book.model.vo.BookInfo;

public interface SearchService {

	ResponseEntity<String> searchNaverApi(String keyword,String category,int page,int size);
	List<BookInfo> bookTotalSearch(HashMap<String, Object> hashMap);
	List<BookInfo> bookTotalSearch2(HashMap<String, Object> hashMap);
	int selectBookCount();
}
