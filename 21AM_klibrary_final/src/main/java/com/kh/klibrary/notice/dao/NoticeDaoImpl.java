//package com.kh.klibrary.notice.dao;
//
//import java.util.List;
//
//import org.apache.ibatis.session.RowBounds;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.stereotype.Repository;
//
//import com.kh.klibrary.notice.vo.Notice;
//@Repository
//public class NoticeDaoImpl implements NoticeDao {
//
//	@Override
//	public List<Notice> selectNoticeList(SqlSessionTemplate session, int numPerpage, int cPage) {
//		// TODO Auto-generated method stub
//		return session.selectList("Notice.selectNoticeList",null,new RowBounds(((cPage-1)*numPerpage),numPerpage));
//	}
//
//	@Override
//	public int selectNoticeCount(SqlSessionTemplate session) {
//		// TODO Auto-generated method stub
//		return session.selectOne("Notice.selectNoticeCount");
//	}
//
//}
