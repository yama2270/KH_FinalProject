package com.kh.klibrary.admin.book.model.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class BookController {

	@RequestMapping("/admin/book/registerBook.do")
	public String registerBook() {
		return "admin/book/registerBook";
	}
	
}
 