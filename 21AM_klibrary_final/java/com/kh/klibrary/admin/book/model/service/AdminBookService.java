package com.kh.klibrary.admin.book.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.member.model.vo.Booking;
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
	
	//대출도서 내역선택
	Lending selectLending(Map param);
	
	//대출도서 반납 
	int returnBook(Map param);
	
	//대출내역 삽입
	int insertLendingHistory(Lending ld);
	
	//예약도서 리스트
	List<Booking> reservedList(int cPage, int numPerPage);
	//예약도서 카운트
	int reservedCount();
	
	//예약도서 검색
	List<Booking> searchReservedList(Map param, int cPage, int numPerPage);
	
	//예약도서 카운트
	int searchReservedCount(Map param);
	
	//예약도서 선택
	Booking selectBooking(Map param);
	
	//예약도서내역 삽입
	int insertBookingHistory(Booking booking);
	
	//예약 취소
	int cancelReserved(Map param);
	
	// 카테고리별 도서수 
	List<Map<String,Integer>> countCatBook();
	
	// 관심도서 랭킹수 
	List<Map> countLikBook();
}

