package com.kh.klibrary.admin.book.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
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
	
	//대출도서 검색 리스트
	List<Lending> SearchRentalList(SqlSessionTemplate session, Map param, int cPage, int numPerPage);
	
	//대출도서 검색 카운트
	int SearchRentalCount(SqlSessionTemplate session, Map param);
	
	//대출도서 연장
	int addBookExtend(SqlSessionTemplate session, Map param);
	
	//카테고리별 도서수 
	List<Map<String,Integer>> countCatBook(SqlSessionTemplate session);
}
