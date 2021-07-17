package com.kh.klibrary.admin.faq.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminFaqController {

	@RequestMapping("/admin/faq/adminfaqList.do")
	public String adminfaqList() {
		return "admin/faq/adminfaqList";
	}
}
