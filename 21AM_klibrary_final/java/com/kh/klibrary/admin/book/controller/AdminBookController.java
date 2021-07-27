package com.kh.klibrary.admin.book.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.book.model.service.AdminBookService;
import com.kh.klibrary.admin.common.AdminPagingTemplate;
import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;

@Controller
public class AdminBookController {

	@Autowired
	private AdminBookService service;

	// 도서목록
	@RequestMapping("/admin/book/bookAllList.do")
	public String bookAllList(
			@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",required=false,defaultValue="10") int numPerPage, 
			Model m) {
		List<Book> list = service.selectBookList(cPage,numPerPage);
		
		// 총 도서 구하기 
		int totalBook = service.totalBook();
		String pageBar = new AdminPagingTemplate().adminPagingTemplate(cPage,numPerPage,totalBook);
		
		m.addAttribute("list",list);
		m.addAttribute("pageBar",pageBar);
		return "admin/book/bookAllList";
	}

	// 도서목록 - 검색 
	@RequestMapping("/admin/book/searchKeyBook.do")
	public ModelAndView searchTypeBook(@RequestParam Map param, 
							   @RequestParam(required=false,defaultValue="1") int cPage,
							   @RequestParam(required=false,defaultValue="10") int numPerPage,ModelAndView mv) {
		
		// 도서 key 검색
		List<Book> list = service.searchKeyBook(param,cPage,numPerPage);

		// 총 도서 구하기 
		int totalBook = service.totalKeyBook(param);
		// pageBar 
		String pageBar = new AdminPagingTemplate().searchKeyPagingTemplate(cPage,numPerPage,totalBook);
		
		mv.addObject("list",list);
		mv.addObject("pageBar",pageBar);
		mv.addObject("param",param);
		mv.setViewName("admin/book/bookAllList");
		
		return mv;
	}
	
	// 도서목록 - 상세검색 
	@RequestMapping("/admin/book/searchDetBook.do")
	public ModelAndView searchDetBook(@RequestParam Map param,
							@RequestParam(required=false,defaultValue="1") int cPage,
							@RequestParam(required=false,defaultValue="10") int numPerPage,
							ModelAndView mv 
			) {
		
		// 파라미터 데이터 체크 
//		Iterator iterator = param.keySet().iterator();
//		while(iterator.hasNext()) {
//			String key = (String)iterator.next();
//			System.out.println(key +":"+param.get(key));
//		}
		
		// 초성 배열로 변경 
		if(!((String)param.get("iniArr")).equals("")){
			param.put("iniArr",((String)param.get("iniArr")).split(","));
		}
		
		
		List<Book> list = service.searchDetBook(param,cPage,numPerPage);
		int totalData = service.totalDetBook(param);
		String pageBar = new AdminPagingTemplate().searchDetPagingTemplate(cPage,numPerPage,totalData);
		
		mv.addObject("list", list);
		mv.addObject("pageBar", pageBar);
		
		mv.setViewName("admin/book/searchDetBookAjax");
		
		return mv;
	}
	
	// 도서목록 - 도서삭제 
	@RequestMapping("/admin/book/deleteBook.do")
	public String deleteBook(@RequestParam String bookNo,Model mo) {
		
		// 도서번호 받기 
		Map m = new HashMap();
		m.put("bookNo",bookNo.split(","));
		
		mo.addAttribute("msg",service.deleteBook(m)>0?"삭제성공":"삭제실패");
		mo.addAttribute("loc","/admin/book/bookAllList.do");
		return "common/msg";
	}
	
	// 대출도서목록
	@RequestMapping("/admin/book/bookRentalList.do")
	public String rentalList(Model m,
							@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
							@RequestParam(value="numPerPage",required=false,defaultValue="10") int numPerPage ) {
		List<Lending> list=service.selectRentalList(cPage, numPerPage);
		int totalBook = service.selectRentalCount();
		String pageBar = new AdminPagingTemplate().adminPagingTemplate(cPage,numPerPage,totalBook);
		
		m.addAttribute("list",list);
		m.addAttribute("pageBar",pageBar);
		return "admin/book/bookRentalList";
	}
	
