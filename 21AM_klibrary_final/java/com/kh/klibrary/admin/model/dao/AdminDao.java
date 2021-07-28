package com.kh.klibrary.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

public interface AdminDao {

	List<Map> countVis(SqlSessionTemplate session,Map param);
	
}
