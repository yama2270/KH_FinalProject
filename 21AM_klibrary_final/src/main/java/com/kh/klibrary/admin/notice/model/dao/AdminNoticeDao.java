package com.kh.klibrary.admin.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.notice.model.vo.Attachment;
import com.kh.klibrary.admin.notice.model.vo.Notice;

public interface AdminNoticeDao {
	List<Notice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerpage);
	int selectNoticeCount(SqlSessionTemplate session);
	int insertNotice(SqlSessionTemplate session, Notice n);
	int insertAttachment(SqlSessionTemplate session, Attachment a);
	Notice selectNoticeView(SqlSessionTemplate session,int no);
}
