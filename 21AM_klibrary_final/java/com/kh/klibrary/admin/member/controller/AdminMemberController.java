package com.kh.klibrary.admin.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
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
			@RequestParam(required=false,defaultValue="5") int numPerpage,
			ModelAndView mv) {
		
		List<AdminMember> list=service.searchMember(param,cPage,numPerpage);
		
		int totalData=service.totalsearchMember(param);

		mv.addObject("list",list);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage,"memberList.do"));
		mv.addObject("param",param);
		mv.setViewName("admin/member/memberList");
		return mv;
	}
	
	//회원삭제
	@RequestMapping("/admin/member/deletemember.do")
	public String deletemember(@RequestParam String userId, Model model) {
		System.out.println(userId);
		int result=service.deletemember(userId);
		model.addAttribute("msg",result>0?"삭제성공":"삭제실패");
		model.addAttribute("loc","/admin/member/memberList.do");
		return "common/msg";
	}
	//선택회원삭제
	@RequestMapping("/admin/member/deleteList.do")
	public String deleteList(@RequestParam String member, Model model) {
		System.out.println(member);
		Map m = new HashMap();
		m.put("userId",member.split(","));
		
		
		model.addAttribute("msg",service.deletememberList(m)>0?"삭제성공":"삭제실패");
		model.addAttribute("loc","/admin/member/memberList.do");
		return "common/msg";
	}
	
	
	
	//회원수정
	@RequestMapping("/admin/member/memberUpdate.do")
	public ModelAndView Updatemember(@RequestParam String userId, ModelAndView mv) {
		mv.addObject("list",service.selectMember(userId));
		mv.setViewName("/admin/member/memberUpdate");
		return mv;
	}
	
	@RequestMapping("/admin/member/memberUpdateEnd.do")
	public String UpdatememberEnd(AdminMember m,Model model) {
		m.setUserPassword(pwEncoder.encode(m.getUserPassword()));
		int result=service.updateMember(m);
		model.addAttribute("msg",result>0?"수정성공":"수정실패");
		model.addAttribute("loc","/admin/member/memberList.do");
		return "common/msg";
		
	}
	
	
	
	
	// 회원탈퇴리스트 
	@RequestMapping("/admin/member/memberWithdraw.do")
	public ModelAndView memberWithdraw(@RequestParam(value="cPage", defaultValue="1") int cPage, 
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage,
			ModelAndView mv) {
		mv.addObject("list",service.selectDropList(cPage,numPerpage));
		int totalData=service.selectDropCount();
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "memberWithdraw.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("admin/member/memberWithdraw");
		return mv;
	}
	
	// 회원탈퇴요청 검색
	@RequestMapping("/admin/member/memberWithdrawSearch.do")
	public ModelAndView memberWithdrawSearch(@RequestParam Map param,
			@RequestParam(required=false,defaultValue="1") int cPage,
			@RequestParam(required=false,defaultValue="5") int numPerpage,
			ModelAndView mv) {
		System.out.println(param);
		
		List<AdminMember> list=service.memberWithdrawSearch(param,cPage,numPerpage);
		
		int totalData=service.totalmemberWithdrawSearch(param);
		
		String pageBar=new AdminPagingTemplate().searchKeyPagingTemplate(cPage, numPerpage, totalData);
		
		mv.addObject("list",list);
		mv.addObject("pageBar",pageBar);
		mv.addObject("param",param);
		mv.setViewName("admin/member/memberWithdraw");
		return mv;
	}
	
	// 회원탈퇴요청 수락
	@RequestMapping("/admin/member/memberWithdrawDelete.do")
	public String memberWithdrawDelete(@RequestParam String userId,Model model) {
		int result=service.memberWithdrawDelete(userId);
		model.addAttribute("msg",result>0?"삭제되었습니다":"삭제실패 다시 요청해주세요");
		model.addAttribute("loc","/admin/member/memberWithdraw.do");
		return "common/msg";
	}
	
	// 회원탈퇴요청 취소
	@RequestMapping("/admin/member/memberWirthdrawNo.do")
	public String memberWirthdrawNo(@RequestParam String userId, Model model) {
		System.out.println(userId);
		int result=service.memberWirthdrawNo(userId);
		model.addAttribute("msg",result>0?"요청취소되었습니다":"요청실패 다시 요청해주세요");
		model.addAttribute("loc","/admin/member/memberWithdraw.do");
		return "common/msg";
	}
	
	// 체크된회원탈퇴요청 수락
	@RequestMapping("/admin/member/memberWithdrawDeleteList.do")
	public String memberWithdrawDeleteList(@RequestParam String member, Model model) {
		System.out.println(member);
		Map m = new HashMap();
		m.put("userId",member.split(","));
		
		
		model.addAttribute("msg",service.memberWithdrawDeleteList(m)>0?"삭제성공":"삭제실패");
		model.addAttribute("loc","/admin/member/memberWithdraw.do");
		return "common/msg";
	}
	
	// 체크된회원탈퇴요청 취소
	@RequestMapping("/admin/member/memberWirthdrawNoList.do")
	public String memberWirthdrawNoList(@RequestParam String member, Model model) {
		System.out.println(member);
		Map m = new HashMap();
		m.put("userId",member.split(","));
		
		
		model.addAttribute("msg",service.memberWirthdrawNoList(m)>0?"요청이 취소되었습니다":"실패하였습니다 다시 시도해주세요");
		model.addAttribute("loc","/admin/member/memberWithdraw.do");
		return "common/msg";
	}
	
}
