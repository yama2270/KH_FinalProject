package com.kh.klibrary.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.studyroom.model.vo.StudyRoomA;
import com.kh.klibrary.studyroom.model.vo.StudyRoomB;
import com.kh.klibrary.studyroom.model.vo.StudyRoomBooKing;
import com.kh.klibrary.studyroom.model.vo.StudyRoomC;
import com.kh.klibrary.studyroom.model.vo.StudyRoomD;
@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<Notice> selectNoticeList(SqlSessionTemplate session,int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("notice.selectNoticeList",null,new RowBounds(((cPage-1)*numPerpage),numPerpage));
	}

	@Override
	public int selectNoticeCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.selectNoticeCount");
	}

	@Override
	public Notice selectNoticeView(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.selectNoticeView",no);
	}

	@Override
	public List<Notice> searchnotice(SqlSessionTemplate session, Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		int first=(cPage-1)*numPerpage;
		return session.selectList("notice.searchnotice",param,new RowBounds(first,numPerpage));
		//return session.selectList("notice.searchnotice",param);
	}

	@Override
	public int totalsearchnotice(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.totalsearchnotice",param);
	}

	@Override
	public int totalData(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.totalData");
	}

	@Override
	public int usetotal(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.usetotal");
	}

	@Override
	public int Available(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.Available");
	}

	@Override
	public int cannotused(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.cannotused");
	}

	@Override
	public List<StudyRoomA> redingroomA(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("redingroomA.redingroomA");
	}

	@Override
	public StudyRoomA redingroom(SqlSessionTemplate session, String seatno) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.redingroom",seatno);
	}

	@Override
	public int redingroombooking(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("redingroomA.redingroombooking",param);
	}

	@Override
	public List<StudyRoomBooKing> selectreding(SqlSessionTemplate session, String userid) {
		// TODO Auto-generated method stub
		return session.selectList("redingroomA.selectreding",userid);
	}

	@Override
	public List<StudyRoomA> selectareding(SqlSessionTemplate session, String userid) {
		// TODO Auto-generated method stub
		return session.selectList("redingroomA.selectareding",userid);
	}
	
	@Override
	public List<StudyRoomBooKing> redingaroom(SqlSessionTemplate session, String seatno) {
		// TODO Auto-generated method stub
		return session.selectList("redingroomA.redingaroom",seatno);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<StudyRoomB> selectbreding(SqlSessionTemplate session, String userid) {
		// TODO Auto-generated method stub
		return session.selectList("redingroomA.selectbreding",userid);
	}
	
	@Override
	public StudyRoomB redingBroom(SqlSessionTemplate session, String seatno) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.redingBroom",seatno);
	}
	
	
	
	
	
	
	
	
	
	

	@Override
	public List<StudyRoomC> selectcreding(SqlSessionTemplate session, String userid) {
		// TODO Auto-generated method stub
		return session.selectList("redingroomA.selectcreding",userid);
	}
	
	
	@Override
	public StudyRoomC redingCroom(SqlSessionTemplate session, String seatno) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.redingCroom",seatno);
	}

	
	
	
	
	
	
	
	
	
	@Override
	public List<StudyRoomD> selectdreding(SqlSessionTemplate session, String userid) {
		// TODO Auto-generated method stub
		return session.selectList("redingroomA.selectdreding",userid);
	}
	
	@Override
	public StudyRoomD redingDroom(SqlSessionTemplate session, String seatno) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.redingDroom",seatno);
	}
	
	
	
	
	
	
	
	
	

	@Override
	public List<StudyRoomB> redingroomB(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("redingroomA.redingroomB");
	}

	@Override
	public int totalDataB(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.totalDataB");
	}

	@Override
	public int usetotalB(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.usetotalB");
	}

	@Override
	public int AvailableB(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.AvailableB");
	}

	@Override
	public int cannotusedB(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.cannotusedB");
	}

	
	
	
	
	
	
	@Override
	public List<StudyRoomC> redingroomC(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("redingroomA.redingroomC");
	}

	@Override
	public int totalDataC(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.totalDataC");
	}

	@Override
	public int usetotalC(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.usetotalC");
	}

	@Override
	public int AvailableC(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.AvailableC");
	}

	@Override
	public int cannotusedC(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.cannotusedC");
	}

	@Override
	public List<StudyRoomD> redingroomD(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("redingroomA.redingroomD");
	}

	@Override
	public int totalDataD(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.totalDataD");
	}

	@Override
	public int usetotalD(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.usetotalD");
	}

	@Override
	public int AvailableD(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.AvailableD");
	}

	@Override
	public int cannotusedD(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("redingroomA.cannotusedD");
	}

	@Override
	public List<Notice> findRecentNotices(SqlSessionTemplate session) {
		
		return session.selectList("notice.findRecentNotice");
	}
	
	
	

	
	
	
	
	

	

	

	
	
	
	
	
	
	

	

	

	
	
	

}