package com.kh.klibrary.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.admin.notice.model.vo.Notice;

public interface NoticeService {
	
	List<Notice> selectNoticeList(int cPage,int numPerpage);
	int selectNoticeCount();
	Notice selectNoticeView(int no);
	List<Notice> searchnotice(Map param,int cPage,int numPerpage);
	int totalsearchnotice(Map param);
	

}