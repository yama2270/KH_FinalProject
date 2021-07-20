package com.kh.klibrary.notice.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.notice.model.dao.NoticeDao;
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
	public List<Notice> searchnotice(String text) {
		// TODO Auto-generated method stub
		return dao.searchnotice(session,text);
	}

	@Override
	public List<Notice> searchnoticecontent(String text) {
		// TODO Auto-generated method stub
		return dao.searchnoticecontent(session,text);
	}
	
	
	
	


	

	
	
	

}
