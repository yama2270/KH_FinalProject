package com.kh.klibrary.admin.book.model.dao;

import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.book.model.vo.WishBook;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.BookingHistory;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;

@Repository
public class AdminBookDaoImpl implements AdminBookDao {
	
	@Override 
	public int checkIsbn(String isbnNo,SqlSessionTemplate session) {
		return session.selectOne("adminBook.checkIsbn",isbnNo);
	}
	
	//도서ISBN 등록 
	@Override
	public int insertBookInfo(BookInfo bookInfo,SqlSessionTemplate session) {
		return session.insert("adminBook.insertBookInfo",bookInfo);
	}
	
	// 도서Parsing 등록 
//	@Override 
//	public int insertBookParsing(Map m,SqlSessionTemplate session) {
//		return session.insert("adminBook.insertBookParsing",m);
//	} 
	
	// 도서등록
	@Override
	public int insertBook(BookInfo bookInfo,SqlSessionTemplate session) {
		return session.insert("adminBook.insertBook",bookInfo);
	}
	
	// 도서목록 
	@Override 
	public List<Book> selectBookList(int cPage,int numPerPage,SqlSessionTemplate session){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adminBook.selectBookList",null,row);
	}
	
	// 도서 상세
	public Book selectBook(String bookNo,SqlSessionTemplate session) {
		return session.selectOne("adminBook.selectBook",bookNo);
	}
	
	// 도서 대출내역
	public List<LendingHistory> selectLenHis(String bookNo,SqlSessionTemplate session){
		return session.selectList("adminBook.selectLenHis",bookNo);
	}
	
	// 총 도서 
	@Override
	public int totalBook(SqlSessionTemplate session) {
		return session.selectOne("adminBook.totalBook");
	}
	
	// 도서 key 목록 
	@Override
	public List<Book> searchKeyBook(Map param,int cPage,int numPerPage,SqlSessionTemplate session){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		return session.selectList("adminBook.searchKeyBook",param,row);
	}
	
	// 도서 key 총도서 
	public int totalKeyBook(Map param,SqlSessionTemplate session) {
		return session.selectOne("adminBook.totalKeyBook",param);
	}
	
