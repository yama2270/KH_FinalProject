package com.kh.klibrary.admin.book.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;

public interface AdminBookService {
	
	// isbn 중복검사
	int checkIsbn(String isbnNo);
	
	// 책등록 
	int insertBook(BookInfo bookInfo,String newBook);
	
	// 도서목록 
	List<Book> selectBookList(int cPage,int numPerPage);
	
	// 도서 상세
	Book selectBook(String bookNo);
	
	// 도서 대출내역 
	List<LendingHistory> selectLenHis(String bookNo);
	
	// 총 도서
	int totalBook();
	
	// 도서 key 검색 
	List<Book> searchKeyBook(Map param,int cPage,int numPerPage);
	
	// 도서 key 총도서 
	int totalKeyBook(Map param);
	
	// 도서 Detail 검색 
	List<Book> searchDetBook(Map param,int cPage,int numPerPage);
	
	// 도서 Detail 총도서 
	int totalDetBook(Map param);
	
	// 도서삭제
	int deleteBook(Map m);
	
	//대출도서 목록
	List<Lending> selectRentalList(int cPage, int numPerPage);
	//대출도서 카운트
	int selectRentalCount();
	
	//대출도서 목록 검색
	List<Lending> SearchRentalList(Map param, int cPage, int numPerPage);
	//대출도서 목록 검색 카운트
	int SearchRentalCount(Map param);
	//대출도서 연장
	int addBookExtend(Map param);
	
	// 카테고리별 도서수 
	List<Map<String,Integer>> countCatBook();
}

