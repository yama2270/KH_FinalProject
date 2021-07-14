package com.kh.klibrary.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller//어노테이션 처리
public class FaqController {
	
	@RequestMapping("/faq/faqList.do")
	public String faqList() {
		System.out.println("test");
		return"faq/faqList"; // 접두어 web-inf 접미어 .jsp
		
	}
}
