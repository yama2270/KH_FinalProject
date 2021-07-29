package com.kh.klibrary.search.scheduler;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.kh.klibrary.search.dao.SearchDao;


@Component
public class SchedulerService {

	
	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	private SearchDao dao;
	
@Scheduled(cron="*/100 * * * * *") 
public void scheduleRun() {
	if(dao!=null) {
		List<String> bookNoList = dao.selectPassedDate(session);
		if(bookNoList!= null) {
			 for(int i=0; i<bookNoList.size();i++) { 
			   int deleteResult=dao.deleteBookNo(session, bookNoList.get(i));
				/* int deleteResult2=dao.deleteBookNo2(session, bookNoList.get(i)); */
			   int updateResult=dao.updateBookNo(session, bookNoList.get(i));
			   System.out.println("result1="+deleteResult+"updateResult="+updateResult);
			   
			 }
		}
	}
	
	
	
	
}
	
	
}
