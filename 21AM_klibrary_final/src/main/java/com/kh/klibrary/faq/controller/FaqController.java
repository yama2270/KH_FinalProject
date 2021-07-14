package com.kh.klibrary.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.klibary.faq.model.service.FaqService;
import com.kh.klibary.faq.model.vo.Faq;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	@RequestMapping("/faq/faqList.do")
	public String faqList (Model mfaq) {
		List<Faq> list=service.selectFaqList();
		mfaq.addAttribute("flist", list);
		return "/faq/faqList";
	}
}
