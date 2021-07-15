package com.kh.klibrary.admin.qna.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {

	@RequestMapping("/admin/qna/qnaMain.do")
	public String qnaMain() {
		return "admin/qna/qnaMain";
	}
	
	@RequestMapping("/admin/qna/qnaDetail.do")
	public String qnaDetail() {
		return "admin/qna/qnaDetail";
	}
}
	