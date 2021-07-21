package com.kh.klibrary.member.model.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.common.PageFactory;
import com.kh.klibrary.member.model.service.MemberService;
import com.kh.klibrary.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//dg
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
	}
	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m, Model model) {
		
		int result=service.insertMember(m);
		model.addAttribute("msg", result>0?"회원가입성공":"회원가입실패");
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin() {
		
		return "member/memberLogin";
	}
	
	@RequestMapping("/member/memberLoginCheck.do")
	public String memberLogin(@RequestParam Map param, HttpSession session, Model model) {
		
		Member m = service.selectMember1(param);
		if(m!=null) {
			model.addAttribute("loginMember", m);
		}
		model.addAttribute("msg", m!=null?"로그인성공":"로그인실패");
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(HttpSession session, SessionStatus ss) {
		if(session!=null) session.invalidate();
		if(!ss.isComplete()) {
			ss.setComplete();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/member/memberIdFind.do")
	public String memberIdFindView() {
		
		return "member/memberIdFind";
	}
	
	@RequestMapping("/member/memberPwFind.do")
	public String memberPwFindView() {
		
		return "member/memberPwFind";
	}
	
	//cg
	//임시 로그인 테스트 -cg-
	@RequestMapping("/member/memberTestLogin.do")
	public String memberTestLogin(Model model) {
		String userId = "test" ;
		String userPassword ="test" ;
		
		Map m1 = new HashMap();
		m1.put("userId", "test");
		m1.put("userPassword", "test");
		
		String msg="로그인 실패";
		Member m = service.selectMember(m1);
		if(m!=null) {
			model.addAttribute("loginMember", m);
			msg="로그인 성공";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/");
		return "common/msg";
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
	
	@RequestMapping("/member/memberPwck.do")
	public String memberPwck(@RequestParam String password,@ModelAttribute("loginMember") Member m, Model model) {
		String msg="비밀번호가 확인되었습니다.";
		String loc="/member/memberInfoUpdate.do";
		if(!password.equals(m.getUserPassword())) {
			msg="비밀번호가 일치하지 않습니다.";
			loc="/member/memberInfo.do";
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}else{
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}
		
		return "common/msg";
	}
	
	
	@RequestMapping("/member/memberInfo.do")
	public String memberInfo() {
		return "member/memberInfo";
	}
	
	@RequestMapping("/member/memberBorrowing.do")
	public ModelAndView borrowing(ModelAndView mv, @ModelAttribute("loginMember") Member m,
								 @RequestParam(value="cPage", defaultValue="1") int cPage,
								 @RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		mv.addObject("list", service.selectLendingList(m.getUserId(), cPage, numPerpage));
		int totalData=service.selectLendingCount(m.getUserId());
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage,"memberBorrowing.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("member/memberBorrowing");
		return mv;
	}
	
	@RequestMapping("/member/memberBorrowed.do")
	public ModelAndView borrowed(ModelAndView mv, @ModelAttribute("loginMember") Member m,
								@RequestParam(value="cPage", defaultValue="1") int cPage,
								@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		mv.addObject("list", service.selectLHList(m.getUserId(), cPage, numPerpage));
		int totalData=service.selectLHCount(m.getUserId());
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage,"memberBorrowed.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("member/memberBorrowed");
		return mv;
	}
	
	@RequestMapping("/member/memberBorrowedDate.do")
	public ModelAndView borrowedDate(ModelAndView mv, @ModelAttribute("loginMember") Member m,
									@RequestParam Date inputDate1, @RequestParam Date inputDate2,
									@RequestParam(value="cPage", defaultValue="1") int cPage,
									@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		System.out.println(inputDate1);
		System.out.println(inputDate2);
		Map m1 = new HashMap();
		m1.put("userId", m.getUserId());
		m1.put("Date1", inputDate1);
		m1.put("Date2", inputDate2);
		mv.addObject("Date1",inputDate1);
		mv.addObject("Date2",inputDate2);
		mv.addObject("list", service.selectDate(m1, cPage, numPerpage));
		int totalData=service.selectDateCount(m1);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage,"memberBorrowed.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("member/memberBorrowed");
		return mv;
	}
	
	@RequestMapping("/member/memberBooking.do")
	public ModelAndView Booking(ModelAndView mv, @ModelAttribute("loginMember") Member m,
								@RequestParam(value="cPage", defaultValue="1") int cPage,
								@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		mv.addObject("list", service.selectBookingList(m.getUserId(), cPage, numPerpage));
		int totalData=service.selectBookingCount(m.getUserId());
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage,"memberBooking.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("member/memberBooking");
		return mv;
	}
	
	@RequestMapping("/member/cancelBooking.do")
	public String cancelBooking(@ModelAttribute("loginMember") Member m, @RequestParam String bookNo, Model model) {
		Map m1= new HashMap();
		m1.put("userId", m.getUserId());
		m1.put("bookNo", bookNo);
		int result= service.cancelBooking(m1);
		String msg="예약취소를 실패하었습니다.";
		String loc="/member/memberBooking.do";
		
		if(result>0) {
			msg="예약을 취소하였습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberInfoUpdate.do")
	public String memberInfoUpdate() {
		return "member/memberInfoUpdate";
	}
	@RequestMapping("/member/memberInfoUpdateEnd.do")
	public String memberInfoUpdateEnd(Member m, HttpSession session, SessionStatus ss, Model model) {
		int result=service.updateMember(m); //회원정보 수정
		
		String msg="회원정보 수정에 실패하였습니다.";
		String loc="/";
		
		Map map = new HashMap();  
		map.put("userId", m.getUserId());
		map.put("userPassword", m.getUserPassword());
		Member mt=service.selectMember(map); //수정된 회원정보
		
		if(result>0) {
			if(mt!=null) {
				model.addAttribute("loginMember", mt); //수정된 회원정보로 세션 재생성
			}
			msg="회원정보가 수정되었습니다.";
			loc="/member/memberInfo.do";
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}
		return "common/msg";
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
	public ModelAndView memberBookMark(ModelAndView mv, @ModelAttribute("loginMember") Member m,
									  @RequestParam(value="cPage", defaultValue="1") int cPage,
									  @RequestParam(value="numPerPage", defaultValue="5") int numPerpage) {
		System.out.println(m.getUserId());
		mv.addObject("list",service.selectBookMarkList(m.getUserId(), cPage, numPerpage));
		int totalData=service.selectBookMarkCount(m.getUserId());
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage,"memberBookMark.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("member/memberBookMark");
		return mv;
	}
	
	@RequestMapping("/member/cancelMark.do")
	public String cancelMark(@ModelAttribute("loginMember") Member m, @RequestParam String isbnNo, Model model) {
		Map m1= new HashMap();
		m1.put("userId", m.getUserId());
		m1.put("isbnNo", isbnNo);
		int result= service.cancelMark(m1);
		String msg="관심도서 취소를 실패하었습니다.";
		String loc="/member/memberBookMark.do";
		
		if(result>0) {
			msg="관심도서를 취소하였습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
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
