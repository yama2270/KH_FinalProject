package com.kh.klibrary.admin.studyroom.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.studyroom.model.service.AdminStudyroomService;
import com.kh.klibrary.admin.studyroom.model.vo.AdminStudyroom;
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
	
	// 열람실 예약목록 수정 
	@RequestMapping("/admin/studyroom/modiBooking.do")
	public String modiBooking(AdminStudyroomBooking booking,Model mo) {
		
		// 1. 예약정보 - 열람실이름,좌석번호,시작시간,종료시간
		mo.addAttribute("bookingInfo",booking);
		
		// 2. 예약가능 시간설정
		// 		1. 예약테이블 - booking no 제외,해당 좌석 시간 => 시작시간 / 종료시간
		mo.addAttribute("bookingTime",service.selBookingTime(booking));
		// 		2. 열람실에서 해당 열람실 현재 이용중 여부 파악 - 열람실 변호,좌석번호 => 시작시간 / 종료시간
		mo.addAttribute("usingTime",service.selUsingTime(booking));
		
		
		return "admin/studyroom/modiBooking"; 
	}
	
	// 열람실 예약수정 - 열람실 변경 이벤트 
	@RequestMapping("/admin/studyroom/selSeatTime")
	@ResponseBody
	public Map selSeatTime(@RequestParam Map param){
		
		List<Map> listMap = service.selBookingTime(param);
		
		Map usingTime = service.selUsingTime(param);
		
		Map result = new HashMap();
		result.put("bookingTime", listMap);
		result.put("usingTime", usingTime);
		return result; 
	}
	
	// A열람실
	@RequestMapping("/admin/studyroom/studyroomA.do")
	public String studyroomA(Model mo) {
		
		// 현황조회 
		List<Map> listMana = service.selectInfoA();
		
		Map manage = new HashMap(); 
		for(Map m : listMana) {
			manage.put(m.get("STATUS"), m.get("COUNT"));
		}
		
		// 좌석조회
		List<AdminStudyroom> listStudy = service.selectListA();
		 
		mo.addAttribute("manage",manage);
		mo.addAttribute("listStudy",listStudy);
		
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
