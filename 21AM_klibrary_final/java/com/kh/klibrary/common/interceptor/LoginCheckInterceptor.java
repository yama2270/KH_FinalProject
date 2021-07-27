package com.kh.klibrary.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.klibrary.member.model.vo.Member;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Member login=(Member)request.getSession().getAttribute("loginMember");
		if(login==null) {
			request.setAttribute("msg", "로그인후 이용이 가능합니다.");
			String referer = request.getHeader("Referer");
			request.setAttribute("loc", referer);
			request.getRequestDispatcher("/WEB-INF/views/common/msg2.jsp").forward(request, response);
			return false;
		}
		return super.preHandle(request, response, handler);
	}

	
	
	
}
