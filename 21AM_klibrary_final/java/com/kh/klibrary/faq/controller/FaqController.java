package com.kh.klibrary.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.faq.model.service.FaqService;
import com.kh.klibrary.faq.model.vo.Faq;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller//어노테이션 처리
public class FaqController {


	private final FaqService service;
	//final 반드시 있어야한다.

	  //FAQ 목록 뽑아오기
	  @GetMapping("/faq/faqList.do") 
	  public String faqList(Model model) {		  
		  model.addAttribute("list",service.selectFaqList());

		  return "/faq/faqList";

	  }

	  //FAQ 검색
	  @PostMapping("/faq/faqSearch.do") //get과 post로 제한 - requestMapping은 둘다 받음
	  public String faqSearch(@RequestParam("katagori") String title, @RequestParam(required=false) String keyWord, Model model) {
		  // 공백이면
		  if (!StringUtils.hasText(keyWord)) {
			  return "redirect:/faq/faqList.do";
		  }

		  if ("제목".equals(title)) {
			  model.addAttribute("list", service.searchFaqTitle(keyWord));
		  }else {
			  model.addAttribute("list", service.searchFaqContent(keyWord));
		  }

		  return "/faq/faqSearch";

	  }
}