package com.kh.klibrary.admin.studyroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminStudyroomController {
	
	@RequestMapping("/admin/studyroom/studyroomAllList.do")
	public String studyAllList() {
		return "admin/studyroom/studyroomAllList";
	}
	
	@RequestMapping("/admin/studyroom/studyroomA.do")
	public String studyroomA() {
		return "admin/studyroom/studyroomA";
	}
	
	@RequestMapping("/admin/studyroom/studyroomB.do")
	public String studyroomB() {
		return "admin/studyroom/studyroomB";
	}
	
	@RequestMapping("/admin/studyroom/studyroomC.do")
	public String studyroomC() {
		return "admin/studyroom/studyroomC";
	}
	
	@RequestMapping("/admin/studyroom/studyroomD.do")
	public String studyroomD() {
		return "admin/studyroom/studyroomD";
	}
}
