package com.kh.klibrary.admin.notice.model.service;

import java.util.List;

import com.kh.klibrary.admin.notice.model.vo.Notice;

public interface AdminNoticeService {
	List<Notice> selectNoticeList(int cPage, int numPerpage);
	int selectNoticeCount();
	int insertNotice(Notice n);
	Notice selectNoticeView(int noticeNo);
	int deleteNotice(int noticeNo);
}
