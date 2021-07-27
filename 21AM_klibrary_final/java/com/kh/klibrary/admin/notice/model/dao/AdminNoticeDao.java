package com.kh.klibrary.admin.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.faq.model.vo.Attachment;
import com.kh.klibrary.qna.model.vo.Qna;

public interface AdminNoticeDao {
	List<Notice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerpage);
	int insertNotice(SqlSessionTemplate session, Notice notice);
	Notice selectNoticeView(SqlSessionTemplate session,int noticeNo);
	int deleteNotice(SqlSessionTemplate session, String noticeNo);
	int noticeUpdate(SqlSessionTemplate session, Notice notice);

	int selectNoticeCount(SqlSessionTemplate session);
	
	//조회수증가
	int updateNoticeCount(SqlSessionTemplate session, int noticeNo);
	
	//공지사항 검색
	List<Notice> searchNoticeTitle(SqlSessionTemplate session, String keyWord);
	List<Notice> searchNoticeContent(SqlSessionTemplate session, String keyWord);

	
}
