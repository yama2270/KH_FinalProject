package com.kh.klibrary.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/admin/main.do")
	public String main() {
		return "admin/main";
	}
	
	
	
}
