/*
 * package com.kh.klibrary.notice.controller;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.servlet.ModelAndView;
 * 
 * import com.kh.klibrary.common.PageFactory; import
 * com.kh.klibrary.notice.service.NoticeService;
 * 
 * @Controller public class NoticeController {
 * 
 * @Autowired private NoticeService service;
 * 
 * @RequestMapping("/notice/noticeList.do") public ModelAndView noticeList(
 * 
 * @RequestParam(value="cPage", defaultValue="1") int cPage,
 * 
 * @RequestParam(value="numPerpage", defaultValue="5") int numPerpage,
 * ModelAndView mv) {
 * mv.addObject("list",service.selectNoticeList(cPage,numPerpage)); int
 * totalData=service.selectNoticeCount();
 * mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage,
 * "noticeList.do")); mv.addObject("totalData", totalData);
 * mv.setViewName("notice/noticeList");
 * 
 * return mv; }
 * 
 * @RequestMapping("/notice/noticeEnd.do") public String noticeEnd() { return
 * "notice/noticeEnd"; }
 * 
 * 
 * 
 * }
 */