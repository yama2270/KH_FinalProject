package com.kh.klibrary.admin.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.common.AdminPagingTemplate;
import com.kh.klibrary.admin.member.service.AdminMemberService;
import com.kh.klibrary.admin.member.vo.AdminMember;
import com.kh.klibrary.common.PageFactory;

@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService service;
	
	// 회원상세
	@RequestMapping("/admin/member/memberDetail.do")
	public String memberDetail() {
		return "admin/member/memberDetail";
	}
	
	// 회원리스트 
	@RequestMapping("/admin/member/memberList.do")
	public ModelAndView memberList(@RequestParam(value="cPage", defaultValue="1") int cPage, 
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage,
			ModelAndView mv) {
		mv.addObject("list",service.selectMemberList(cPage,numPerpage));
		int totalData=service.selectMemberCount();
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "memberList.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("admin/member/memberList");
		
		return mv;
	}
	
	//회원검색
	@RequestMapping("/admin/member/SearchMember.do")
	public ModelAndView searchMember(@RequestParam Map param,
			@RequestParam(required=false,defaultValue="1") int cPage,
			@RequestParam(required=false,defaultValue="10") int numPerpage,
			ModelAndView mv) {
		
		List<AdminMember> list=service.searchMember(param,cPage,numPerpage);
		
		int totalData=service.totalsearchMember(param);
		
		String pageBar=new AdminPagingTemplate().searchKeyPagingTemplate(cPage, numPerpage, totalData);
		
		mv.addObject("list",list);
		mv.addObject("pageBar",pageBar);
		mv.addObject("param",param);
		mv.setViewName("admin/member/memberList");
		return mv;
		
	}
	
	
	// 회원탈퇴리스트 
	@RequestMapping("/admin/member/memberWithdraw.do")
	public String memberWithdraw() {
		return "admin/member/memberWithdraw";
	}
	
}
