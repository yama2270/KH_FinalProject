package com.kh.klibrary.admin.notice.model.service;

import java.util.List;

import com.kh.klibrary.admin.notice.model.vo.Notice;


public interface AdminNoticeService {
	List<Notice> selectNoticeList(int cPage, int numPerpage);
	
	
	//게시글 추가
	int insertNotice(Notice notice);
	
	//게시글 보기
	Notice selectNoticeView(int noticeNo);
	
	//게시글삭제
	int deleteNotice(String noticeNo);
	
	//게시글 수정
	int noticeUpdate(Notice notice);

	int selectNoticeCount();

	//공지사항 검색
	List<Notice> searchNoticeTitle(String keyWord);
	List<Notice> searchNoticeContent(String keyWord);

	
	
}