	// 대출도서 목록 검색
	@RequestMapping("/admin/book/SearchRentalList.do")
	public String SearchRentalList(Model m, @RequestParam Map param,
								   @RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
								   @RequestParam(value="numPerPage",required=false,defaultValue="10") int numPerPage) {
		List<Lending> list=service.SearchRentalList(param, cPage, numPerPage);
		int totalBook = service.SearchRentalCount(param);
		String pageBar = new AdminPagingTemplate().adminPagingTemplate(cPage,numPerPage,totalBook);
		m.addAttribute("list",list);
		m.addAttribute("param",param);
		m.addAttribute("pageBar",pageBar);
		
		return "admin/book/bookRentalList";
	}
	
	//도서 연장
	@RequestMapping("/admin/book/addBookExtend.do")
	public String addBookExtend(@RequestParam Map param, Model model) {
		int bookExtend=Integer.parseInt(param.get("bookExtend").toString());
		param.put("bookExtend", bookExtend+1);
		param.put("returnDate", addDate(param.get("returnDate").toString()));
		String msg="연장 횟수 3회로 추가연장 실패하였습니다.";
		String loc="/admin/book/bookRentalList.do";
		if(bookExtend>=3){
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}else {
			int result=service.addBookExtend(param);
			msg="연장에 실패하였습니다.";
			if(result>0) {
				msg="연장에 성공하였습니다.";
			}
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}
		return "common/msg";
	}
	
