package com.kh.klibrary.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.studyroom.model.vo.StudyRoomA;
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

	

	

	
	
	
	
	
	
	

	

	

	
	
	

}