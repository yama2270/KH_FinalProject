package com.kh.klibrary.admin.qna.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminQnaController {

	@RequestMapping("/admin/qna/adminqnaList.do")
	public String adminqnaList() {
		return "admin/qna/adminqnaList";
	}
	
	@RequestMapping("/admin/qna/qnaView.do")
	public String qnaView() {
		return "admin/qna/qnaView";
	}
}
	