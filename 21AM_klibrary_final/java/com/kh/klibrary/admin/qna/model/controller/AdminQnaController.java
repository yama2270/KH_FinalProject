package com.kh.klibrary.admin.qna.model.controller;

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

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.admin.qna.model.service.AdminQnaService;
import com.kh.klibrary.common.PageFactory;
import com.kh.klibrary.qna.model.vo.Qna;


@Controller
public class AdminQnaController {
	@Inject
	@Autowired
	private AdminQnaService service;

	@RequestMapping("/admin/qna/adminqnaList.do")
	public ModelAndView adminqnaList(
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, 
			ModelAndView mv) {
		mv.addObject("list", service.selectQnaList(cPage, numPerpage));
		int totalData=service.selectQnaCount();
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage, "adminqnaList.do"));
		mv.setViewName("admin/qna/adminqnaList");
		return mv;
	}
	
	//게시글 보기
	@RequestMapping("/admin/qna/qnaView.do")
	public ModelAndView qnaView(int qnaNo, ModelAndView mv) {
		mv.addObject("qna",service.selectQnaView(qnaNo));
		mv.setViewName("/admin/qna/qnaView");
		return mv;
	}
	
	//게시글 삭제
	@RequestMapping("/admin/qna/qnaDelete.do")
	public String ajaxTest(HttpServletRequest request) throws Exception{
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0;i<size; i++) {
			service.deleteQna(ajaxMsg[i]);
		}
		return "redirect:/admin/qna/adminqnaList.do";
	}
	
	//게시글 검색
	@PostMapping("/admin/qna/qnaSearch.do")
	public String qnaSearch(@RequestParam("category") String title, @RequestParam(required=false)String keyWord, Model model) {
		//공백이면
		if(!StringUtils.hasText(keyWord)) {
			return "redirect:/admin/qna/adminqnaList";
		}
		if("제목".equals(title)) {
			model.addAttribute("list",service.searchQnaTitle(keyWord));
		}else {
			model.addAttribute("list", service.searchQnaContent(keyWord));
		}
		
		return "/admin/qna/qnaSearch";
	}
	
	// 문의사항 답변 작성
	@RequestMapping("/admin/qna/qnaAnswerUpdate.do")
	public ModelAndView qnaAnswerUpdate(Qna qna,ModelAndView mv) {
		int result=service.qnaAnswerUpdate(qna);
		String msg="";
		if(result>0) {
			msg="문의사항 답변완료";
		}else{
			msg="문의사항 입력실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/admin/qna/adminqnaList.do");
		mv.setViewName("common/msg");
		return mv;
	}
	
	

	@RequestMapping("/admin/qna/qnaAnswerUpdateEnd.do")
	public String qnaAnswerUpdate(Qna qna) {
			service.qnaAnswerUpdate(qna);
		return "redirect:/admin/qna/adminqnaList.do";
			
		}
	
}
	