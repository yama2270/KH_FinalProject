package com.kh.klibrary.admin.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.admin.notice.model.vo.Attachment;
@Repository
public class AdminNoticeDaoImpl implements AdminNoticeDao{
	
@Override
	public List<Notice> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("notice.selectNoticeList",null,
				new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

@Override
public int selectNoticeCount(SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	return session.selectOne("board.selectBoardCount");
}
@Override
public int insertNotice(SqlSessionTemplate session, Notice n) {
	// TODO Auto-generated method stub
	return session.insert("notice.insertNotice",n);
}

@Override
public int insertAttachment(SqlSessionTemplate session, Attachment a) {
	// TODO Auto-generated method stub
	return session.insert("board.insertAttachment",a);
}
@Override
public Notice selectNoticeView(SqlSessionTemplate session, int no) {
	// TODO Auto-generated method stub
	return session.selectOne("notice.selectNoticeView", no);
}
}
