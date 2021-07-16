package com.kh.klibrary.admin.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMemberController {
	
	// 회원상세
	@RequestMapping("/admin/member/memberDetail.do")
	public String memberDetail() {
		return "admin/member/memberDetail";
	}
	
	// 회원리스트 
	@RequestMapping("/admin/member/memberList.do")
	public String memberList() {
		return "admin/member/memberList";
	}
	
	// 회원탈퇴리스트 
	@RequestMapping("/admin/member/memberWithdraw.do")
	public String memberWithdraw() {
		return "admin/member/memberWithdraw";
	}
	
}
