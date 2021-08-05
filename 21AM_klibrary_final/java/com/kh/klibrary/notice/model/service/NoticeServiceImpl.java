package com.kh.klibrary.notice.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.notice.model.dao.NoticeDao;
import com.kh.klibrary.studyroom.model.vo.StudyRoomA;
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private NoticeDao dao;
	
	@Override
	public List<Notice> selectNoticeList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectNoticeList(session,cPage,numPerpage);
	}

	@Override
	public int selectNoticeCount() {
		// TODO Auto-generated method stub
		return dao.selectNoticeCount(session);
	}

	@Override
	public Notice selectNoticeView(int no) {
		// TODO Auto-generated method stub
		return dao.selectNoticeView(session,no);
	}

	@Override
	public List<Notice> searchnotice(Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.searchnotice(session, param,cPage,numPerpage);
	}

	@Override
	public int totalsearchnotice(Map param) {
		// TODO Auto-generated method stub
		return dao.totalsearchnotice(session,param);
	}

	@Override
	public int totalData() {
		// TODO Auto-generated method stub
		return dao.totalData(session);
	}

	@Override
	public int usetotal() {
		// TODO Auto-generated method stub
		return dao.usetotal(session);
	}

	@Override
	public int Available() {
		// TODO Auto-generated method stub
		return dao.Available(session);
	}

	@Override
	public int cannotused() {
		// TODO Auto-generated method stub
		return dao.cannotused(session);
	}

	@Override
	public List<StudyRoomA> redingroomA() {
		// TODO Auto-generated method stub
		return dao.redingroomA(session);
	}

	@Override
	public StudyRoomA redingroom(String seatno) {
		// TODO Auto-generated method stub
		return dao.redingroom(session,seatno);
	}

	@Override
	public int redingroombooking(Map param) {
		// TODO Auto-generated method stub
		return dao.redingroombooking(session,param);
	}
	
	
	

	

	
	
	
	
	
	


	

	
	
	

}
