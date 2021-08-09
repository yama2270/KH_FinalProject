package com.kh.klibrary.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.studyroom.model.vo.StudyRoomA;
import com.kh.klibrary.studyroom.model.vo.StudyRoomB;
import com.kh.klibrary.studyroom.model.vo.StudyRoomBooKing;
import com.kh.klibrary.studyroom.model.vo.StudyRoomC;
import com.kh.klibrary.studyroom.model.vo.StudyRoomD;

public interface NoticeDao {

	List<Notice> selectNoticeList(SqlSessionTemplate session,int cPage,int numPerpage);
	int selectNoticeCount(SqlSessionTemplate session);
	Notice selectNoticeView(SqlSessionTemplate session,int no);
	List<Notice> searchnotice(SqlSessionTemplate session, Map param, int cPage, int numPerpage);
	int totalsearchnotice(SqlSessionTemplate session,Map param);
	int totalData(SqlSessionTemplate session);
	int usetotal(SqlSessionTemplate session);
	int Available(SqlSessionTemplate session);
	int cannotused(SqlSessionTemplate session);
	List<StudyRoomA> redingroomA(SqlSessionTemplate session);
	StudyRoomA redingroom(SqlSessionTemplate session,String seatno);
	int redingroombooking(SqlSessionTemplate session,Map param);
	List<StudyRoomBooKing> selectreding(SqlSessionTemplate session,String userid);
	List<StudyRoomA> selectareding(SqlSessionTemplate session,String userid);
	List<StudyRoomB> selectbreding(SqlSessionTemplate session,String userid);
	List<StudyRoomC> selectcreding(SqlSessionTemplate session,String userid);
	List<StudyRoomD> selectdreding(SqlSessionTemplate session,String userid);
	List<StudyRoomBooKing> redingaroom(SqlSessionTemplate session,String seatno);

	
	List<StudyRoomB> redingroomB(SqlSessionTemplate session);
	int totalDataB(SqlSessionTemplate session);
	int usetotalB(SqlSessionTemplate session);
	int AvailableB(SqlSessionTemplate session);
	int cannotusedB(SqlSessionTemplate session);
	StudyRoomB redingBroom(SqlSessionTemplate session,String seatno);
	

	
	List<StudyRoomC> redingroomC(SqlSessionTemplate session);
	int totalDataC(SqlSessionTemplate session);
	int usetotalC(SqlSessionTemplate session);
	int AvailableC(SqlSessionTemplate session);
	int cannotusedC(SqlSessionTemplate session);
	StudyRoomC redingCroom(SqlSessionTemplate session,String seatno);

	
	
	
	List<StudyRoomD> redingroomD(SqlSessionTemplate session);
	int totalDataD(SqlSessionTemplate session);
	int usetotalD(SqlSessionTemplate session);
	int AvailableD(SqlSessionTemplate session);
	int cannotusedD(SqlSessionTemplate session);
	StudyRoomD redingDroom(SqlSessionTemplate session,String seatno);
	
	List<Notice> findRecentNotices(SqlSessionTemplate session);
}