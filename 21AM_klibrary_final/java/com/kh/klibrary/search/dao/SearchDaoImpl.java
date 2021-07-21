package com.kh.klibrary.search.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.book.model.vo.BookInfo;

@Repository
public class SearchDaoImpl implements SearchDao{

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
