package com.kh.klibrary.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// MainPage -> WelcomeController 혹은 MainPageController 명명규칙 변경
@Controller
public class MainPageController {
	
	@RequestMapping("/")
	public String index() {
		
		return "../../index";
	}

}
