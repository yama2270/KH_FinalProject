package com.kh.klibary.faq.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibary.faq.model.dao.FaqDao;
import com.kh.klibary.faq.model.vo.Faq;
@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Autowired
	private FaqDao dao;
	
	@Override
	public List<Faq> selectFaqList() {
		// TODO Auto-generated method stub
		return dao.selectFaqList(sqlsession);
	}



}
