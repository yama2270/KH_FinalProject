package com.kh.klibrary.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface FaqDao {
	List<Map> selectFaqList(SqlSessionTemplate sqlsession);
}
