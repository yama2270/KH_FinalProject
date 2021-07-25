package com.kh.klibrary.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPage {

	@RequestMapping("/main/mainPage.do")
	public String mainView() {
		
		return "../../index";
	}
}
