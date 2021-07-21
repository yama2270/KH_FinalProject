package com.kh.klibrary.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.faq.model.service.FaqService;
import com.kh.klibrary.faq.model.vo.Faq;

@Controller//어노테이션 처리
public class FaqController {
	
	/*
	 * @Inject FaqService FaqService;
	 */
	
	@Autowired
	private FaqService service;
	
	
	  //FAQ 목록 뽑아오기
	  
	  @RequestMapping("/faq/faqList.do") public ModelAndView faqList(ModelAndView
	  mv) { mv.addObject("list",service.selectFaqList());
	  mv.setViewName("/faq/faqList"); return mv; //
	  
	  }
	 
/*	//FAQ 검색 목록
	@RequestMapping("/faq/faqList.do")
	public ModelAndView slist(@RequestParam(defaultValue="faqCate") String searchOption,
			@RequestParam(defaultValue="") String keyword) throws Exception{
		List<Faq> list = FaqService.listAll(searchOption, keyword);
		
		//레코드의 개수
		int count= FaqService.countArticle(searchOption, keyword);
		
		//ModelAndView -모델뷰
		ModelAndView mav= new ModelAndView();
		
		//데이터를 맵에 저장
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("list",list); //list
		map.put("count",count); //레코드의 갯수
		map.put("searchOption", searchOption); // 검색옵션
		map.put("keyword", keyword); //검색 키워드
		mav.addObject("map", map); //map에 저장된 데이터를 mav에 저장
		mav.setViewName("/faq/faqList");//뷰를 설정
		return mav;
		
		
		
		
		
		}
		*/
}

