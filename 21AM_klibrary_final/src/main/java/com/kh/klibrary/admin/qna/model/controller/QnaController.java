package com.kh.klibrary.admin.qna.model.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class QnaController {

	@RequestMapping("/admin/qna/qnaMain.do")
	public String qnaMain() {
		return "admin/notice/qnaMain";
	}
	
	@RequestMapping("/admin/notice/qnaDetail.do")
	public String qnaDetail() {
		return "admin/notice/qnaDetail";
	}
}
