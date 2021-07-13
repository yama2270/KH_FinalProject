package com.finalproject.spring.member.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
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
