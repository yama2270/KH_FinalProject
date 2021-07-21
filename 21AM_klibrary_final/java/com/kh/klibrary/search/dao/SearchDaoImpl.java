package com.kh.klibrary.search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.book.model.vo.BookInfo;

@Repository
public class SearchDaoImpl implements SearchDao{

	@Override
	public List<BookInfo> bookTotalSearch(SqlSessionTemplate session,HashMap<String, Object> hashMap){
		 
		 System.out.println(hashMap);
		int cPage=(int)hashMap.get("cPage");
		int searchNumber=(int)hashMap.get("searchNumber");
		
		
		return session.selectList("search.selectBookList",hashMap);
	}
	
	@Override
	public List<BookInfo> bookTotalSearch2(SqlSessionTemplate session,HashMap<String, Object> hashMap){
		 
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
	public List<BookInfo> selectBookInfoList(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("search.selectBookInfoList", param);
	}
	
	@Override
	public int insertWishBook(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("search.insertWishBook", param);
	}

}
