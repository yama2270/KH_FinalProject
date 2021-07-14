//package com.kh.klibrary.notice.service;
//
//import java.util.List;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.kh.klibrary.notice.dao.NoticeDao;
//import com.kh.klibrary.notice.vo.Notice;
//@Service
//public class NoticeServiceImpl implements NoticeService {
//
//	@Autowired
//	private SqlSessionTemplate session;
//	
//	@Autowired
//	private NoticeDao dao;
//	
//	@Override
//	public List<Notice> selectNoticeList(int cPage, int numPerpage) {
//		// TODO Auto-generated method stub
//		return dao.selectNoticeList(session,cPage,numPerpage);
//	}
//
//	@Override
//	public int selectNoticeCount() {
//		// TODO Auto-generated method stub
//		return dao.selectNoticeCount(session);
//	}
//
//}
