package com.kh.klibrary.admin.qna.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.qna.model.service.AdminQnaService;
import com.kh.klibrary.common.PageFactory;


@Controller
public class AdminQnaController {
	
	@Autowired
	private AdminQnaService service;

	@RequestMapping("/admin/qna/adminQnaList.do")
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
	
	@RequestMapping("/admin/qna/qnaView.do")
	public String qnaView() {
		return "admin/qna/qnaView";
	}
}
	