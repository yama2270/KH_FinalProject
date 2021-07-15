package com.kh.klibrary.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class FaqDaoImpl implements FaqDao {

	@Override
	public List<Map> selectFaqList(SqlSessionTemplate sqlsession) {
		// TODO Auto-generated method stub
//		return sqlsession.selectList("faq.selectFaqList");
		return sqlsession.selectList("faq.selectFaqList");
	}

}
