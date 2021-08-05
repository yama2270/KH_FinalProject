package com.kh.klibrary.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.studyroom.model.vo.StudyRoomA;

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
	

}