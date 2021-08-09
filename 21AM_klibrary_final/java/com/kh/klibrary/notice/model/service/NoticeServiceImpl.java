package com.kh.klibrary.notice.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.notice.model.dao.NoticeDao;
import com.kh.klibrary.studyroom.model.vo.StudyRoomA;
import com.kh.klibrary.studyroom.model.vo.StudyRoomB;
import com.kh.klibrary.studyroom.model.vo.StudyRoomBooKing;
import com.kh.klibrary.studyroom.model.vo.StudyRoomC;
import com.kh.klibrary.studyroom.model.vo.StudyRoomD;
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

	@Override
	public List<StudyRoomBooKing> selectreding(String userid) {
		// TODO Auto-generated method stub
		return dao.selectreding(session,userid);
	}

	@Override
	public List<StudyRoomA> selectareding(String userid) {
		// TODO Auto-generated method stub
		return dao.selectareding(session,userid);
	}
	
	@Override
	public List<StudyRoomBooKing> redingaroom(String seatno) {
		// TODO Auto-generated method stub
		return dao.redingaroom(session,seatno);
	}

	
	
	
	
	
	
	
	
	

	@Override
	public List<StudyRoomB> selectbreding(String userid) {
		// TODO Auto-generated method stub
		return dao.selectbreding(session,userid);
	}

	@Override
	public StudyRoomB redingBroom(String seatno) {
		// TODO Auto-generated method stub
		return dao.redingBroom(session,seatno);
	}
	
	
	
	
	
	

	@Override
	public List<StudyRoomC> selectcreding(String userid) {
		// TODO Auto-generated method stub
		return dao.selectcreding(session,userid);
	}
	

	@Override
	public StudyRoomC redingCroom(String seatno) {
		// TODO Auto-generated method stub
		return dao.redingCroom(session,seatno);
	}

	@Override
	public List<StudyRoomD> selectdreding(String userid) {
		// TODO Auto-generated method stub
		return dao.selectdreding(session,userid);
	}
	
	@Override
	public StudyRoomD redingDroom(String seatno) {
		// TODO Auto-generated method stub
		return dao.redingDroom(session,seatno);
	}
	
	
	
	

	@Override
	public List<StudyRoomB> redingroomB() {
		// TODO Auto-generated method stub
		return dao.redingroomB(session);
	}

	@Override
	public int totalDataB() {
		// TODO Auto-generated method stub
		return dao.totalDataB(session);
	}

	@Override
	public int usetotalB() {
		// TODO Auto-generated method stub
		return dao.usetotalB(session);
	}

	@Override
	public int AvailableB() {
		// TODO Auto-generated method stub
		return dao.AvailableB(session);
	}

	@Override
	public int cannotusedB() {
		// TODO Auto-generated method stub
		return dao.cannotusedB(session);
	}

	
	
	
	
	@Override
	public List<StudyRoomC> redingroomC() {
		// TODO Auto-generated method stub
		return dao.redingroomC(session);
	}

	@Override
	public int totalDataC() {
		// TODO Auto-generated method stub
		return dao.totalDataC(session);
	}

	@Override
	public int usetotalC() {
		// TODO Auto-generated method stub
		return dao.usetotalC(session);
	}

	@Override
	public int AvailableC() {
		// TODO Auto-generated method stub
		return dao.AvailableC(session);
	}

	@Override
	public int cannotusedC() {
		// TODO Auto-generated method stub
		return dao.cannotusedC(session);
	}

	
	
	
	
	
	@Override
	public List<StudyRoomD> redingroomD() {
		// TODO Auto-generated method stub
		return dao.redingroomD(session);
	}

	@Override
	public int totalDataD() {
		// TODO Auto-generated method stub
		return dao.totalDataD(session);
	}

	@Override
	public int usetotalD() {
		// TODO Auto-generated method stub
		return dao.usetotalD(session);
	}

	@Override
	public int AvailableD() {
		// TODO Auto-generated method stub
		return dao.AvailableD(session);
	}

	@Override
	public int cannotusedD() {
		// TODO Auto-generated method stub
		return dao.cannotusedD(session);
	}

	@Override
	public List<Notice> findRecentNotices() {
		
		return dao.findRecentNotices(session);
	}

	
	
	

	

	
	
	
	

	

	
	
	
	
	
	


	

	
	
	

}
