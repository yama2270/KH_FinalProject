package com.kh.klibrary.admin.book.model.service;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.klibrary.admin.book.model.dao.AdminBookDao;
import com.kh.klibrary.book.model.vo.BookInfo;

@Service
public class AdminBookServiceImpl implements AdminBookService {
	
	@Autowired
	private AdminBookDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int checkIsbn(String isbnNo) {
		return dao.checkIsbn(isbnNo,session);
	}
	
	@Override
	@Transactional(rollbackFor= {Exception.class})
	public int insertBook(BookInfo bookInfo,String newBook) throws RuntimeException{
		
		int result = 0;
		
		// isbn 등록
		if(newBook.equals("true")) {
			result = dao.insertBookInfo(bookInfo,session);
		}
		
		// book 등록 
		try {
			result = dao.insertBook(bookInfo,session);
		} catch(RuntimeException e) {
			throw new RuntimeException("작성실패");
		}
		return result;
	}
	
	
	
}
