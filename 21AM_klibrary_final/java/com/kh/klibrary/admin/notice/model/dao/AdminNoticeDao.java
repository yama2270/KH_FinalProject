package com.kh.klibrary.admin.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.faq.model.vo.Attachment;

public interface AdminNoticeDao {
	List<Notice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerpage);
	int insertNotice(SqlSessionTemplate session, Notice notice);
	Notice selectNoticeView(SqlSessionTemplate session,int noticeNo);
	int deleteNotice(SqlSessionTemplate session, String noticeNo);
	int noticeUpdate(SqlSessionTemplate session, Notice notice);
	int noticeCount(SqlSessionTemplate session, int noticeNo);
	
}
