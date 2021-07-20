package com.kh.klibrary.search.controller;

import java.util.Map;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.klibrary.search.service.SearchServiceImp;



@Controller
public class SearchController {
	
	@Autowired
	private SearchServiceImp service;
	@Autowired
	private ObjectMapper mapper;
	
	
@RequestMapping("/searchpage/bookSearch.do")
public String totalSearch() {

	
	return "/searchpage/bookSearch";
   }

@RequestMapping("/searchpage/bookDetail.do")

public String bookDetail(){
	
	return "/searchpage/bookDetail";
   }

@RequestMapping("/searchpage/detailSearch.do")
public String detailSearch(){
	
	return "/searchpage/bookDetailSearch";
   }

@RequestMapping("/searchpage/bookSearchResult.do")
public String bookSearchResult(){
	
	return "/searchpage/bookSearchResult";
   }

@RequestMapping("/searchpage/categorySearch.do")
public String categorySearch(){
	
	return "/searchpage/categorySearch";
   }

@RequestMapping("/searchpage/wishbook.do")
public String wishbook(){
	
	return "/searchpage/wishbook";
   }

@RequestMapping("/searchpage/wishbookPopup.do")
public String wishbookPopup(){
	
	return "searchpage/wishbookPopup";
   }

@RequestMapping("/searchpage/wishbookRequest.do")
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

@RequestMapping("/searchpage/wishbookPopup")
public ModelAndView searchNaverApi( ModelAndView mv) throws JsonProcessingException, ParseException{
	
//	ResponseEntity<String> result=service.searchNaverApi();
//	//String result2=new JSONSerializer().toJSON(result).toString();
//	JSON result2=new JSONSerializer().toJSON(result);
//	JSONParser parse=new JSONParser();
//	JSONObject obj=(JSONObject)parse.parse(result.getBody());
//	JSONArray item=(JSONArray)obj.get("documents");
//	for(Object o : item) {
//		System.out.println(o);
//	}
//	System.out.println("result2테스트"+result2);
//	System.out.println(result2.isArray());
	
	
	
//	List<Book> bookList= new ArrayList<Book>();
//	Book b = new Book();
//	   for(int i=0;i<= result2.size(); i++ ) {
//		   
//		   bookList.add(b);
//	   }
//	JSONObject jObject=new JSONObject(result2);
	//JSONArray jArray= jObject.getJSONArray(result2);
	

	//System.out.println(bookList);
//	String test=mapper.writeValueAsString(result.getBody());
//	System.out.println(test);
//	mv.addObject("bookList",mapper.writeValueAsString(result.getBody()).replaceAll("\"","\\\""));
	mv.setViewName("searchpage/wishbookPopup");
	return mv;
}

@RequestMapping(value="/searchpage/searchapiBook",produces = "application/json;charset=UTF-8")
@ResponseBody
public String searchApiBook(
		@RequestParam("keyword") String keyword,
		@RequestParam("category") String category,
		@RequestParam(value="page",required=false,defaultValue="1") int page,
		@RequestParam(value="size",required=false,defaultValue="10") int size) {
	
	System.out.println(page);
	System.out.println(size);
	/*
	 * int pageNo = Integer.parseInt(page); int sizeNo = Integer.parseInt(size);
	 */
	 
	 return service.searchNaverApi(keyword,category,page,size).getBody(); 
	
}

//@RequestMapping(value="/searchpage/searchapiBook",produces = "application/text;charset=UTF-8")
//@ResponseBody
//public ModelAndView searchApiBook(ModelAndView mv, @RequestParam Map param) {
//	mv.addObject("data",service.searchNaverApi(param).getBody());
//	mv.setViewName("searchpage/wishbookPopup");
//	return mv;
//}

}
