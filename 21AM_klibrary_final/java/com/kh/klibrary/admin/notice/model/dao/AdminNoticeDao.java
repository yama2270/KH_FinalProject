package com.kh.klibrary.admin.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.faq.model.vo.Attachment;

public interface AdminNoticeDao {
	List<Notice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerpage);
	int selectNoticeCount(SqlSessionTemplate session);
	int insertNotice(SqlSessionTemplate session, Notice notice);
	Notice selectNoticeView(SqlSessionTemplate session,int noticeNo);
	int deleteNotice(SqlSessionTemplate session, int noticeNo);
}