	//도서 반납
	@RequestMapping("/admin/book/returnBook.do")
	public String returnBook(@RequestParam Map param, Model model) {
		String msg="도서반납을 실패햐였습니다.";
		String loc="/admin/book/bookRentalList.do";
		Lending ld = service.selectLending(param);
		int lhResult=service.insertLendingHistory(ld);
		int rbResult=service.returnBook(param);
		if(lhResult+rbResult==2) {
			msg="도서를 반납하였습니다.";
		}else if(lhResult+rbResult<2) {
			if(lhResult==1) {
				msg="대출이력내역 삽입 실패";
			}else if(rbResult==1) {
				msg="대출내역 삭제 실패";
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	// 예약도서목록
	@RequestMapping("/admin/book/bookReservedList.do")
	public String reservedList(Model m,
			@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",required=false,defaultValue="10") int numPerPage) {
		
		List<Booking> list=service.reservedList(cPage, numPerPage);		
		int totalBook = service.reservedCount();
		String pageBar = new AdminPagingTemplate().adminPagingTemplate(cPage,numPerPage,totalBook);
		m.addAttribute("list",list);
		m.addAttribute("pageBar",pageBar);
		
		return "admin/book/bookReservedList";
	}
	// 예약도서 목록 검색
	@RequestMapping("/admin/book/searchReservedList.do")
	public String searchReservedList(Model m, @RequestParam Map param,
								   @RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
								   @RequestParam(value="numPerPage",required=false,defaultValue="10") int numPerPage) {
		List<Booking> list=service.searchReservedList(param, cPage, numPerPage);
		int totalBook = service.searchReservedCount(param);
		String pageBar = new AdminPagingTemplate().adminPagingTemplate(cPage,numPerPage,totalBook);
		m.addAttribute("list",list);
		m.addAttribute("param",param);
		m.addAttribute("pageBar",pageBar);
		
		return "admin/book/bookReservedList";
	}
	
	//예약취소
	@RequestMapping("/admin/book/cancelReserved.do")
	public String cancelReserved(Model m, @RequestParam Map param) {
		String msg="도서예약 취소를 실패햐였습니다.";
		String loc="/admin/book/bookReservedList.do";
		Booking booking = service.selectBooking(param);
		int bhResult=service.insertBookingHistory(booking);
		int ccResult=service.cancelReserved(param);
		if(bhResult+ccResult==2) {
			msg="도서예약을 취소하였습니다.";
		}else if(bhResult+ccResult<2) {
			if(bhResult==1) {
				msg="도서예약내역 삽입 실패";
			}else if(ccResult==1) {
				msg="도서예약 삭제 실패";
			}
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
	}
	

	// 희망도서목록
	@RequestMapping("/admin/book/bookWishList.do")
	public String wishList() {
		return "admin/book/bookWishList";
	}

	// 도서 등록 
	@RequestMapping("/admin/book/registerBook.do")
	public String registerBook() {
		return "admin/book/registerBook";
	}
	
	// 도서상세 
	@RequestMapping("/admin/book/bookDetail.do")
	public ModelAndView bookDetail(@RequestParam String bookNo,ModelAndView mv) {
		Book b = service.selectBook(bookNo);
		List<LendingHistory> h = service.selectLenHis(bookNo);
		mv.addObject("b",b);
		mv.addObject("h",h);
		mv.setViewName("admin/book/bookDetail");
		return mv;
	}
	
	// 도서 ISBN 검색 
	@RequestMapping("/admin/book/searchIsbn.do")
	public String searchIsbn() {
		return "admin/book/searchIsbn";
	}
	
	// isbn 중복여부 확인
	@RequestMapping("/admin/book/checkIsbn.do")
	@ResponseBody
	public Map checkIsbn(String isbnNo) {
		int result = service.checkIsbn(isbnNo);
		Map map = new HashMap();
		map.put("flag", result!=0?"false": "true");
		return map;
	}
	
	// 도서등록 
	@RequestMapping("/admin/book/insertBook.do")
	public ModelAndView insertBook(BookInfo bookInfo,String newBook,ModelAndView mv,HttpServletRequest req) {
		
//		int result = service.insertBook(bookInfo,newBook);
//		mv.addObject("msg",result>0?"등록성공":"등록실패");
		
		//transaction 처리하기
		String msg = "등록성공";
		try {
			service.insertBook(bookInfo, newBook);
		} catch(RuntimeException e) {
			msg = "등록실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/admin/book/registerBook.do");
		
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	public String addDate(String date) {
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			Date d=format.parse(date);
			
			Calendar cal=Calendar.getInstance();
			cal.setTime(d);
			cal.add(Calendar.DATE, 7);
			
			date=format.format(cal.getTime());
			
		}catch(Exception e) {
			
		}
		return date;
	}
	
	// 카테고리별 도서수 
	@RequestMapping("/admin/book/countCatBook.do")
	@ResponseBody
	public Map countCatBook() {
		List<Map<String,Integer>> m = service.countCatBook();
		/* System.out.println(String.valueOf(m.get(0).get("BOOKS"))); */
		// 파싱처리해주기 
		Map hm = new HashMap();
		int key = 0;
		for(Map<String,Integer> ma : m) {
			hm.put(key++, ma.get("BOOKS"));
		}
		return hm;
	}
	
	// 기간별 대출도서 수 
	@RequestMapping("/admin/book/countRenBook.do")
	@ResponseBody
	public Map countRenBook(@RequestParam Map param) {
		
		// 파마미터 값 확인 
		Iterator i = param.keySet().iterator();
		while(i.hasNext()) {
			String key = (String)i.next();
			System.out.println(key + ":"+param.get(key));
		}
		
		List<Map> list = service.countRenBook(param);
		Map result = new HashMap();
		
		for(Map m : list) {
			result.put(String.valueOf(m.get("LENDING_DATE")).substring(0,10) , m.get("LENDING_COUNT"));
		}
		
		return result;
	}
	
	// 관심도서 랭킹 
	@RequestMapping("/admin/book/countLikBook.do")
	@ResponseBody
	public Map countLikBook() {
		
		List<Map> list = service.countLikBook();
		
		// Map 결과값 생성 
		Map result = new HashMap();
		int no = 1;
		for(Map m : list) {
			String bookName = no+++"." +((String)m.get("BOOK_NAME")).substring(0,5);
			String count = String.valueOf(m.get("LIKE_COUNT"));
			result.put(bookName, count);
		}
		
		return result;
	}
}
