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
import com.kh.klibrary.admin.notice.model.vo.Attachment;
import com.kh.klibrary.admin.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminNoticeController {
	@Autowired
	private AdminNoticeService service;

	@RequestMapping("/admin/notice/noticeList.do")
	public String noticeList() {
		return "admin/notice/noticeList";
	}
	
	@RequestMapping("/admin/notice/noticeForm.do")
	public String noticeForm() {
		return "admin/notice/noticeForm";
	}
	
	@RequestMapping("/admin/notice/noticeView.do")
	public String noticeView() {
		return "admin/notice/noticeView";
	}
	
	@RequestMapping("/admin/notice/noticeInsert.do")
	public ModelAndView insertBoard(Notice notice,ModelAndView mv, 
			@RequestParam(value="upFile", required=false) MultipartFile[] upFile,
			HttpServletRequest req) {
		log.info("파일명 : "+upFile[0].getOriginalFilename());
		log.info("파일크기{} : ",upFile[0].getSize());
		log.info("파일명 : "+upFile[1].getOriginalFilename());
		log.info("파일크기{} : ",upFile[1].getSize());
		
		//저장경로설정하기 -> 실제경로를 가져와야함.
		String path=req.getServletContext().getRealPath("/resources/upload/notice/");
		File dir=new File(path);
		//폴더가 없다면 생성
		if(!dir.exists()) dir.mkdirs();
		
		//업로드처리하기 다중
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String originalFilename=f.getOriginalFilename();
				String ext=originalFilename.substring(originalFilename.lastIndexOf("."));
				//.jpg .pdf
				
				//리네임규칙설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum=(int)(Math.random()*10000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
				
				//리네임으로 파일업로드하기
				try {
					f.transferTo(new File(path+reName));
					
					notice.getAttachments().add(Attachment.builder()
							.originalFilename(originalFilename)
							.renamedFilename(reName).build());
					
				}catch(IOException e) {
					e.printStackTrace();
				}
				
			}
		}//for문끝
		
		log.info("{}",notice);
		
		String msg="등록성공";
		try {
			service.insertNotice(notice);
		}catch(RuntimeException e) {
			msg="등록실패";
			
			
			
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/admin/notice/noticeList.do");
		
		mv.setViewName("common/msg");
		return mv;
	}
	
}
