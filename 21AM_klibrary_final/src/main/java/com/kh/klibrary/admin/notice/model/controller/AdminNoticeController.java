package com.kh.klibrary.admin.notice.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.notice.model.service.AdminNoticeService;
import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.common.PageFactory;
import com.kh.klibrary.admin.notice.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminNoticeController {
	@Autowired
	private AdminNoticeService service;

	@RequestMapping("/admin/notice/noticeList.do")
	public ModelAndView noticeList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, ModelAndView mv) {
		mv.addObject("list", service.selectNoticeList(cPage, numPerpage));
		mv.setViewName("admin/notice/noticeList");
		return mv;
	}

	@RequestMapping("/admin/notice/noticeForm.do")
	public String noticeForm() {
		return "admin/notice/noticeForm";
	}

	@RequestMapping("/admin/notice/noticeView.do")
	public ModelAndView noticeView(int noticeNo,ModelAndView mv) {
		
		mv.addObject("notice",service.selectNoticeView(noticeNo));
		mv.setViewName("admin/notice/noticeView");
		
		return mv;
	}

	@RequestMapping("/admin/notice/insertNotice.do")
		public String insertNotice() {
		return null;
		}
	}