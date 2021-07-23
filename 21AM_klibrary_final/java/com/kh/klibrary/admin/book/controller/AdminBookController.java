package com.kh.klibrary.admin.book.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
import com.kh.klibrary.member.model.vo.Lending;

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
							   @RequestParam(required=false,defaultValue="2") int numPerPage,ModelAndView mv) {
		
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
		m.addAttribute("list",list);
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
	// 예약도서목록
	@RequestMapping("/admin/book/bookReservedList.do")
	public String reservedList() {
		return "admin/book/bookReservedList";
	}

	// 희망도서목록
	@RequestMapping("/admin/book/bookWishList.do")
	public String wishList() {
		return "admin/book/bookWishList";
	}

	//
	@RequestMapping("/admin/book/registerBook.do")
	public String registerBook() {
		return "admin/book/registerBook";
	}

	@RequestMapping("/admin/book/bookDetail.do")
	public String bookDetail() {
		return "admin/book/bookDetail";
	}

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
}
