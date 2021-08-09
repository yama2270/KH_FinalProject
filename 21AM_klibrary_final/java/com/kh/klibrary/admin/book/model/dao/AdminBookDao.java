package com.kh.klibrary.admin.book.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.book.model.vo.WishBook;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.BookingHistory;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;


public interface AdminBookDao {
	
	// Isbn 중복체크
	int checkIsbn(String isbnNo,SqlSessionTemplate session);
	
	// 도서ISBN 등록
	int insertBookInfo(BookInfo bookInfo,SqlSessionTemplate session);
	
	// 도서 parsing
//	int insertBookParsing(Map m,SqlSessionTemplate session);
	
	// 도서등록
	int insertBook(BookInfo bookInfo,SqlSessionTemplate session);	
	
	// 도서목록
	List<Book> selectBookList(int cPage,int numPerPage,SqlSessionTemplate session);
	
	// 도서 상세 
	Book selectBook(String bookNo,SqlSessionTemplate session);
	
	// 도서 대출내역 
	List<LendingHistory> selectLenHis(String bookNo,SqlSessionTemplate session);
	
	// 총 도서 
	int totalBook(SqlSessionTemplate session);
	
	// 도서 key 검색 
	List<Book> searchKeyBook(Map param,int cPage,int numPerPage,SqlSessionTemplate session);
	
	// 도서 key 총 도서 
	int totalKeyBook(Map param,SqlSessionTemplate session);
	
	// 도서 Detail 검색 
	List<Book> searchDetBook(Map param,int cPage,int numPerPage,SqlSessionTemplate session);
	
	// 도서 Detail 총도서
	int totalDetBook(Map param,SqlSessionTemplate session);
	
	// 도서삭제
	int deleteBook(Map m,SqlSessionTemplate session);
	
	//대출도서 리스트
	List<Lending> selectRentalList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	//대출도서 카운트
	int selectRentalCount(SqlSessionTemplate session);

	//대출도서 내역 리스트
	List<LendingHistory> selectRentalHList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	//대출도서 내역 카운트
	int selectRentalHCount(SqlSessionTemplate session);
	
	//대출도서 검색 리스트
	List<Lending> searchRentalList(SqlSessionTemplate session, Map param, int cPage, int numPerPage);
	
	//대출도서 검색 카운트
	int searchRentalCount(SqlSessionTemplate session, Map param);
	
	//대출도서내역 검색 리스트
	List<LendingHistory> searchRentalHList(SqlSessionTemplate session, Map param, int cPage, int numPerPage);
	
	//대출도서내역 검색 카운트
	int searchRentalHCount(SqlSessionTemplate session, Map param);
	
	//대출도서 연장
	int addBookExtend(SqlSessionTemplate session, Map param);
	
	//대출도서 내역선택
	Lending selectLending(SqlSessionTemplate session, Map param);
	
	//대출도서 반납
	int returnBook(SqlSessionTemplate session, Map param);
	
	//대출내역 삽입
	int insertLendingHistory(SqlSessionTemplate session, Lending ld);
	
	//대츨도서 체크 리스트
	List<Lending> selectDRTCList(SqlSessionTemplate session, Map map);
	
	//대출도서 체크 삭제
	int deleteRentalCheck(SqlSessionTemplate session, Map map);
	
	//대출도서 체크 내역삽입
	int insertDRTCList(SqlSessionTemplate session, List list);
	
	//예약도서 리스트
	List<Booking> reservedList(SqlSessionTemplate session);
	
	//예약도서내역 리스트
	List<BookingHistory> reservedHistoryList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	//예약도서 카운트
	int reservedHCount(SqlSessionTemplate session);
	
	//예약도서 검색 리스트
	List<Booking> searchReservedList(SqlSessionTemplate session, Map param);
	
	//예약도서 검색 리스트
	List<BookingHistory> searchReservedHistoryList(SqlSessionTemplate session, Map param, int cPage, int numPerPage);
	
	//예약도서 검색 카운트
	int searchReservedHistoryCount(SqlSessionTemplate session, Map param);
	
	//예약도서 선택
	Booking selectBooking(SqlSessionTemplate session, Map param);
	
	//예약도서내역 삽입
	int insertBookingHistory(SqlSessionTemplate session,Booking booking);
	
	//예약도서 취소
	int cancelReserved(SqlSessionTemplate session, Map param);
	
	//예약도서 체크 리스트
	List<Booking> selectDRCList(SqlSessionTemplate session, Map map);
	
	//예약도서 체크 삭제
	int deleteReservedCheck(SqlSessionTemplate session, Map map);
	
	//예약도서 체크 내역삽입
	int insertDRCList(SqlSessionTemplate session, List list);
	
	//카테고리별 도서수 
	List<Map<String,Integer>> countCatBook(SqlSessionTemplate session);
	
	// 관심도서 랭킹 
	List<Map> countLikBook(SqlSessionTemplate session);
	
	// admin - main 
	
	List<Map> countRenBook(SqlSessionTemplate session,Map param);
	
	
	//희망도서 리스트
	List<WishBook> selectBookWishList(SqlSessionTemplate session, int cPage, int numPerpage);
	int selectWishBookCount(SqlSessionTemplate session);
	
	//희망도서 삭제
	int deleteWishBook(SqlSessionTemplate session, String wishBookNo);
	//희망도서 검색
	List<WishBook> searchWishBookNo(SqlSessionTemplate session, String keyWord);
	
	//희망도서 등록
	int insertWishBookToBook(SqlSessionTemplate session, Map m);
	int insertWishBookToBookInfo(SqlSessionTemplate session, Map m);
	
	
	
}
	