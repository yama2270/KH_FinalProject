package com.kh.klibary.faq.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibary.faq.model.vo.Faq;

public interface FaqDao {
	List<Faq> selectFaqList(SqlSessionTemplate sqlsession);
}
