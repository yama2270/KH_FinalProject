package com.kh.klibrary.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.admin.model.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private AdminDao dao;
	
	@Override
	public List<Map> countVis(Map param){
		return dao.countVis(session,param);
	}
	
}
