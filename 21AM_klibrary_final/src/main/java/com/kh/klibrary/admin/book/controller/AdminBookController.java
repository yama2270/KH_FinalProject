package com.kh.klibrary.admin.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminBookController {

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
	
	@RequestMapping("admin/book/bookDetail.do")
	public String bookDetail() {
		return "admin/book/bookDetail";
	}
	
}
 