package com.kh.klibrary.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.common.AdminPagingTemplate;
import com.kh.klibrary.admin.notice.model.vo.Notice;
import com.kh.klibrary.common.PageFactory;
import com.kh.klibrary.notice.model.service.NoticeService;
import com.kh.klibrary.studyroom.model.vo.StudyRoomA;
import com.kh.klibrary.studyroom.model.vo.StudyRoomBooKing;

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
	public ModelAndView noticesearch(@RequestParam Map param,
			@RequestParam(required=false,defaultValue="1") int cPage,
			@RequestParam(required=false,defaultValue="5") int numPerpage,
			ModelAndView mv) {
		System.out.println(param);
		List<Notice> list=service.searchnotice(param,cPage,numPerpage);
		
		int totalData=service.totalsearchnotice(param);

		String pageBar = new AdminPagingTemplate().searchKeyPagingTemplate(cPage,numPerpage,totalData);
		
		mv.addObject("list",list);
		mv.addObject("pageBar",pageBar);
		mv.addObject("param",param);
		System.out.println(param);
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
	
	
	@RequestMapping("/notice/redingroomA.do")
	public ModelAndView redingroomA(ModelAndView mv) {
		mv.addObject("list",service.redingroomA());
		int total=service.totalData();//총좌석갯수
		int usetotal=service.usetotal();//이용중인좌석갯수
		int Available=service.Available();//잔여좌석갯수
		int cannotused=service.cannotused();//사용불가좌석갯수
		System.out.println(total);
		mv.addObject("total",total);
		mv.addObject("usetotal",usetotal);
		mv.addObject("Available",Available);
		mv.addObject("cannotused",cannotused);
		mv.setViewName("redingroom/redingroomA");
		return mv;
	}
	
	@RequestMapping("/notice/redingroomB.do")
	public String redingroomB() {
		return "/redingroom/redingroomB";
	}
	
	@RequestMapping("/notice/redingroomC.do")
	public String redingroomC() {
		return "/redingroom/redingroomC";
	}
	
	@RequestMapping("/notice/redingroomD.do")
	public String redingroomD() {
		return "/redingroom/redingroomD";
	}
	
	
	@RequestMapping("/notice/redingroom.do")
	public ModelAndView redingroom(String seatno,String userid,ModelAndView mv) {
		System.out.println(seatno);
		List<StudyRoomBooKing> sr=service.selectreding(userid);
		if(sr.size()<1) {
			List<StudyRoomA> sa=service.selectareding(userid);
			if(sa.size()<1) {
				mv.addObject("list",service.redingroom(seatno));
				mv.setViewName("redingroom/redingroomAseat");
				return mv;
			}else {
				mv.addObject("msg","좌석을 사용중이신 회원입니다.");
				mv.addObject("script","window.close();");
				mv.setViewName("common/msg");
				return mv;
			}
		}else {
			mv.addObject("msg","이미 예약한 회원입니다.");
			mv.addObject("script","window.close();");
			mv.setViewName("common/msg");
			return mv;
		}
	}
	
	@RequestMapping("/notice/redingroombooking.do")
	public String redingroombooking(@RequestParam Map param, Model model) {
		System.out.println(param);
		int result=service.redingroombooking(param);
		model.addAttribute("msg",result>0?"예약되었습니다":"예약 실패 다시시도해주세요");
		model.addAttribute("script","window.close();");
		//model.addAttribute("loc","/notice/redingroomA.do");
		return "common/msg";
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
