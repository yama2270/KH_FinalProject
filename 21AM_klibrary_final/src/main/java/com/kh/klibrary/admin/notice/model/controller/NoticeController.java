package com.kh.klibrary.admin.notice.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@RequestMapping("/admin/notice/noticeMain.do")
	public String noticeMain() {
		return "admin/notice/noticeMain";
	}
	
	@RequestMapping("/admin/notice/noticeDetail.do")
	public String noticeDetail() {
		return "admin/notice/noticeMain";
	}
	
	
}
