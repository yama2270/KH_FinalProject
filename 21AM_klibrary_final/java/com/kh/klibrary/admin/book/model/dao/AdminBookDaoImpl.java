package com.kh.klibrary.admin.book.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;

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
	
	//도서 삭제 
	@Override
	public int deleteBook(Map m,SqlSessionTemplate session) {
		return session.delete("adminBook.deleteBook",m);
	}
}
