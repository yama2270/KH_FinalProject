package com.kh.klibrary.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.faq.model.service.FaqService;

@Controller//어노테이션 처리
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	//FAQ 목록 뽑아오기
	@RequestMapping("/faq/faqList.do")
	public ModelAndView faqList(ModelAndView mv) {
			mv.addObject("list",service.selectFaqList());
			mv.setViewName("/faq/faqList");
		return mv; //
		
	}
}
