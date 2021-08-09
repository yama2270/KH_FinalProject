package com.kh.klibrary.search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.Likes;

@Repository
public class SearchDaoImpl implements SearchDao{

	@Override
	public int bookTotalCount(SqlSessionTemplate session,HashMap<String, Object> hashMap){
		 
		 System.out.println(hashMap);
		int cPage=(int)hashMap.get("cPage");
		int searchNumber=(int)hashMap.get("searchNumber");
		
		
		return session.selectOne("search.selectBookCount",hashMap);
	}
	
	@Override
	public List<BookInfo> selectBookList(SqlSessionTemplate session,HashMap<String, Object> hashMap){
		 
		 System.out.println(hashMap);
		int cPage=(int)hashMap.get("cPage");
		int searchNumber=(int)hashMap.get("searchNumber");
		
		
		return session.selectList("search.selectBookList",hashMap,new RowBounds((cPage-1)*searchNumber,searchNumber));
	}
	
	@Override
	public int selectBookCount(SqlSessionTemplate session) {
		
		return session.selectOne("search.selectBookCount");
	}
	
	@Override

	public Book selectBook(SqlSessionTemplate session, String isbnNo){
		
		return session.selectOne("search.selectBookInfo",isbnNo);
	};
	
	@Override
	public Lending selectLending(SqlSessionTemplate session, String bookNo) {
		return session.selectOne("search.selectLending", bookNo);
	}
	
	
	
	
	
	@Override
	public List<BookInfo> selectDetailSearch(SqlSessionTemplate session, Map param,int cPage, int searchNumber){
		String ISBN=((String)param.get("isbnNo"));
		param.put("isbnNo", ISBN);
		return session.selectList("search.selectDetail", param,new RowBounds((cPage-1)*searchNumber,searchNumber));
	}
	
	@Override
	public int selectDetailSearchCount(SqlSessionTemplate session, Map param) {
		return session.selectOne("search.selectDetailCount",param);
	}
	
    @Override
	public List<BookInfo> selectBookInfoList(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("search.selectBookInfoList", param);
	}
    
    @Override
	public List<BookInfo> kdcNoSearch(SqlSessionTemplate session,Map param,int cPage,int searchNumber){
		return session.selectList("search.kdcNoSearch", param, new RowBounds((cPage-1)*searchNumber,searchNumber));
	}
    
    @Override
	public int kdcBookListCount(SqlSessionTemplate session,Map param) {
		return session.selectOne("search.kdcNoSearchCount",param);
	}
    
    @Override
	public int insertInterestingBook(SqlSessionTemplate session,Map param) {
		return session.insert("search.insertInterestingBook", param);
	}
	
    @Override
    public Likes selectInterestingBook(SqlSessionTemplate session,Map param) {
    	return session.selectOne("search.selectInterestingBook", param);
    }
    
	@Override
	public int insertWishBook(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("search.insertWishBook", param);
	}

	@Override
	public  int bookingBook(SqlSessionTemplate session, Map param) {
		return session.update("search.bookingBook",param);
	}
	
	@Override
	public int booking(SqlSessionTemplate session,Map param) {
		return session.insert("search.booking",param);
	}

	 
	@Override
	public List<Booking> selectPassedDate(SqlSessionTemplate session) {
		return session.selectList("search.selectPassedDate");
	}
	
	@Override
	public int insertBookingHistory(SqlSessionTemplate session, Booking b) {
		return session.insert("search.insertBookingHistory", b);
	}
	
	@Override
	public  int deleteBookNo(SqlSessionTemplate session, String bookNo) {
		return session.delete("search.deleteBookNo",bookNo);
	}
	
	/*
	 * @Override public int deleteBookNo2(SqlSessionTemplate session, String bookNo)
	 * { return session.delete("search.deleteBookNo2",bookNo); }
	 */
	
	@Override
	public int updateBookNo(SqlSessionTemplate session,String bookNo) {
		return session.update("search.updateBookNo", bookNo);
	}
	
	@Override
	public List<Integer> selectAge(SqlSessionTemplate session, String isbnNo){
		return session.selectList("selectAge", isbnNo);
	};
	
	@Override
	public List<BookInfo> bookRecomend(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("search.bookRecomend");
	}
	
	@Override
	public List<Map> likeBest(SqlSessionTemplate session){
		return session.selectList("likeBest");
	}
	 
	@Override
	public List<Map> lendingBest(SqlSessionTemplate session){
		return session.selectList("lendingBest");
	}
	 
}
