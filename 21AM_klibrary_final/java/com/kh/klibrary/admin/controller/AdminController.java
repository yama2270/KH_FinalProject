package com.kh.klibrary.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.klibrary.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin/main.do")
	public String main() {
		return "admin/main";
	}
	
	
	// admin - main - 방문자수
	@RequestMapping("/admin/countVis.do")
	@ResponseBody
	public Map countVis(@RequestParam Map param) {
		List<Map> list = service.countVis(param);
		Map result = new HashMap();
		for(Map m : list) {
			 result.put(String.valueOf(m.get("VISITOR_DATE")).substring(0,10),m.get("VISITOR_COUNT"));
		}
		return result;
	}
	
}
