package com.kh.klibrary.admin.notice.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.admin.notice.model.dao.AdminNoticeDao;
import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.admin.notice.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

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
	public int selectNoticeCount() {
		// TODO Auto-generated method stub
		return dao.selectNoticeCount(session);
	}

	

	@Override
	public int insertNotice(Notice n) throws RuntimeException{
		/*
		 * int result=dao.insertNotice(session, n); log.info("{}",n.getNoticeNo());
		 * if(result>0) { if(n.getAttachments()!=null&&n.getAttachments().size()>0) {
		 * for(Attachment a : n.getAttachments()) { try {
		 * a.setNoticeNo(n.getNoticeNo()); result=dao.insertAttachment(session,a);
		 * }catch(RuntimeException e){ throw new RuntimeException("작성실패"); } } } }
		 */
		return 0;
	}
	

	@Override
	public Notice selectNoticeView(int no) {
		// TODO Auto-generated method stub
		return dao.selectNoticeView(session, no);
	}
}
