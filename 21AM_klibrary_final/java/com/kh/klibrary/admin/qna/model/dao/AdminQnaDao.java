package com.kh.klibrary.admin.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface AdminQnaDao {

	int selectQnaCount(SqlSessionTemplate session) ;
	
}
