package com.kh.klibrary.admin.book.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.book.model.vo.BookInfo;

@Repository
public class AdminBookDaoImpl implements AdminBookDao {
	
	@Override 
	public int checkIsbn(String isbnNo,SqlSessionTemplate session) {
		return session.selectOne("adminBook.checkIsbn",isbnNo);
	}
	
	//도서ISBN 등록 
	@Override
	public int insertBookInfo(BookInfo bookInfo,SqlSessionTemplate session) {
		return session.insert("adminBook.insertBookInfo",bookInfo);
	}
	
	// 도서등록
	@Override
	public int insertBook(BookInfo bookInfo,SqlSessionTemplate session) {
		return session.insert("adminBook.insertBook",bookInfo);
	}
}
