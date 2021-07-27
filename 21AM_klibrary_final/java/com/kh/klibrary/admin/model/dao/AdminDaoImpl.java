package com.kh.klibrary.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Map> countVis(SqlSessionTemplate session,Map param) {
		return session.selectList("admin.countVis",param);
	}

}
