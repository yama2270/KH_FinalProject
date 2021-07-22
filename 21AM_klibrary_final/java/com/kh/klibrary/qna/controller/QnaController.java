package com.kh.klibrary.qna.controller;

import static com.kh.klibrary.common.PagebarTemplate.getPagebar;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.qna.model.service.QnaService;
import com.kh.klibrary.qna.model.vo.Attachment;
import com.kh.klibrary.qna.model.vo.Qna;
@Controller
public class QnaController {
	
	@Autowired //서비스 연결
	private QnaService service;
	
	//QNA 검색
	@PostMapping("/qna/qnaSearch.do")
	public String qnaSearch(@RequestParam("category") String title, @RequestParam(required=false)String keyWord, Model model) {
		//공백이면
		if(!StringUtils.hasText(keyWord)) {
			return "redirect:/qna/qnaList";
		}
		if("제목".equals(title)) {
			model.addAttribute("list",service.searchQnaTitle(keyWord));
		}else {
			model.addAttribute("list", service.searchQnaContent(keyWord));
		}
		
		return "/qna/qnaSearch";
	}
	
	//qnaUpdate(수정)
	@GetMapping("/qna/updateQna.do")
	public String qnaUpdate(Model model, int no) {
		
		//jsp에 수정할 데이터 보내기.(데이터 db에 있음.)
		
		model.addAttribute("qna", service.selectQnaView(no));
		return "qna/qnaUpdate";
	}
	
	@PostMapping("/qna/updateQna.do")
	public String qnaUpdateEnd(Qna q) {
		
		service.updateQna(q); //qna수정된거 보내줌
		
		return "redirect:/qna/qnaView.do?no="+q.getQnaNo();
	}
	
	
	
	//qnaView보기(읽기)
	@RequestMapping("/qna/qnaView.do")
	public ModelAndView qnaView(int no, ModelAndView mv) {
		mv.addObject("qna", service.selectQnaView(no));
		mv.setViewName("qna/qnaView");
		return mv;
		
	}

	//qna페이징처리
	@RequestMapping("/qna/qnaList.do")
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
	
	@RequestMapping("/qna/qnaForm.do")
	String qnaForm() {
		return"qna/qnaForm";
	}
	
	// qna등록
	@RequestMapping("/qna/insertQna.do")
	public ModelAndView qnaInsert(Qna qna, ModelAndView mv,
	@RequestParam(value="upFile", required=false) MultipartFile[] upFile,
	HttpServletRequest req){
	//파일 저장경로
	String path=req.getServletContext().getRealPath("/resources/upload/qna/");

	
		//디렉토리 없을경우 자동으로 만들어지게함
		File dir= new File(path);
		if(!dir.exists()) {
			dir.mkdir();
		}

		//파일 업로드 처리
		for(MultipartFile f : upFile) {

			if(!f.isEmpty()) {
				//오리지널 파일명
				String originalFileName=f.getOriginalFilename();
				//확장자
				String ext=originalFileName.substring(originalFileName.lastIndexOf("."));
				//rename규칙설정
				SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int randomNum =(int)(Math.random()*10000);
				String reName=sdf.format(System.currentTimeMillis()) +"_" + randomNum + ext;

				//rename 된 파일로 업로드
				try {
					f.transferTo(new File(path+reName));
					qna.getAttachments().add(Attachment.builder().originalFileName(originalFileName).renameFileName(reName).build());
				}catch(IOException e) {
					e.printStackTrace();
				}

			}
		}
		
		String msg="등록성공";
		try {
			service.insertQna(qna);
		}catch(RuntimeException e) {
			msg="등록실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/qna/qnaList.do");
		
		mv.setViewName("redirect:/qna/qnaList.do");
		return mv;
	}

		
	}

