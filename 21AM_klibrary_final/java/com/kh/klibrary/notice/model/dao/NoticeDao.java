package com.kh.klibrary.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.notice.model.vo.Notice;

public interface NoticeDao {

	List<Notice> selectNoticeList(SqlSessionTemplate session,int cPage,int numPerpage);
	int selectNoticeCount(SqlSessionTemplate session);
	Notice selectNoticeView(SqlSessionTemplate session,int no);
	List<Notice> searchnotice(SqlSessionTemplate session, Map param, int cPage, int numPerpage);
	int totalsearchnotice(SqlSessionTemplate session,Map param);
	
	

}