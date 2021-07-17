package com.kh.klibrary.admin.studyroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminStudyroomController {
	
	//열람실 전체조회
	@RequestMapping("/admin/studyroom/studyroomAllList.do")
	public String studyAllList() {
		return "admin/studyroom/studyroomAllList";
	}
	
	// A열람실
	@RequestMapping("/admin/studyroom/studyroomA.do")
	public String studyroomA() {
		return "admin/studyroom/studyroomA";
	}
	
	// B열람실
	@RequestMapping("/admin/studyroom/studyroomB.do")
	public String studyroomB() {
		return "admin/studyroom/studyroomB";
	}
	
	// C열람실 
	@RequestMapping("/admin/studyroom/studyroomC.do")
	public String studyroomC() {
		return "admin/studyroom/studyroomC";
	}
	
	// D열람실
	@RequestMapping("/admin/studyroom/studyroomD.do")
	public String studyroomD() {
		return "admin/studyroom/studyroomD";
	}
}
