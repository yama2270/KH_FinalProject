package com.kh.klibrary.admin.book.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
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
	
	//대출도서 검색 리스트
	@Override
	public List<Lending> SearchRentalList(SqlSessionTemplate session, Map param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("adminBook.SearchRentalList",param);
	}
	
	//대출도서 검색 카운트
	@Override
	public int SearchRentalCount(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("adminBook.SearchRentalCount",param);
	}
	
	//대출도서 연장
	@Override
	public int addBookExtend(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.update("adminBook.addBookExtend",param);
	}
	
	// 카테고리별 도서 수 
	public List<Map<String,Integer>> countCatBook(SqlSessionTemplate session) {
		return session.selectList("adminBook.countCatBook");
	}
	
	// 관심도서 랭킹 
	public List<Map> countLikBook(SqlSessionTemplate session){
		return session.selectList("adminBook.countLikBook");
	}
	
}
