package com.kh.klibrary.search.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.Likes;

public interface SearchService {

	ResponseEntity<String> searchNaverApi(String keyword,String category,int page,int size);

	int bookTotalCount(HashMap<String, Object> hashMap);//sy,통합검색
	List<BookInfo> selectBookList(HashMap<String, Object> hashMap);//sy,통합검색
	
	Book selectBook(String isbnNo);
	Lending selectLending(String bookNo);
	
	List<BookInfo> selectDetailSearch(Map param,int cPage, int searchNumber);//상세검색
	int selectDetailSearchCount(Map param);
	
	List<BookInfo> kdcNoSearch(Map param,int cPage, int searchNumber);//주제별검색
	int kdcBookListCount(Map param);
	
	int insertInterestingBook(Map param);//관심도서등록
	Likes selectInterestingBook(Map param);//관심도서등록선택
	
	int bookingBook(Map param);//예약도서"불가능"update
	int booking(Map param);//예약테이블
	
	List<Integer> selectAge(String isbnNo);//관심도서연령대선택
	
	List<BookInfo> selectBookInfoList(Map param);//wishbook,cg
	
	List<Map> likeBest();//관심도서순위 이름갖고오기
    List<Map> lendingBest();//대출순위
	
	int insertWishBook(Map param);
	
	List<BookInfo> bookRecomend();

	
}
