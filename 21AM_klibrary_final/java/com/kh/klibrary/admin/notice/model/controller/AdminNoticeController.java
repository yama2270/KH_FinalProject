package com.kh.klibrary.admin.notice.model.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.notice.model.service.AdminNoticeService;
import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.common.PageFactory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminNoticeController {
	@Inject
	@Autowired
	private AdminNoticeService service;

	@RequestMapping("/admin/notice/noticeList.do")
	public ModelAndView noticeList(
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, 
			ModelAndView mv) {
		mv.addObject("list", service.selectNoticeList(cPage, numPerpage));
		int totalData=service.selectNoticeCount();
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage, "noticeList.do"));
		mv.setViewName("admin/notice/noticeList");
		return mv;
	}

	@RequestMapping("/admin/notice/noticeForm.do")
	public String noticeForm() {
		return "admin/notice/noticeForm"; 	
	}

	// 공지사항 읽기
	@RequestMapping("/admin/notice/noticeView.do")
	public ModelAndView noticeView(int noticeNo, ModelAndView mv) {
		mv.addObject("notice",service.selectNoticeView(noticeNo));
		mv.setViewName("/admin/notice/noticeView");
		return mv;
	}
	
	@RequestMapping("/admin/notice/insertNotice.do")
	public ModelAndView noticeInsert(Notice notice,ModelAndView mv,MultipartFile originalFile) {
		int result=service.insertNotice(notice);
		String msg="";
		if(result>0) {
			msg="공지사항입력완료";
		}else{
			msg="공지사항입력실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/admin/notice/noticeList.do");
		mv.setViewName("common/msg");
		return mv;
	}
	
	//게시글 삭제
	@RequestMapping("/admin/notice/noticeDelete.do")
	public String ajaxTest(HttpServletRequest request) throws Exception{
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0;i<size; i++) {
			service.deleteNotice(ajaxMsg[i]);
		}
		return "redirect:/admin/notice/noticeList.do";
	}

	@RequestMapping("/admin/notice/noticeUpdate.do")
	public String noticeUpdate(int noticeNo,Model m) {
		m.addAttribute("notice",service.selectNoticeView(noticeNo));
		return "admin/notice/noticeUpdate";
	}

	@RequestMapping("/admin/notice/noticeUpdateEnd.do")
	public String noticeUpdate(Notice notice) {
			service.noticeUpdate(notice);
		return "redirect:/admin/notice/noticeView.do?noticeNo="+notice.getNoticeNo();
			
		}
	
	//게시글 검색
	@PostMapping("/admin/notice/noticeSearch.do")
	public String noticeSearch(@RequestParam("category") String title, @RequestParam(required=false)String keyWord, Model model) {
		//공백이면
		if(!StringUtils.hasText(keyWord)) {
			return "redirect:/admin/notice/noticeList";
		}
		if("제목".equals(title)) {
			model.addAttribute("list",service.searchNoticeTitle(keyWord));
		}else {
			model.addAttribute("list", service.searchNoticeContent(keyWord));
		}
		
		return "/admin/notice/noticeSearch";
	}
	

	
}