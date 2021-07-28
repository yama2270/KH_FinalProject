package com.kh.klibrary.common.listener;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.FrameworkServlet;

import com.kh.klibrary.member.model.service.MemberServiceImpl;

public class VisitCountListener implements HttpSessionListener {
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
		
		// Today Format
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		
		// today 형변환 
		String today = date.format(new Date());
		
		
		// service 객체 가져오기 
		HttpSession session = se.getSession();
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext(), FrameworkServlet.SERVLET_CONTEXT_PREFIX+"appServlet");
		MemberServiceImpl service = (MemberServiceImpl)wac.getBean("memberServiceImpl");
		
		System.out.println(service.countUser(today)>0?"방문자 등록 성공":"방문자 등록 실패");
		
	}
	
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}
	
}
