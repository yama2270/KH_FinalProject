package com.kh.klibrary.admin.book.controller;

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
import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;

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
		System.out.println(list.get(0));
		System.out.println(list.get(3));
		System.out.println(list.get(6));
		System.out.println(list.get(8));
		m.addAttribute("list",list);
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
	
}
