package com.kh.klibrary.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("/notice/noticeList.do")
	public String noticeList() {
		return "notice/noticeList";
	}
	
	@RequestMapping("/notice/noticeEnd.do")
	public String noticeEnd() {
		return "notice/noticeEnd";
	}
	
	@RequestMapping("/notice/booktime.do")
	public String booktime() {
		return "/facilities/booktime";
	}
	@RequestMapping("/notice/copymachine.do")
	public String copymachine() {
		return "/facilities/copymachine";
	}
	
	
	@RequestMapping("/notice/redingroom.do")
	public String redingroom() {
		return "/redingroom/redingroom";
	}
	@RequestMapping("/notice/redingroomnotice.do")
	public String redingroomnotice() {
		return "/redingroom/redingroomnotice";
	}
	@RequestMapping("/notice/redingroomseat.do")
	public String redingroomseat() {
		return "/redingroom/redingroomseat";
	}
	

}

