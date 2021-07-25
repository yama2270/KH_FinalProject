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
	
	//대출도서 검색
	@Override
	public List<Lending> SearchRentalList(Map param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.SearchRentalList(session, param, cPage, numPerPage);
	}	
	
	//대출도서 검색 카운트
	@Override
	public int SearchRentalCount(Map param) {
		// TODO Auto-generated method stub
		return dao.SearchRentalCount(session, param);
	}
	
	//대출도서 연장
	@Override
	public int addBookExtend(Map param) {
		// TODO Auto-generated method stub
		return dao.addBookExtend(session, param);
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
	
}
