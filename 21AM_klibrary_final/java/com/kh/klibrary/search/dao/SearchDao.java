package com.kh.klibrary.search.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.member.model.vo.Lending;

public interface SearchDao {

	 int bookTotalCount(SqlSessionTemplate session,HashMap<String, Object> hashMap);
	 List<BookInfo> selectBookList(SqlSessionTemplate session,HashMap<String, Object> hashMap);
	 int selectBookCount(SqlSessionTemplate session);
	 Book selectBook(SqlSessionTemplate session, String isbnNo);
	 Lending selectLending(SqlSessionTemplate session, String bookNo);
}
