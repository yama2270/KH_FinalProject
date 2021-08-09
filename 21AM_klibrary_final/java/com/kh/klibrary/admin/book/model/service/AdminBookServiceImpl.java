package com.kh.klibrary.admin.book.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.klibrary.admin.book.model.dao.AdminBookDao;
import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.book.model.vo.WishBook;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.BookingHistory;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;

@Service
public class AdminBookServiceImpl implements AdminBookService {
	
	@Autowired
	private AdminBookDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	// isbn 중복여부
	@Override
	public int checkIsbn(String isbnNo) {
		return dao.checkIsbn(isbnNo,session);
	}
	
	// 도서등록 
	@Override
	@Transactional
	public int insertBook(BookInfo bookInfo,String newBook) {
		
		int result = 0;
		
		// isbn 등록
		try {
			if(newBook.equals("true")) {
				result += dao.insertBookInfo(bookInfo,session);
				
				// Parsing 처리
	//			Map m = new HashMap();
	//			SplitHangeulToConsonant p = new SplitHangeulToConsonant();
	//			m.put("isbnNo", bookInfo.getIsbnNo());
	//			m.put("bookParName",p.splitHangeulToConsonant(bookInfo.getBookName()));
	//			m.put("bookParWriter",p.splitHangeulToConsonant(bookInfo.getBookWriter()));
	//			m.put("bookParCompany",p.splitHangeulToConsonant(bookInfo.getBookCompany()));
				
	//			result += dao.insertBookParsing(m,session);
			}
		
		// book 등록 
			result += dao.insertBook(bookInfo,session);
		}	catch(RuntimeException e) {
			throw new RuntimeException("작성실패");
		}
		
		return result;
	}
	
	// 도서목록
	@Override 
	public List<Book> selectBookList(int cPage,int numPerPage){
		return dao.selectBookList(cPage,numPerPage,session);
	}
	
	// 총도서 
	@Override
	public int totalBook() {
		return dao.totalBook(session);
	}
	
	// 도서 key 검색 
	@Override 
	public List<Book> searchKeyBook(Map param,int cPage, int numPerPage){
		return dao.searchKeyBook(param,cPage,numPerPage,session);
	}
	
	// 도서 key 총도서
	@Override
	public int totalKeyBook(Map param) {
		return dao.totalKeyBook(param,session);
	}
	
	@Override
	public Book selectBook(String bookNo) {
		return dao.selectBook(bookNo,session);
	}
	
	@Override
	public List<LendingHistory> selectLenHis(String bookNo){
		return dao.selectLenHis(bookNo,session); 
	}
	
	// 도서 Detail 검색 
	@Override 
	public List<Book> searchDetBook(Map param,int cPage,int numPerPage){
		return dao.searchDetBook(param,cPage,numPerPage,session);
	}
	
	// 도서 Detail 총도서
	@Override
	public int totalDetBook(Map param) {
		return dao.totalDetBook(param,session);
	}
	
	// 도서삭제 
	@Override
	public int deleteBook(Map m) {
		return dao.deleteBook(m,session);
	}
	
