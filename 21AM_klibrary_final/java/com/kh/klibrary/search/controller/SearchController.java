package com.kh.klibrary.search.controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	    }else{mv.addObject("lending",null);}
	
	String publisher=b.getBookInfo().getBookCompany();
		HashMap param= new HashMap();
		param.put("publisher", publisher);
		List<BookInfo> publisherList = service.selectDetailSearch(param, 1, 6);
		String setname="";
		String setname2="";
			for(int i=0;i<publisherList.size();i++) {
				if(publisherList.get(i).getBookName().length()>25) {
				  setname=publisherList.get(i).getBookName().substring(0,23);
				  publisherList.get(i).setBookName(setname);
				}
				System.out.println(setname);
				
				if(publisherList.get(i).getIsbnNo().equals(isbnNo)) {
					publisherList.remove(i);
				}
			}
			
			if(publisherList.size()>5) {
				publisherList.remove(5);
			}
			
			
		System.out.println("publisherList테스트"+publisherList);
		
	String category2=b.getBookInfo().getBookKdc();	
	    HashMap param2= new HashMap();	    
	    param2.put("kdcNo", category2);
	    List<BookInfo> kdcNoList = service.kdcNoSearch(param2, 1, 6);
		    for(int i=0;i<kdcNoList.size();i++) {
		    	if(kdcNoList.get(i).getBookName().length()>25) {
		           setname2=kdcNoList.get(i).getBookName().substring(0,23);
		           kdcNoList.get(i).setBookName(setname2);
		    	}
		    	System.out.println(setname2);
		    	
				if(kdcNoList.get(i).getIsbnNo().equals(isbnNo)) {
					kdcNoList.remove(i);
				}
			}
		    
		    if(kdcNoList.size()>5) {
		    	kdcNoList.remove(5);
			}
	    System.out.println("kdcNoList테스트"+kdcNoList);
	    List agelist=service.selectAge(isbnNo);
	    
	mv.addObject("ageList",agelist);
	mv.addObject("publisherList",publisherList);
	mv.addObject("kdcNoList",kdcNoList);
	mv.addObject("keyword",keyword);
	mv.addObject("category",category);
	
	
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
								@RequestParam(value="isbnNo", required=false) String isbnNo,
								@ModelAttribute("loginMember") Member m,
								HttpServletRequest request,
								Model model
		                       ) {
	

			String[] bookCheckArray = request.getParameterValues("bookCheck");
			System.out.println("bookCheckArray테스트"+bookCheckArray);
			int result=0;
			param.put("userId", m.getUserId());
			
			
			
			if(isbnNo!=null) { //북상세페이지 버튼선택시
				param.put("isbnNo",isbnNo);
				Likes likes=service.selectInterestingBook(param);
				if( likes==null) {			
				    
				     result+=service.insertInterestingBook(param);
					
					}
			}
			
			 if(bookCheckArray!=null) {	 //체크박스선택시
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

@RequestMapping("/searchpage/bookReservation")
   public String bookReservation(
					          @RequestParam("isbnNo") String isbnNo,
						      @ModelAttribute("loginMember") Member m,
						      @RequestParam Map param,
						      HttpServletRequest request,
						      Model model           
		                       ) {
	       System.out.println("isbnNo테스트"+isbnNo);
			Book book=service.selectBook(isbnNo);
			param.put("userId", m.getUserId());
			param.put("bookNo",book.getBookNo());
			
			String msg="";
			String loc="";
			String referer = request.getHeader("Referer");
			int result=0;
	
				System.out.println("bookingState테스트 "+book.getBookingState());
				String bookingState=book.getBookingState();
				System.out.println(book.getBookingState()=="가능");
				if(bookingState.equals("가능")) {
					System.out.println("if문 안 bookingState테스트 "+book.getBookingState());
					param.put("bookingState", "불가능");
					result=service.bookingBook(param);
					result+=service.booking(param);
					
					
					if(result!=0) {
						msg="예약되었습니다.";
					}else {
						msg="예약 실패하였습니다.";
					}
				}else {
					msg="에약이 불가능한 도서입니다.";
				}
	     
	
	loc=request.getHeader("Referer");
	
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
			List<BookInfo> bookList1=null;	
			int bookListCount=0; 
		   	if(!init.equals("44700,55203")||!((String)param.get("book_Category")).equals("도서 대분류")||!((String)param.get("bookName")).equals("")
		   		||!((String)param.get("author")).equals("")||!((String)param.get("publisher")).equals("")||!((String)param.get("isbnNo")).equals("")
		   		||!((String)param.get("price")).equals("")||!((String)param.get("publishYear")).equals("")) {
		   			
	         
			    bookList1 =service.selectDetailSearch(param,cPage,searchNumber);
			    System.out.println("bookList1테스트"+bookList1);
			    bookListCount=service.selectDetailSearchCount(param);
			    System.out.println("bookListCount테스트"+bookListCount);
		   	}
		   	
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

//관심도서 나이 
	@RequestMapping("/searchpage/selectAge.do")
	@ResponseBody
	public Map selectAge(@RequestParam Map param) {
		
		String isbnNo=(String)param.get("isbnNo");
		List<Integer> list = service.selectAge(isbnNo);
		
		System.out.println("list테스트"+list);
		Map<String,Integer> result = new HashMap<String,Integer>();
		
		int lessTeenageCount=0;
		int teenageCount=0;
		int twentyCount=0;
		int thirtyCount=0;
		int fortyCount=0;
		int fiftyCount=0;
		int sixtyCount=0;
		
		
			for(Integer age : list) {
				if(list!=null&&list.size()!=0&&age!=null) {
					
					System.out.println("age테스트="+age);
					if(age<10) {	
						System.out.println(age<10);
					++lessTeenageCount;
					
					}
					if(age>=10 && age<20) {	
						System.out.println(age>=10);
						++teenageCount;
						
						}
					if(age>=20 && age<30) {	
						System.out.println(age>=20);
						++twentyCount;
						
						}
					if(age>=30 && age<40) {	
						System.out.println(age>=30);
						++thirtyCount;
						
						}
					if(age>=40 && age<50) {			
						++fortyCount;
						
						}
					if(age>=50 && age<60) {			
						++fiftyCount;
						
						}
					if(age>=60 ) {			
						++sixtyCount;
						
						}
					
				}
		}
		result.put("10대미만", lessTeenageCount);
		result.put("10대", teenageCount);
		result.put("20대", twentyCount);
		result.put("30대", thirtyCount);
		result.put("40대", fortyCount);
		result.put("50대", fiftyCount);
		result.put("60대", sixtyCount);
		
		
		
		return result;
	}
	
   @RequestMapping("/searchpage/likeBest")
   @ResponseBody
   public List<BookInfo> likeBest(){
	   List<Map> list1=service.likeBest();	   
	   List<BookInfo> list=new ArrayList<BookInfo>();
	   HashMap param=new HashMap();
	   
	   for(Map m: list1) {
		   String bookname=(String)m.get("BOOK_NAME");
		   param.put("bookName", bookname);
		   List<BookInfo> b=service.selectDetailSearch(param, 1, 1);
		   BookInfo b2=b.get(0);
		   list.add(b2);
	   }
	   System.out.println(list);
	   
	   return list;
   }
	
   @RequestMapping("/searchpage/lendingbest")
   @ResponseBody
   public List<BookInfo> lendingBest(){
	   
	  List<BookInfo> list=new ArrayList<BookInfo>();
	  List<Map> list1=service.lendingBest();
	  HashMap param=new HashMap();
	  for(Map m:list1) {
		  String isbnNo=(String)m.get("ISBN_NO");
		  param.put("isbnNo",isbnNo);
		  List<BookInfo> b=service.selectDetailSearch(param, 1, 1);
		  BookInfo b2=b.get(0);
		  list.add(b2);
	  }
	   
	   
	   return list;
   }

   @RequestMapping("/searchpage/recommendBook")
   @ResponseBody
   public List<BookInfo> recommendBook(HttpServletRequest request) {
	   
	   List<BookInfo> list=new ArrayList<BookInfo>();
	   String[] booknameArr = request.getParameterValues("nameArr[]");
	   System.out.println("booknameArr테스트"+booknameArr);
	   for(int i=0; i <booknameArr.length; i++) {
		   String bookName=booknameArr[i].trim();
		   HashMap param=new HashMap();
		   param.put("bookName", bookName);
		   
		   List<BookInfo> b=service.selectDetailSearch(param, 1, 1);
			   if(b!=null && b.size()!=0) { 
			   list.add(b.get(0));
			   System.out.println("test하기"+b.get(0));
			   }//outofbounds exception때문에 size()!=0 꼭필요
	   }
	     
	  
	   return list;
	   
   }
   
   
}
