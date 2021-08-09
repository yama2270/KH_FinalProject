package com.kh.klibrary.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.notice.model.service.NoticeService;
import com.kh.klibrary.search.service.SearchService;

// MainPage -> WelcomeController 혹은 MainPageController 명명규칙 변경
@Controller
public class MainPageController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private SearchService searchService;
	/*
	 * @RequestMapping("/") public String index(Model model) { // 1. 전체 게시판(공지, faq
	 * 포함 기타 등등) 최신 데이터 날짜 desc 기준으로 7개 조회 // 2. 여기서 공지사항 게시판 데이터만 추출 //List<Notice>
	 * notices = noticeService.findRecentNotices(); //model.addAttribute("notices",
	 * notices);
	 * //List<Notice> notices = new ArrayList<>(); model.addAttribute("notices",
	 * notices); return "VIEW RETURN"; }
	 */
	
	@RequestMapping("/")
	public String index(Model model) {
		
		List<BookInfo> recomendBook = searchService.bookRecomend();
		List<Notice> notices = noticeService.findRecentNotices();
		
		model.addAttribute("notices", notices);
		model.addAttribute("recomendBook", recomendBook);
		 
		
		return "index";
	}

}
