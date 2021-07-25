package com.kh.klibrary.admin.notice.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.klibrary.admin.notice.model.dao.AdminNoticeDao;
import com.kh.klibrary.admin.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
@Slf4j
public class AdminNoticeServiceImpl implements AdminNoticeService {
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private AdminNoticeDao dao;
	
	@Override
	public List<Notice> selectNoticeList(int cPage, int numPerpage) {
		return dao.selectNoticeList(session, cPage, numPerpage);
	}
	

	@Override
	public int insertNotice(Notice notice) throws RuntimeException{
		int result=dao.insertNotice(session,  notice);
		return result;
		
	}
	
	//notice 보기  
	@Override
	public Notice selectNoticeView(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.selectNoticeView(session, noticeNo);
	}


	@Override
	public int noticeUpdate(Notice notice) {
		// TODO Auto-generated method stub
		return dao.noticeUpdate(session, notice);
	}

	@Override
	public int noticeCount(int noticeNo) {
		return dao.noticeCount(session, noticeNo);
	}


	@Override
	public int deleteNotice(String noticeNo) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(session, noticeNo);
	}


	
	
	/*
	 * @Override public int noticeMultiDelete(int[] noList) { return
	 * dao.noticeMultiDelete(session, noList); }
	 */
	
}
