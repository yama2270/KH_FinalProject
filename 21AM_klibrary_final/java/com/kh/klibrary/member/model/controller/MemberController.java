package com.kh.klibrary.member.model.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomBooking;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomHistory;
import com.kh.klibrary.common.PageFactory;
import com.kh.klibrary.member.model.service.MemberService;
import com.kh.klibrary.member.model.vo.Member;
import com.kh.klibrary.member.model.vo.MemberDrop;

@Controller
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//dg
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
	}
	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m, Model model) {
		
		m.setUserPassword(pwEncoder.encode(m.getUserPassword()));
		
		int result=service.insertMember(m);
		model.addAttribute("msg", result>0?"회원가입성공":"회원가입실패");
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@RequestMapping("/member/idCheck.do")
	@ResponseBody
	public int enrollIdCheck(Member m) throws Exception{
		
		int result = service.enrollIdCheck(m);
		
		return result;
	}
	
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin() {
		
		return "member/memberLogin";
	}
	
	@RequestMapping("/member/memberLoginCheck.do")
	public String memberLoginCheck(@RequestParam Map param, HttpSession session, Model model) {
		
		Member m = service.selectMember1(param);
		
		String msg="로그인 실패";
		String loc="/member/memberLogin.do";
		if(m!=null && pwEncoder.matches((String)param.get("userPassword"), m.getUserPassword())) {
			model.addAttribute("loginMember", m);
			msg = "로그인 성공";
			loc = "/";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
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
	public String memberIdFindView(@RequestParam Map param, HttpSession session, Model model) {
		
		return "member/memberIdFind";
	}
	
	@RequestMapping("/member/memberPwFind.do")
	public String memberPwFindView() {
		
		return "member/memberPwFind";
	}
	
	@RequestMapping("/member/memberIdCheck.do")
	public String memberIdFind(@RequestParam Map param, HttpSession session, Model model) {
		
		Member m = service.memberFindId(param);
		System.out.println(m);
		if(m!=null) {
			model.addAttribute("findId", m);
		}
		model.addAttribute("msg", m!=null?"아이디는"+m.getUserId()+"입니다":"잘못입력하셨습니다.");
		model.addAttribute("loc","/member/memberLogin.do");
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberPwCheck.do")
	public String memberPwFind(Member m, HttpSession session, Model model) {
		
		String pw = "";
		String pwView = "";
		String msg="잘못된 정보입니다.";
		String loc="/member/memberPwFind.do";
		for(int i=0; i<8; i++)
		{
			pw += (char) ((Math.random()*26)+97);
		}
		
		m.setUserPassword(pwEncoder.encode(pw));
		
		int result = service.memberFindPw(m);
		
		if(result>0)
		{
			msg="임시비밀번호는"+pw+"입니다.";
			loc="/member/memberLogin.do";
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}
		return "common/msg";
	}
	
	//이메일 인증
	@RequestMapping("/member/mailCheck.do")
	@ResponseBody
	public int mailCheckGet(String email) throws Exception{
		System.out.println("실행되니?"+email);
		
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		System.out.println("인증번호 " + checkNum);
		
		String setFrom = "khamklibrary@gmail.com";
		String toMail = email;
		String title = "회원가입 인증번호 입니다.";
		String content = "인증번호는" +checkNum+"입니다."+
						 "<br>"+
						 "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return checkNum;
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
	public String memberPwck(@RequestParam Map param ,@ModelAttribute("loginMember") Member m, Model model) {
		String msg="비밀번호가 확인되었습니다.";
		String loc="/member/memberInfoUpdate.do";
		if(!pwEncoder.matches((String)param.get("password"), m.getUserPassword())) {
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
		int result2= service.cancelBookingUpdate(m1);
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
		
		m.setUserPassword(pwEncoder.encode(m.getUserPassword()));
		
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
	
	@RequestMapping("/member/memberHopeBookRecord.do")
	public ModelAndView memberHopeBookRecord(ModelAndView mv,@ModelAttribute("loginMember") Member m,
										    @RequestParam(value="cPage", defaultValue="1") int cPage,
										    @RequestParam(value="numPerPage", defaultValue="5") int numPerpage) {
		
		mv.addObject("list",service.selectHopeRecordList(m.getUserId(), cPage, numPerpage));
		int totalData=service.selectHopeRecordCount(m.getUserId());
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage,"memberHopeBookRecord.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("member/memberHopeBookRecord");
		return mv;
	}
	
	@RequestMapping("/member/memberBookMark.do")
	public ModelAndView memberBookMark(ModelAndView mv, @ModelAttribute("loginMember") Member m,
									  @RequestParam(value="cPage", defaultValue="1") int cPage,
									  @RequestParam(value="numPerPage", defaultValue="5") int numPerpage) {
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
	public String memberReadingRoom(@ModelAttribute("loginMember") Member m , Model model,
									@RequestParam(value="cPage", defaultValue="1") int cPage,
									@RequestParam(value="numPerPage", defaultValue="5") int numPerPage) {
		AdminStudyroomBooking srb = service.selectSRBooing(m.getUserId());
		List<AdminStudyroomHistory> list= service.selectSRHList(m.getUserId(),cPage, numPerPage);
		int totalData=service.selectSRHCount(m.getUserId());
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "memberReadingRoom.do"));
		model.addAttribute("list",list);
		model.addAttribute("srb", srb);
		return "member/memberReadingRoom";
	}
	
	@RequestMapping("/member/cancelSRBooking.do")
	public String cancelSRBooking(@RequestParam String bookingNo, Model model) {
		String msg="예약 취소에 실패하였습니다.";
		String loc="/member/memberReadingRoom.do";
		int result=service.cancelSRBooking(bookingNo);
		if(result>0) {
			msg="예약을 취소하였습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/membershipCard.do")
	public String membershipCard() {
		return "member/membershipCard";
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete() {
		return "member/memberDelete";
	}
	@RequestMapping("/member/memberDropRequest.do")
	public String memberDropRequest(@RequestParam Map param,@ModelAttribute("loginMember") Member m, Model model,
									HttpSession session, SessionStatus ss) {
		String msg="비밀번호가 확인되었습니다. 회원님의 계정을 탈퇴를 요청합니다.";
		String loc="/";
		Map map = new HashMap();
		map.put("userId", m.getUserId());
		map.put("request", "Y");
		int result=0;
		if(!pwEncoder.matches((String)param.get("password"), m.getUserPassword())) {
			msg="비밀번호가 일치하지 않습니다.";
			loc="/member/memberDelete.do";
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}else{
			MemberDrop md=service.selectMemberDropRequestList(map);
			if(md==null) {
				result=service.insertMemberDropRequest(map);
				System.out.println("result값 : " + result);
				if(session!=null) session.invalidate();
				if(!ss.isComplete()) {
					ss.setComplete();
				}
			}else {
				msg="이미 탈퇴요청된 계정입니다.";
			}
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberTest.do")
	public String memberTest() {
		return "member/memberTest";
	}
	
}
