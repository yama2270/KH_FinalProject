package com.kh.klibrary.admin.notice.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.klibrary.admin.notice.model.service.AdminNoticeService;


@Controller
public class AdminNoticeController {
	//@Autowired
	//private AdminNoticeService service;

	@RequestMapping("/admin/notice/noticeList.do")
	public String noticeList() {
		return "admin/notice/noticeList";
	}
	
	@RequestMapping("/admin/notice/noticeInsert.do")
	public String noticeInsert() {
		return "admin/notice/noticeInsert";
	}
	
	
}
 