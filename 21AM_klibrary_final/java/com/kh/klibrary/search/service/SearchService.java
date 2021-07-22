package com.kh.klibrary.search.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.member.model.vo.Lending;

public interface SearchService {

	ResponseEntity<String> searchNaverApi(String keyword,String category,int page,int size);

	int bookTotalCount(HashMap<String, Object> hashMap);//sy,통합검색
	List<BookInfo> selectBookList(HashMap<String, Object> hashMap);//sy,통합검색
	
	Book selectBook(String isbnNo);
	Lending selectLending(String bookNo);
	
	List<BookInfo> selectBookInfoList(Map param);//wishbook,cg

	
	int insertWishBook(Map param);
	

	
}
