package com.kh.klibrary.search.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.book.model.vo.BookInfo;

public interface SearchDao {

	 List<BookInfo> bookTotalSearch(SqlSessionTemplate session,String category,String keyword,int searchNumber,int cPage);
	 int selectBookCount(SqlSessionTemplate session);
}
