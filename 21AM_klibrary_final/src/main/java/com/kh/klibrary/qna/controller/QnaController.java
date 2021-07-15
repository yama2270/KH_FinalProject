package com.kh.klibrary.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {
	@RequestMapping("qna/qnaList.do")
	String qnalist() {
		return "qna/qnaList";
	}
	
	@RequestMapping("qna/qnaForm.do")
	String qnaForm() {
		return"qna/qnaForm";
	}
}
