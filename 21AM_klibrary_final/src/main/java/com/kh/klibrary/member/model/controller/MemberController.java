package com.kh.klibrary.member.model.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.klibrary.member.model.service.MemberTService;
import com.kh.klibrary.member.model.vo.MemberT;

@Controller
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberTService service;
	
	//임시 로그인 테스트 -cg-
	@RequestMapping("/member/memberTestLogin.do")
	public String memberTestLogin(Model model) {
		String userId = "test" ;
		String userPassword ="test" ;
		
		Map m1 = new HashMap();
		m1.put("userId", "test");
		m1.put("userPassword", "test");
		
		String msg="로그인 실패";
		MemberT mt = service.selectMember(m1);
		if(mt!=null) {
			model.addAttribute("loginMember", mt);
			msg="로그인 성공";
			System.out.println("로그인 성공 : " + mt.toString() );
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/");
		return "member/memberInfo";
	}
	//임시 로그아웃 테스트 -cg-
	@RequestMapping("/member/memberTestlogout.do")
	public String logout(HttpSession session, SessionStatus ss) {
		if(session!=null) session.invalidate();
		if(!ss.isComplete()) {
			ss.setComplete();
		}
		return "redirect:/";
	}
	
	
	@RequestMapping("/member/memberInfo.do")
	public String memberInfo() {
		return "member/memberInfo";
	}
	
	@RequestMapping("/member/memberBorrowing.do")
	public String borrowing() {
		return "member/memberBorrowing";
	}
	
	@RequestMapping("/member/memberBorrowed.do")
	public String borrowed() {
		return "member/memberBorrowed";
	}
	
	@RequestMapping("/member/memberBooking.do")
	public String Booking() {
		return "member/memberBooking";
	}
	
	@RequestMapping("/member/memberInfoUpdate.do")
	public String memberInfoUpdate() {
		return "member/memberInfoUpdate";
	}
	
	@RequestMapping("/member/memberHopeBook.do")
	public String memberHopeBook() {
		return "member/memberHopeBook";
	}
	
	@RequestMapping("/member/memberHopeBookRecord.do")
	public String memberHopeBookRecord() {
		return "member/memberHopeBookRecord";
	}
	
	@RequestMapping("/member/memberBookMark.do")
	public String memberBookMark() {
		return "member/memberBookMark";
	}
	
	@RequestMapping("/member/memberReadingRoom.do")
	public String memberReadingRoom() {
		return "member/memberReadingRoom";
	}
	
	@RequestMapping("/member/membershipCard.do")
	public String membershipCard() {
		return "member/membershipCard";
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete() {
		return "member/memberDelete";
	}
	
	@RequestMapping("/member/memberTest.do")
	public String memberTest() {
		return "member/memberTest";
	}
	
}
