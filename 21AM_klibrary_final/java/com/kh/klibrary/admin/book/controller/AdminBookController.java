package com.kh.klibrary.admin.book.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.book.model.service.AdminBookService;
import com.kh.klibrary.book.model.vo.BookInfo;

@Controller
public class AdminBookController {

	@Autowired
	private AdminBookService service;

	// 도서목록
	@RequestMapping("/admin/book/bookAllList.do")
	public String bookAllList() {
		return "admin/book/bookAllList";
	}

	// 대출도서목록
	@RequestMapping("/admin/book/bookRentalList.do")
	public String rentalList() {
		return "admin/book/bookRentalList";
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

	// 국립중앙도서관 open api
	/*
	 * @RequestMapping(value="/admin/book/searchBook.do",produces=
	 * "application/xml;charset=UTF-8")
	 * 
	 * @ResponseBody public Object searchBook(@RequestParam Map param) { Object obj
	 * = service.searchBook(param); System.out.println(obj); return
	 * service.searchBook(param).getBody(); return obj; }
	 */
	
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
		
		int result = service.insertBook(bookInfo,newBook);
		mv.addObject("msg",result>0?"등록성공":"등록실패");
		mv.addObject("loc","/admin/book/registerBook.do");
		mv.setViewName("common/msg");
		return mv;
		
	}
	
}
