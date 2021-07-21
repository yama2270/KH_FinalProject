package com.kh.klibrary.search.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.book.model.vo.BookInfo;

public interface SearchDao {

	 List<BookInfo> bookTotalSearch(SqlSessionTemplate session,HashMap<String, Object> hashMap);
	 List<BookInfo> bookTotalSearch2(SqlSessionTemplate session,HashMap<String, Object> hashMap);
	 int selectBookCount(SqlSessionTemplate session);
}
