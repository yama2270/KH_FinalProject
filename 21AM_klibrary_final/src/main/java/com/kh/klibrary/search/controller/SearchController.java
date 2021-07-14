package com.kh.klibrary.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	
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






}
