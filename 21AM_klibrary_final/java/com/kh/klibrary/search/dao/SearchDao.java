package com.kh.klibrary.search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.member.model.vo.Lending;

public interface SearchDao {


	 int bookTotalCount(SqlSessionTemplate session,HashMap<String, Object> hashMap);//sy
	 List<BookInfo> selectBookList(SqlSessionTemplate session,HashMap<String, Object> hashMap);//sy
	 int selectBookCount(SqlSessionTemplate session);
	 Book selectBook(SqlSessionTemplate session, String isbnNo);
	 Lending selectLending(SqlSessionTemplate session, String bookNo);
	 List<BookInfo> selectDetailSearch(SqlSessionTemplate session, Map param,int cPage, int searchNumber);//상세검색
     int selectDetailSearchCount(SqlSessionTemplate session, Map param);
     List<BookInfo> kdcNoSearch(SqlSessionTemplate session,Map param,int cPage,int searchNumber);//주제별검색
     int kdcBookListCount(SqlSessionTemplate session,Map param);
	
	List<BookInfo> selectBookInfoList(SqlSessionTemplate session, Map param);
	int insertWishBook(SqlSessionTemplate session, Map param);

}