package com.kh.klibrary.admin.studyroom.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.studyroom.model.service.AdminStudyroomService;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomBooking;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroomManage;

@Controller
public class AdminStudyroomController {
	
	@Autowired
	AdminStudyroomService service;
	
	//열람실 전체조회
	@RequestMapping("/admin/studyroom/studyroomAllList.do")
	public ModelAndView studyAllList(ModelAndView mv) {
		
		// 열람실 총 조회 
		Map toManage = service.toManage();
		
		// 열람실 조회 
		List<AdminStudyroomManage> manageList = service.selectManageList();
		
		// 예약현황 
		
		List<AdminStudyroomBooking> bookingList = service.selectBookingList();
		
		mv.addObject("toManage",toManage);
		mv.addObject("manageList",manageList);
		mv.addObject("bookingList",bookingList);
		
		mv.setViewName("admin/studyroom/studyroomAllList");
		return mv;
	}
	
	// 열람실 예약목록 삭제
	@RequestMapping("/admin/studyroom/delBooking.do")
	public ModelAndView delBooking(ModelAndView mv,
						@RequestParam int bookingNo) {
		
		mv.addObject("msg",service.delBooking(bookingNo)>0?"삭제성공":"삭제실패");
		mv.addObject("loc","/admin/studyroom/studyroomAllList.do");
		mv.setViewName("common/msg");
		return mv;
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
