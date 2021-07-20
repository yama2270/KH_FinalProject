package com.kh.klibrary.search.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.book.model.vo.BookInfo;

@Repository
public class SearchDaoImpl implements SearchDao{

	@Override
	public List<BookInfo> bookTotalSearch(SqlSessionTemplate session,String category,String keyword,int searchNumber,int cPage){
		 HashMap<String, String> hashMap = new HashMap<>();
		 hashMap.put("category", category);
		 hashMap.put("keyword", keyword);
		 System.out.println(hashMap);
		System.out.println(category+","+keyword+","+searchNumber+","+cPage);
		
		return session.selectList("search.selectBookList");
	}
	
	@Override
	public int selectBookCount(SqlSessionTemplate session) {
		
		return session.selectOne("search.selectBookCount");
	}
	
}
