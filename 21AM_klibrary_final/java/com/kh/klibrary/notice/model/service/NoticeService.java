package com.kh.klibrary.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.studyroom.model.vo.StudyRoomA;

public interface NoticeService {
	
	List<Notice> selectNoticeList(int cPage,int numPerpage);
	int selectNoticeCount();
	Notice selectNoticeView(int no);
	List<Notice> searchnotice(Map param,int cPage,int numPerpage);
	int totalsearchnotice(Map param);
	List<StudyRoomA> redingroomA();
	int totalData();
	int usetotal();
	int Available();
	int cannotused();
	StudyRoomA redingroom(String seatno);
	

}