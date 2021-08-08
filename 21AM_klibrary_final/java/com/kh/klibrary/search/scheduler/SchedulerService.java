package com.kh.klibrary.search.scheduler;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.klibrary.admin.studyroom.model.dao.AdminStudyroomDao;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.search.dao.SearchDao;


@Component
public class SchedulerService {

	
	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	private SearchDao dao;
	
	@Autowired
	private AdminStudyroomDao dao2;
	
@Scheduled(cron="*/100 * * * * *") 
public void scheduleRun() {
	if(dao!=null) {
		List<Booking> bookList = dao.selectPassedDate(session);
		System.out.println(bookList);
		if(bookList!= null&& bookList.size()!=0) {
			 for(int i=0; i<bookList.size();i++) { 
			
				 if(bookList.get(i)!=null) {
				   int insertResult=dao.insertBookingHistory(session, bookList.get(i));
				   int deleteResult=dao.deleteBookNo(session, bookList.get(i).getBookNo());
					/* int deleteResult2=dao.deleteBookNo2(session, bookNoList.get(i)); */
				   int updateResult=dao.updateBookNo(session, bookList.get(i).getBookNo());
				   System.out.println("insertResult="+insertResult+"deleteResult"+deleteResult+"updateResult="+updateResult);
				 }
				   
			 }
		}
	}
	
}
	
	
}
