package com.kh.klibrary.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.common.PageFactory;
import com.kh.klibrary.qna.model.service.QnaService;
import com.kh.klibrary.qna.model.vo.Qna;
import static com.kh.klibrary.common.PagebarTemplate.getPagebar;
@Controller
public class QnaController {
	
	@Autowired //서비스 연결
	private QnaService service;
	
	//qna페이징처리
	@RequestMapping("qna/qnaList.do")
	public ModelAndView qnaList(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerPage, ModelAndView mv){
	 
	 List<Qna> list= service.selectQnaList(cPage,numPerPage);
	
	 mv.addObject("list",list);
	 mv.setViewName("qna/qnaList");
	 
	 int totalData=service.CountQna();
	 
	 int pageBarSize=5;
		
	 String pagebar=getPagebar(cPage, numPerPage, totalData, pageBarSize, "qnaList.do");
	 mv.addObject("pagebar",pagebar);
	 
	 return mv;
	}
	
	@RequestMapping("qna/qnaForm.do")
	String qnaForm() {
		return"qna/qnaForm";
	}
}
