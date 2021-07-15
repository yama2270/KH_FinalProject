package com.kh.klibrary.admin.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMemberController {
	
	@RequestMapping("/admin/member/memberDetail.do")
	public String memberDetail() {
		return "admin/member/memberDetail";
	}
	
	@RequestMapping("/admin/member/memberList.do")
	public String memberList() {
		return "admin/member/memberList";
	}
	
}
