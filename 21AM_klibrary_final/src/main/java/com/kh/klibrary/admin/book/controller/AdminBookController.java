package com.kh.klibrary.admin.book.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.klibrary.admin.book.model.service.AdminBookService;

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
	
	
	/*
	 * @RequestMapping("/admin/book/searchBook.do")
	 * 
	 * @ResponseBody public void searchBook(@RequestParam String
	 * searchKey,@RequestParam String searchName) { System.out.println(searchKey);
	 * System.out.println(searchName); }
	 */
	
}
