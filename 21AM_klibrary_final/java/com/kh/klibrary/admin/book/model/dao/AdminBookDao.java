package com.kh.klibrary.admin.book.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.book.model.vo.BookInfo;


public interface AdminBookDao {
	
	// Isbn 중복체크
	int checkIsbn(String isbnNo,SqlSessionTemplate session);
	
	// 도서ISBN 등록
	int insertBookInfo(BookInfo bookInfo,SqlSessionTemplate session);
	
	// 도서등록
	int insertBook(BookInfo bookInfo,SqlSessionTemplate session);	
	
}