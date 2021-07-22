package com.kh.klibrary.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.klibrary.faq.model.service.FaqService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller//어노테이션 처리
public class FaqController {
	
	@Autowired
	private FaqService service;
	//final 반드시 있어야한다.
	//@Autowired  	
	/*
	 * FaqController(FaqService service){ this.service=service; }
	 */
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

