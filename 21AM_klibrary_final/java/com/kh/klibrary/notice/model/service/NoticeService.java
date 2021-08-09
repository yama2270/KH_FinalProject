package com.kh.klibrary.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.studyroom.model.vo.StudyRoomA;
import com.kh.klibrary.studyroom.model.vo.StudyRoomB;
import com.kh.klibrary.studyroom.model.vo.StudyRoomBooKing;
import com.kh.klibrary.studyroom.model.vo.StudyRoomC;
import com.kh.klibrary.studyroom.model.vo.StudyRoomD;

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
	int redingroombooking(Map param);
	List<StudyRoomBooKing> selectreding(String userid);
	List<StudyRoomA> selectareding(String userid);
	List<StudyRoomB> selectbreding(String userid);
	List<StudyRoomC> selectcreding(String userid);
	List<StudyRoomD> selectdreding(String userid);
	List<StudyRoomBooKing> redingaroom(String seatno);
	
	List<StudyRoomB> redingroomB();
	int totalDataB();
	int usetotalB();
	int AvailableB();
	int cannotusedB();
	StudyRoomB redingBroom(String seatno);
	
	List<StudyRoomC> redingroomC();
	int totalDataC();
	int usetotalC();
	int AvailableC();
	int cannotusedC();
	StudyRoomC redingCroom(String seatno);

	List<StudyRoomD> redingroomD();
	int totalDataD();
	int usetotalD();
	int AvailableD();
	int cannotusedD();
	StudyRoomD redingDroom(String seatno);
	
	List<Notice> findRecentNotices();
}