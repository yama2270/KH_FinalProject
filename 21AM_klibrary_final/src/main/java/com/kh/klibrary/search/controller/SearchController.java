package com.kh.klibrary.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.search.service.SearchServiceImp;

@Controller
public class SearchController {
	
	@Autowired
	private SearchServiceImp service;

	
@RequestMapping("search/bookSearch.do")
public String totalSearch(){
	
	return "searchpage/bookSearch";
   }

@RequestMapping("search/bookDetail.do")
public String bookDetail(){
	
	return "searchpage/bookDetail";
   }

@RequestMapping("search/detailSearch.do")
public String detailSearch(){
	
	return "searchpage/bookDetailSearch";
   }

@RequestMapping("search/bookSearchResult.do")
public String bookSearchResult(){
	
	return "searchpage/bookSearchResult";
   }

@RequestMapping("search/categorySearch.do")
public String categorySearch(){
	
	return "searchpage/categorySearch";
   }

@RequestMapping("search/wishbook.do")
public String wishbook(){
	
	return "searchpage/wishbook";
   }

@RequestMapping("search/wishbookPopup.do")
public String wishbookPopup(){
	
	return "searchpage/wishbookPopup";
   }

@RequestMapping("search/wishbookRequest.do")
public String wishbookRequest(){
	
	return "searchpage/wishbookRequest";
   }


//@RequestMapping("searchpage/wishbookPopup.do/{title}")
//public String searchNaverApi(@PathVariable("title") String title, ModelAndView mv){
//	System.out.println(service.searchNaverApi(title));
//	
//	mv.addObject("bookList",service.searchNaverApi(title) );
//	mv.setViewName("searchpage/wishbookPopup");
//	return "searchpage/wishbookPopup";
//}

@RequestMapping("searchpage/wishbookPopup")
public String searchNaverApi( ModelAndView mv){
	System.out.println(service.searchNaverApi());
	
	mv.addObject("bookList",service.searchNaverApi() );
	mv.setViewName("searchpage/wishbookPopup");
	return "searchpage/wishbookPopup";
}

}
