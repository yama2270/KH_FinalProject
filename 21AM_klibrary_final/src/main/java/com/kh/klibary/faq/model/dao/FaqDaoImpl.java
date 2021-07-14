package com.kh.klibary.faq.model.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibary.faq.model.service.FaqService;
import com.kh.klibary.faq.model.vo.Faq;

@Repository
public class FaqDaoImpl implements FaqDao {

	@Override
	public List<Faq> selectFaqList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("faq.selectFaqList");
	}

}
