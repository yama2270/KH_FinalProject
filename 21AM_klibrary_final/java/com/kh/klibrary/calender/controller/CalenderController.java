package com.kh.klibrary.calender.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.calender.service.CalenderService;
@Controller
public class CalenderController {
	@Autowired(required = false)
	private CalenderService service;
	
	@RequestMapping("/insertcalendar.do")
	@ResponseBody
	public Map calendar(@RequestParam Map param) {
		int c=service.insertCalender(param);
		System.out.println(param);
		Map test=new HashMap();
		test.put("calenderdate", c);
		return test;
	}
	
	@RequestMapping("/notice/calendar.do")
	@ResponseBody
	public ModelAndView calenderlist(ModelAndView mv) {
		mv.addObject("list",service.calenderlist());
		mv.setViewName("/facilities/calendar");
		return mv;
	}
	
	
	




}
