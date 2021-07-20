package com.kh.klibrary.admin.book.model.service;

import java.util.List;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;

public interface AdminBookService {
	
	// isbn 중복검사
	int checkIsbn(String isbnNo);
	
	// 책등록 
	int insertBook(BookInfo bookInfo,String newBook);
	
	// 도서목록 
	List<Book> selectBookList(int cPage,int numPerPage);
	
}

