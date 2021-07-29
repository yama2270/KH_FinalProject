package com.kh.klibrary.search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.Likes;

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
     
     int insertInterestingBook(SqlSessionTemplate session,Map param);//관심도서등록
     Likes selectInterestingBook(SqlSessionTemplate session,Map param);//관심도서불러오기
     
     int bookingBook(SqlSessionTemplate session,Map param);//예약도서"불가능"업데이트
     int booking(SqlSessionTemplate session,Map param);//예약도서 인서트;
     
     List<Integer> selectPassedDate(SqlSessionTemplate session);//대출예정날짜중 오늘날짜 지난거 갖고오기
     int deleteBookNo(SqlSessionTemplate session, int no);//대출예정날짜 지난 책 지우기
     int deleteBookNo2(SqlSessionTemplate session, int no);
     int updateBookNo(SqlSessionTemplate session, int no);//도서예약여부 가능으로 바꾸기
	
	List<BookInfo> selectBookInfoList(SqlSessionTemplate session, Map param);
	int insertWishBook(SqlSessionTemplate session, Map param);

}