	// 도서 Detail 도서 
	@Override
	public List<Book> searchDetBook(Map param,int cPage,int numPerPage,SqlSessionTemplate session){
		return session.selectList("adminBook.searchDetBook",param,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	// 도서 Detail 총도서 
	@Override
	public int totalDetBook(Map param,SqlSessionTemplate session) {
		return session.selectOne("adminBook.totalDetBook",param);
	}
	
	//도서 삭제 
	@Override
	public int deleteBook(Map m,SqlSessionTemplate session) {
		return session.delete("adminBook.deleteBook",m);
	}
	
	//대출도서 리스트
	@Override
	public List<Lending> selectRentalList(SqlSessionTemplate session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.selectRentalList", null, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	//대출도서 카운트
	@Override
	public int selectRentalCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("adminBook.selectRentalCount");
	}
	
	//대출도서 내역 리스트
	@Override
	public List<LendingHistory> selectRentalHList(SqlSessionTemplate session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.selectRentalHList", null, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	//대출도서 내역 카운트
	@Override
	public int selectRentalHCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("adminBook.selectRentalHCount");
	}
	
	//대출도서 검색 리스트
	@Override
	public List<Lending> searchRentalList(SqlSessionTemplate session, Map param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.searchRentalList",param, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	//대출도서 검색 카운트
	@Override
	public int searchRentalCount(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("adminBook.searchRentalCount",param);
	}
	
	//대출도서내역 검색 리스트
	@Override
	public List<LendingHistory> searchRentalHList(SqlSessionTemplate session, Map param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.searchRentalHList",param, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	//대출도서내역 검색 카운트
	@Override
	public int searchRentalHCount(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("adminBook.searchRentalHCount",param);
	}
	
	//대출도서 연장
	@Override
		public int addBookExtend(SqlSessionTemplate session, Map param) {
			// TODO Auto-generated method stub
			return session.update("adminBook.addBookExtend",param);
		}
	
	//대출도서 내역선택
	@Override
	public Lending selectLending(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("adminBook.selectLending", param);
	}
	
	//대출도서 반납
	@Override
	public int returnBook(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("adminBook.returnBook",param);
	}
	
	//대출내역 삽입
	@Override
	public int insertLendingHistory(SqlSessionTemplate session, Lending ld) {
		// TODO Auto-generated method stub
		return session.insert("adminBook.insertLendingHistory", ld);
	}
	
	//대출도서 체크 카운트
	@Override
	public List<Lending> selectDRTCList(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.selectDRTCList", map);
	}
	//대출도서 체크 삭제
	@Override
	public int deleteRentalCheck(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.delete("adminBook.deleteRentalCheck", map);
	}
	
	//대출도서 체크 내역삽입
	@Override
	public int insertDRTCList(SqlSessionTemplate session, List list) {
		// TODO Auto-generated method stub
		return session.insert("adminBook.insertDRTCList", list);
	}
	
	//예약도서 리스트
	@Override
	public List<Booking> reservedList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.reservedList", null);
	}
	
	//예약도서내역 리스트
	@Override
	public List<BookingHistory> reservedHistoryList(SqlSessionTemplate session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.reservedHistoryList", null, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	//예약도서 카운트
	@Override
	public int reservedHCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("adminBook.reservedHCount");
	}
	
	//예약도서 검색 리스트
	@Override
	public List<Booking> searchReservedList(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.searchReservedList", param);
	}
	
	//예약도서내역 검색 리스트
	@Override
	public List<BookingHistory> searchReservedHistoryList(SqlSessionTemplate session, Map param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.searchReservedHistoryList", param, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	//예약도서 검색 카운트
	@Override
	public int searchReservedHistoryCount(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("adminBook.searchReservedHistoryCount", param);
	}
	
	//예약도서 선택
	@Override
	public Booking selectBooking(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("adminBook.selectBooking", param);
	}
	
	//예약도서내역 삽입
	@Override
	public int insertBookingHistory(SqlSessionTemplate session, Booking booking) {
		// TODO Auto-generated method stub
		return session.insert("adminBook.insertBookingHistory", booking);
	}
	
	//예약도서 삭제
	@Override
	public int cancelReserved(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("adminBook.cancelReserved", param);
	}
	//예약도서 체크 카운트
	@Override
	public List<Booking> selectDRCList(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.selectDRCList", map);
	}
	//예약도서 체크 삭제
	@Override
	public int deleteReservedCheck(SqlSessionTemplate session, Map map) {
		// TODO Auto-generated method stub
		return session.delete("adminBook.deleteReservedCheck", map);
	}
	
	//예약도서 체크 내역삽입
	@Override
	public int insertDRCList(SqlSessionTemplate session, List list) {
		// TODO Auto-generated method stub
		return session.insert("adminBook.insertDRCList", list);
	}
	
	// 카테고리별 도서 수 
	public List<Map<String,Integer>> countCatBook(SqlSessionTemplate session) {
		return session.selectList("adminBook.countCatBook");
	}
	
	// 관심도서 랭킹 
	public List<Map> countLikBook(SqlSessionTemplate session){
		return session.selectList("adminBook.countLikBook");
	}
	
	// admin - main 
	
	public List<Map> countRenBook(SqlSessionTemplate session,Map param){
		return session.selectList("adminBook.countRenBook",param);
	}

	@Override
	public List<WishBook> selectBookWishList(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("adminBook.selectBookWishList",null,
				new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectWishBookCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("adminBook.selectWishBookCount");
	}

	@Override
	public int deleteWishBook(SqlSessionTemplate session, String wishBookNo) {
		// TODO Auto-generated method stub
		return session.delete("adminBook.deleteWishBook", wishBookNo);
	}

	
	
	

	@Override
	public List<WishBook> searchWishBookNo(SqlSessionTemplate session, String keyWord) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.searchWishBookNo", keyWord);
	}


	@Override
	public int insertWishBookToBook(SqlSessionTemplate session, Map m) {
		// TODO Auto-generated method stub
		return session.insert("adminBook.insertWishBookToBook",m);
	}

	@Override
	public int insertWishBookToBookInfo(SqlSessionTemplate session,Map m) {
		// TODO Auto-generated method stub
		return session.insert("adminBook.insertWishBookToBookInfo",m);
	}


	
}