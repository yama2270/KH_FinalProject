package com.kh.klibrary;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.notice.model.service.NoticeService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/indextest")
@RequiredArgsConstructor
@Controller
public class WelcomeController {
	
	private final NoticeService noticeService;
	
	// 컨트롤러 코드는 항상 깔끔하게
	public String index(Model model) {
		// 1. 전체 게시판(공지, faq 포함 기타 등등) 최신 데이터 날짜 desc 기준으로 7개 조회
		// 2. 여기서 공지사항 게시판 데이터만 추출
		//List<Notice> notices = noticeService.findRecentNotices(); 
		//model.addAttribute("notices", notices);
		
		/*
		List<Notice> notices = new ArrayList<>();
		for(Aritlce article : articles) {
			// 공지사항인지 아닌지
			if(article.isNotice()) {
				notices.add(article);
			}
		}
		model.addAttribute("notices", notices);
		*/

		
		
		return "VIEW RETURN";
	}

}
