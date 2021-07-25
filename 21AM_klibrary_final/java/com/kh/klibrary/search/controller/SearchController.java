package com.kh.klibrary.search.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.common.PageFactory;
import com.kh.klibrary.common.PageFactory2;
import com.kh.klibrary.common.PageFactory3;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.Likes;
import com.kh.klibrary.search.service.SearchServiceImp;

import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.member.model.vo.Member;
import com.kh.klibrary.search.service.SearchService;




@Controller
@SessionAttributes({"loginMember"})
public class SearchController {
	
	@Autowired
	private SearchService service;
	@Autowired
	private ObjectMapper mapper;
	
	
@RequestMapping("/searchpage/bookSearch.do")
public String totalSearch() {

	
	return "/searchpage/bookSearch";
   }

@RequestMapping("/searchpage/bookDetail.do")

public ModelAndView bookDetail(
		@RequestParam(value="isbnNo", required=true) String isbnNo,
		@RequestParam(value="keyword", required=false) String keyword,
		@RequestParam(value="category", required=false) String category,
		ModelAndView mv){
	mv.addObject("book",service.selectBook(isbnNo));	
	System.out.println("selectbook테스트"+service.selectBook(isbnNo));
	
	Book b=service.selectBook(isbnNo);
	String bookNo=b.getBookNo();
	if(service.selectLending(bookNo)!=null) {
		mv.addObject("lending",service.selectLending(bookNo));
	}
	mv.addObject("keyword",keyword);
	mv.addObject("category",category);
	mv.addObject("lending",null);
	System.out.println("lending테스트"+service.selectLending(bookNo));
	mv.setViewName("/searchpage/bookDetail");
		
	return mv;
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


@RequestMapping("/searchpage/wishBookCheckInsert.do") //검색 및 Insert
public String wishBookCheckInsert(@ModelAttribute("loginMember") Member m, Model model , @RequestParam Map param) {
	param.put("userId", m.getUserId());
	System.out.println(param.toString());
	List<BookInfo> bookInfo = service.selectBookInfoList(param);
	int result=0;
	String msg = null;
	String loc = null;
	//wishbook테이블 중복검사 한번 더해야함.
	if(bookInfo.size() == 0) {
		result=service.insertWishBook(param);
	}
	if(result==0) {
		msg="이미 보유한 도서입니다.";
		loc="/searchpage/wishbook.do";
	}else if(result>0) {
		msg="희망도서 신청하였습니다.";
		loc="/searchpage/wishbook.do";
	}
	model.addAttribute("msg", msg);
	model.addAttribute("loc", loc);
	return "common/msg";
}

@RequestMapping("/searchpage/bookRegisterTest.do")
public String bookRegisterTest1(){
	
	return "searchpage/bookRegisterTest";
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

@RequestMapping(value="/searchpage/bookTotalSearch")
public ModelAndView bookTotalSearch(
		  @RequestParam("keyword") String keyword,
		  @RequestParam("category") String category,
		  @RequestParam(value="searchNumber", required=false, defaultValue="10") int searchNumber,
		  @RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
		                     ModelAndView mv     ) {
	   System.out.println(keyword+","+category+","+searchNumber+","+cPage);
	   
	   HashMap<String, Object> hashMap = new HashMap<>();
	   hashMap.put("category", category);
	   hashMap.put("keyword", keyword);
	   hashMap.put("searchNumber", searchNumber);
	   hashMap.put("cPage", cPage);
	   
	   int totalData=service.bookTotalCount(hashMap);
		System.out.println(totalData);
		
		System.out.println("totalData사이즈테스트"+totalData);
		//System.out.println("페이지별 데이터"+(service.selectBookList(hashMap)).size());
		
		
		if(keyword!=""&&keyword!=null) {
			mv.addObject("list", service.selectBookList(hashMap));			
			mv.addObject("pageBar",PageFactory2.getPageBar(totalData, cPage, searchNumber));
		mv.addObject("keyword",keyword);
		mv.addObject("category",category);
		mv.addObject("totalData",totalData);
		mv.addObject("searchNumber",searchNumber);
		}
	
	
	mv.setViewName("/searchpage/bookSearch");
	
	return mv;
}

@RequestMapping("/searchpage/interestingbook")
public String interestingbook ( 
		@RequestParam Map param,
		@ModelAttribute("loginMember") Member m,
		HttpServletRequest request,
		Model model
		        ) {
	String[] bookCheckArray = request.getParameterValues("bookCheck");
	System.out.println("bookCheckArray테스트"+bookCheckArray);
	int result=0;
	param.put("userId", m.getUserId());
	
	/* List<String> bookCheckArray2=new ArrayList(); */
	for(int i=0;i<bookCheckArray.length;i++) {	
		System.out.println("isbnNo테스트"+bookCheckArray[i]);
		param.put("isbnNo",bookCheckArray[i]);
		 Likes likes=service.selectInterestingBook(param);
		System.out.println("likes테스트"+likes);
		if( likes==null) {			
	    System.out.println(bookCheckArray[i]);
	     //param.put("isbnNo",bookCheckArray[i]);
	     result+=service.insertInterestingBook(param);
		
		}
	  
	}
	String msg="";
	String loc="";
	String referer = request.getHeader("Referer");
	
	//referer.replaceAll("http://localhost:9090/klibrary", "");
	//referer.substring(30);
	System.out.println("referer테스트"+referer);
	if(result==0) {
		msg="이미 관심도서로 등록되었습니다.";
		loc=referer;
	}else if(result>0) {
		msg="관심도서로 등록되었습니다.";
		loc=referer;
	}
	model.addAttribute("msg", msg);
	model.addAttribute("loc", loc);
	return "common/msg2";
}

@RequestMapping("/searchpage/detailSearch")
    public ModelAndView detailSearch(
    		        @RequestParam Map param,		
					@RequestParam(value="searchNumber", required=false, defaultValue="10") int searchNumber,
					@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
					ModelAndView mv
					    ) {
				Iterator iterator = param.keySet().iterator();
				while(iterator.hasNext()) {
					String key = (String)iterator.next();
					System.out.println(key +":"+param.get(key));
				}
				
				String init=(String)param.get("init");
			 
			
			// 초성 배열로 변경 
			
			if(init=="44700,55203") {
				System.out.println("init테스트"+init);			
				
			}else {
				param.put("init",init.split(","));
				System.out.println("init테스트2"+init);
			}
						
			 
			 //다음 페이징처리를 위한 변수받기, 페이지바 함수에서의 ""에러처리
		   	
	
			    List<BookInfo> bookList1 =service.selectDetailSearch(param,cPage,searchNumber);
			    System.out.println("bookList1테스트"+bookList1);
			    int bookListCount=service.selectDetailSearchCount(param);
			    System.out.println("bookListCount테스트"+bookListCount);
		
			  mv.addObject("totalData", bookListCount);
			  mv.addObject("list",bookList1);
			  mv.addObject("pageBar",PageFactory2.getPageBar(bookListCount, cPage, searchNumber)); 			  
			  mv.addObject("init",init);
			  mv.addObject("book_Category",(String)param.get("book_Category"));
			  mv.addObject("bookName",(String)param.get("bookName"));
			  mv.addObject("author",(String)param.get("author"));
			  mv.addObject("publisher",(String)param.get("publisher"));
			  mv.addObject("isbnNo",(String)param.get("isbnNo"));
			  mv.addObject("publishYear",(String)param.get("publishYear"));
			  mv.addObject("publishYear2",(String)param.get("publishYear2"));
			  mv.addObject("searchNumber",(String)param.get("searchNumber"));
			  
			  
			  mv.setViewName("/searchpage/bookDetailSearch");
			     
	return mv;
}


@RequestMapping("/searchpage/kdcNoSearch")
  public ModelAndView kdcNoSearch(
		            @RequestParam Map param,
				    @RequestParam(value="searchNumber", required=false, defaultValue="10") int searchNumber,
					@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
				     ModelAndView mv
		                          ) {
	          String kdcNo=(String)param.get("kdcNo");
	          String category=(String)param.get("category");
	 
	          List<BookInfo> bookList=service.kdcNoSearch(param,cPage,searchNumber);
	          int kdcBookListCount=service.kdcBookListCount(param);
	         
	          mv.addObject("list",bookList);
	          mv.addObject("totalData",kdcBookListCount);
	          mv.addObject("kdcNo",kdcNo);
	          mv.addObject("category",category);
	          mv.addObject("pageBar",PageFactory3.getPageBar(kdcBookListCount, cPage, searchNumber, kdcNo));
	          
	          mv.setViewName("/searchpage/categorySearch");
	
	return mv;
 }





}
