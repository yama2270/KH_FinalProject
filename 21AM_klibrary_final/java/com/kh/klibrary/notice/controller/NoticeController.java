package com.kh.klibrary.notice.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.common.PageFactory;
import com.kh.klibrary.notice.model.service.NoticeService;

@Controller	
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/notice/noticeList.do")
	public ModelAndView noticeList(@RequestParam(value="cPage", defaultValue="1") int cPage, 
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage,
			ModelAndView mv) {
		mv.addObject("list",service.selectNoticeList(cPage,numPerpage));
		int totalData=service.selectNoticeCount();
		mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage,"noticeList.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	@RequestMapping("/notice/noticeEnd.do")
	public ModelAndView noticeEnd(int no,ModelAndView mv) {
		mv.addObject("list",service.selectNoticeView(no));
		mv.setViewName("notice/noticeEnd");
		return mv;
	}
	
	@RequestMapping("/notice/noticesearch.do")
	public ModelAndView noticesearch(ModelAndView mv,String searchType,String text) {
		if(searchType.equals("제목")) {
		mv.addObject("list",service.searchnotice(text));
		}else {
			mv.addObject("list", service.searchnoticecontent(text));
		}
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	//파일다운로드
//	@RequestMapping("/notice/noticefileDownload.do")
//	public void fileDownload(@RequestParam(value="originalname") String originalname,
//			@RequestParam(value="rename") String rename,
//			HttpServletResponse resp,
//			HttpServletRequest req,
//			@RequestHeader(value="user-agent") String header) {
//		String path=req.getServletContext().getRealPath("/resources/upload/notice/");
//		File saveFile=new File(path+rename);
//		
//		BufferedInputStream bis=null;
//		ServletOutputStream sos=null;
//		try {
//			bis=new BufferedInputStream(new FileInputStream(saveFile));
//			sos=resp.getOutputStream();
//			boolean isMs=header.indexOf("Trident")!=-1||header.indexOf("MSIE")!=-1;
//			String encodeStr="";
//			if(isMs) {
//				encodeStr=URLEncoder.encode(originalname,("UTF-8"));
//				encodeStr=encodeStr.replaceAll("\\+", "%20");
//			}else {
//				encodeStr=new String(originalname.getBytes("UTF-8"),"ISO-8859-1");
//			}
//			resp.setContentType("application/octet-stream;charset=utf-8");
//			resp.setHeader("Content-Disposition", "attachment;filename=\""+encodeStr+"\"");
//			
//			int read=-1;
//			while((read=bis.read())!=-1) {
//				sos.write(read);
//			}
//		}catch(IOException e) {
//			e.printStackTrace();
//		}finally {
//			try {
//			bis.close();
//			sos.close();
//			}catch(IOException e) {
//				e.printStackTrace();
//			}
//		}
//	}
	
	@RequestMapping("/notice/booktime.do")
	public String booktime() {
		return "/facilities/booktime";
	}
	@RequestMapping("/notice/copymachine.do")
	public String copymachine() {
		return "/facilities/copymachine";
	}
	
	
	@RequestMapping("/notice/redingroom.do")
	public String redingroom() {
		return "/redingroom/redingroom";
	}
	@RequestMapping("/notice/redingroomnotice.do")
	public String redingroomnotice() {
		return "/redingroom/redingroomnotice";
	}
	@RequestMapping("/notice/redingroomseat.do")
	public String redingroomseat() {
		return "/redingroom/redingroomseat";
	}
	@RequestMapping("/notice/parkinglot.do")
	public String parkinglot() {
		return "/facilities/parkinglot";
	}
	
	/*
	 * @RequestMapping("/notice/calendar.do") public String calendar() {
	 * 
	 * return "/facilities/calendar"; }
	 */
	
	
	
	

}
