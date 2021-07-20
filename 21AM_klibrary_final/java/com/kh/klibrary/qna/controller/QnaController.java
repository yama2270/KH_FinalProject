package com.kh.klibrary.qna.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.common.PageFactory;
import com.kh.klibrary.qna.model.service.QnaService;
import com.kh.klibrary.qna.model.vo.Attachment;
import com.kh.klibrary.qna.model.vo.Qna;
import static com.kh.klibrary.common.PagebarTemplate.getPagebar;
@Controller
public class QnaController {
	
	@Autowired //서비스 연결
	private QnaService service;
	
	
	
	
	//qnaView보기(읽기)
	@RequestMapping("qna/qnaView.do")
	public ModelAndView qnaView(int no, ModelAndView mv) {
		mv.addObject("qna", service.selectQnaView(no));
		mv.setViewName("qna/qnaView");
		return mv;
		
	}

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
	
	// qna등록
	@RequestMapping("qna/insertQna.do")
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