	//대출도서 리스트
	@Override
	public List<Lending> selectRentalList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectRentalList(session, cPage, numPerPage);
	}
	
	//대출도서 카운트
	@Override
	public int selectRentalCount() {
		// TODO Auto-generated method stub
		return dao.selectRentalCount(session);
	}
	
	//대출도서 내역 목록
	@Override
	public List<LendingHistory> selectRentalHList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectRentalHList(session, cPage, numPerPage);
	}
	
	//대출도서 내역 카운트
	@Override
	public int selectRentalHCount() {
		// TODO Auto-generated method stub
		return dao.selectRentalHCount(session);
	}
	
	//대출도서 검색
	@Override
	public List<Lending> searchRentalList(Map param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.searchRentalList(session, param, cPage, numPerPage);
	}	
	
	//대출도서 검색 카운트
	@Override
	public int searchRentalCount(Map param) {
		// TODO Auto-generated method stub
		return dao.searchRentalCount(session, param);
	}
	
	//대출도서내역 검색
	@Override
	public List<LendingHistory> searchRentalHList(Map param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.searchRentalHList(session, param, cPage, numPerPage);
	}	
	
	//대출도서내역 검색 카운트
	@Override
	public int searchRentalHCount(Map param) {
		// TODO Auto-generated method stub
		return dao.searchRentalHCount(session, param);
	}
	
	
	
	//대출도서 연장
	@Override
	public int addBookExtend(Map param) {
		// TODO Auto-generated method stub
		return dao.addBookExtend(session, param);
	}
	
	//대출도서 내역선택
	@Override
	public Lending selectLending(Map param) {
		// TODO Auto-generated method stub
		return dao.selectLending(session, param);
	}
	
	//대출도서 반납
	@Override
	public int returnBook(Map param) {
		// TODO Auto-generated method stub
		return dao.returnBook(session, param);
	}
	
	//대출내역 삽입
	@Override
	public int insertLendingHistory(Lending ld) {
		// TODO Auto-generated method stub
		return dao.insertLendingHistory(session, ld);
	}
	
	@Override
	public List<Lending> selectDRTCList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectDRTCList(session, map);
	}
	
	@Override
	public int insertDRTCList(List list) {
		// TODO Auto-generated method stub
		return dao.insertDRTCList(session, list);
	}
	
	@Override
	public int deleteRentalCheck(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteRentalCheck(session, map);
	}
	
	//예약도서 리스트
	@Override
	public List<Booking> reservedList() {
		// TODO Auto-generated method stub
		return dao.reservedList(session);
	}
	
	//예약도서내역 리스트
	@Override
	public List<BookingHistory> reservedHistoryList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.reservedHistoryList(session, cPage, numPerPage);
	}
	
	//예약도서내역 카운트
	@Override
	public int reservedHCount() {
		// TODO Auto-generated method stub
		return dao.reservedHCount(session);
	}
	
	//예약도서 검색리스트
	@Override
	public List<Booking> searchReservedList(Map param) {
		// TODO Auto-generated method stub
		return dao.searchReservedList(session,param);
	}
	
	//예약도서내역 검색리스트
	@Override
	public List<BookingHistory> searchReservedHistoryList(Map param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.searchReservedHistoryList(session,param, cPage, numPerPage);
	}
	
	//예약도서 검색카운트
	@Override
	public int searchReservedHistoryCount(Map param) {
		// TODO Auto-generated method stub
		return dao.searchReservedHistoryCount(session, param);
	}
	
	//예약도서 선택
	@Override
	public Booking selectBooking(Map param) {
		// TODO Auto-generated method stub
		return dao.selectBooking(session, param);
	}
	//예약도서내역 삽입
	@Override
	public int insertBookingHistory(Booking booking) {
		// TODO Auto-generated method stub
		return dao.insertBookingHistory(session, booking);
	}
	//예약취소
	@Override
	public int cancelReserved(Map param) {
		// TODO Auto-generated method stub
		return dao.cancelReserved(session, param);
	}
	//예약도서 체크 리스트
	@Override
	public List<Booking> selectDRCList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectDRCList(session, map);
	}
	
	//예약도서 체크 삭제
	@Override
	public int deleteReservedCheck(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteReservedCheck(session,map);
	}
	
	//예약도서 체크 내역삽입
	@Override
	public int insertDRCList(List list) {
		// TODO Auto-generated method stub
		return dao.insertDRCList(session,list);
	}
	
	// 카테고리별 도서수 
	@Override
	public List<Map<String,Integer>> countCatBook() {
		return dao.countCatBook(session);
	}
	
	// 관심도서 랭킹 
	@Override 
	public List<Map> countLikBook(){
		return dao.countLikBook(session);
	}
	
	// admin - main 
	
	@Override 
	public List<Map> countRenBook(Map param){
		return dao.countRenBook(session,param);
	}

	
	//희망도서 리스트
	@Override
	public List<WishBook> selectBookWishList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectBookWishList(session, cPage, numPerpage);
	}

	@Override
	public int selectWishBookCount() {
		// TODO Auto-generated method stub
		return dao.selectWishBookCount(session);
	}

	@Override
	public int deleteWishBook(String wishBookNo) {
		// TODO Auto-generated method stub
		return dao.deleteWishBook(session, wishBookNo);
	}

	


	@Override
	public List<WishBook> searchWishBook(int cPage, int numPerpage, Map param) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int insertWishBookToBook(Map m) {
		// TODO Auto-generated method stub
		return dao.insertWishBookToBook(session, m);
	}

	@Override
	public int insertWishBookToBookInfo(Map m) {
		// TODO Auto-generated method stub
		return dao.insertWishBookToBookInfo(session, m);
	}

	

	
}
