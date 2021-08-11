package com.kh.klibrary.admin.book.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.admin.book.model.service.AdminBookService;
import com.kh.klibrary.admin.common.AdminPagingTemplate;
import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.common.PageFactory;
import com.kh.klibrary.member.model.vo.Booking;
import com.kh.klibrary.member.model.vo.BookingHistory;
import com.kh.klibrary.member.model.vo.Lending;
import com.kh.klibrary.member.model.vo.LendingHistory;

@Controller
public class AdminBookController {

	@Autowired
	private AdminBookService service;

	// 도서목록
	@RequestMapping("/admin/book/bookAllList.do")
	public String bookAllList(
			@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",required=false,defaultValue="10") int numPerPage, 
			Model m) {
		List<Book> list = service.selectBookList(cPage,numPerPage);
		
		// 총 도서 구하기 
		int totalBook = service.totalBook();
		String pageBar = new AdminPagingTemplate().adminPagingTemplate(cPage,numPerPage,totalBook);
		
		m.addAttribute("list",list);
		m.addAttribute("pageBar",pageBar);
		return "admin/book/bookAllList";
	}

	// 도서목록 - 검색 
	@RequestMapping("/admin/book/searchKeyBook.do")
	public ModelAndView searchTypeBook(@RequestParam Map param, 
							   @RequestParam(required=false,defaultValue="1") int cPage,
							   @RequestParam(required=false,defaultValue="10") int numPerPage,ModelAndView mv) {
		
		// 도서 key 검색
		List<Book> list = service.searchKeyBook(param,cPage,numPerPage);

		// 총 도서 구하기 
		int totalBook = service.totalKeyBook(param);
		// pageBar 
		String pageBar = new AdminPagingTemplate().searchKeyPagingTemplate(cPage,numPerPage,totalBook);
		
		mv.addObject("list",list);
		mv.addObject("pageBar",pageBar);
		mv.addObject("param",param);
		mv.setViewName("admin/book/bookAllList");
		
		return mv;
	}
	
	// 도서목록 - 상세검색 
	@RequestMapping("/admin/book/searchDetBook.do")
	public ModelAndView searchDetBook(@RequestParam Map param,
							@RequestParam(required=false,defaultValue="1") int cPage,
							@RequestParam(required=false,defaultValue="10") int numPerPage,
							ModelAndView mv 
			) {
		
		// 파라미터 데이터 체크 
//		Iterator iterator = param.keySet().iterator();
//		while(iterator.hasNext()) {
//			String key = (String)iterator.next();
//			System.out.println(key +":"+param.get(key));
//		}
		
		// 초성 배열로 변경 
		if(!((String)param.get("iniArr")).equals("")){
			param.put("iniArr",((String)param.get("iniArr")).split(","));
		}
		
		
		List<Book> list = service.searchDetBook(param,cPage,numPerPage);
		int totalData = service.totalDetBook(param);
		String pageBar = new AdminPagingTemplate().searchDetPagingTemplate(cPage,numPerPage,totalData);
		
		mv.addObject("list", list);
		mv.addObject("pageBar", pageBar);
		
		mv.setViewName("admin/book/searchDetBookAjax");
		
		return mv;
	}
	
	// 도서목록 - 도서삭제 
	@RequestMapping("/admin/book/deleteBook.do")
	public String deleteBook(@RequestParam String bookNo,Model mo) {
		
		// 도서번호 받기 
		Map m = new HashMap();
		m.put("bookNo",bookNo.split(","));
		
		mo.addAttribute("msg",service.deleteBook(m)>0?"삭제성공":"삭제실패");
		mo.addAttribute("loc","/admin/book/bookAllList.do");
		return "common/msg";
	}
	
	// 대출도서목록
	@RequestMapping("/admin/book/bookRentalList.do")
	public String rentalList(Model m, @RequestParam Map param,
							@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
							@RequestParam(value="numPerPage",required=false,defaultValue="10") int numPerPage,
							@RequestParam(value="cPage2",required=false,defaultValue="1") int cPage2,
							@RequestParam(value="numPerPage2",required=false,defaultValue="10") int numPerPage2) {
		List<Lending> list= null;
		List<LendingHistory> hlist= null;
		int totalBook=0;
		int totalBook2=0;
		System.out.println("searchOption : " + param.get("searchOption"));
		System.out.println("searchOption2 : " + param.get("searchOption2"));
		if(param.get("searchWord")!=null) {
			list=service.searchRentalList(param, cPage, numPerPage);
			totalBook = service.searchRentalCount(param);
		}else {
			list=service.selectRentalList(cPage, numPerPage);
			totalBook = service.selectRentalCount();
		}
		
		if(param.get("searchWord2")!=null) {
			hlist=service.searchRentalHList(param,cPage,numPerPage);
			totalBook2=service.searchRentalHCount(param);
		}else {
			hlist=service.selectRentalHList(cPage2, numPerPage2);
			totalBook2= service.selectRentalHCount();
		}
		
		String pageBar = new AdminPagingTemplate().adminPagingTemplate(cPage,numPerPage,totalBook);
		String pageBar2 = new AdminPagingTemplate().adminPagingTemplate2(cPage2,numPerPage2,totalBook2);
		
		m.addAttribute("list",list);
		m.addAttribute("pageBar",pageBar);
		m.addAttribute("hlist",hlist);
		m.addAttribute("pageBar2",pageBar2);
		return "admin/book/bookRentalList";
	}
	
	//도서 연장
	@RequestMapping("/admin/book/addBookExtend.do")
	public String addBookExtend(@RequestParam Map param, Model model) {
		int bookExtend=Integer.parseInt(param.get("bookExtend").toString());
		param.put("bookExtend", bookExtend+1);
		param.put("returnDate", addDate(param.get("returnDate").toString()));
		String msg="연장 횟수 3회로 추가연장 실패하였습니다.";
		String loc="/admin/book/bookRentalList.do";
		if(param.get("checkloc")==null) {
			loc="/admin/book/bookRentalList.do";
		}else {
			loc="/member/memberBorrowing.do";
		}
		if(bookExtend>=3){
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}else {
			int result=service.addBookExtend(param);
			msg="연장에 실패하였습니다.";
			if(result>0) {
				msg="연장에 성공하였습니다.";
			}
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
		}
		return "common/msg";
	}
	
	//도서 반납
	@RequestMapping("/admin/book/returnBook.do")
	public String returnBook(@RequestParam Map param, Model model) {
		String msg="도서반납을 실패햐였습니다.";
		String loc="/admin/book/bookRentalList.do";
		Lending ld = service.selectLending(param);
		int lhResult=service.insertLendingHistory(ld);
		int rbResult=service.returnBook(param);
		if(lhResult+rbResult==2) {
			msg="도서를 반납하였습니다.";
		}else if(lhResult+rbResult<2) {
			if(lhResult==1) {
				msg="대출이력내역 삽입 실패";
			}else if(rbResult==1) {
				msg="대출내역 삭제 실패";
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	//대출 도서 체크 반납
	@RequestMapping("/admin/book/deleteRentalCheck.do")
	public String deleteRentalCheck(@RequestParam String lendingNo, Model model) {
		Map map=new HashMap();
		map.put("lendingNo", lendingNo.split(","));
		List<Lending> list=service.selectDRTCList(map); //체크도서 선택(여러개)
		int result=service.insertDRTCList(list); //선택된 체크도서 내역도서에 삽입
		result+=service.deleteRentalCheck(map);
		model.addAttribute("msg",result>2?"체크된 도서의 반납을 성공하였습니다.":"체크된 도서의 반납를 실패하였습니다.");
		model.addAttribute("loc","/admin/book/bookRentalList.do");
		return "common/msg";
	}
	// 예약도서목록
	@RequestMapping("/admin/book/bookReservedList.do")
	public String reservedList(Model m, @RequestParam Map param,
			@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",required=false,defaultValue="10") int numPerPage) {
		
		List<Booking> list=null;
		List<BookingHistory> hlist=null;
		int totalBook=0;
		if(param.get("searchWord")!=null) {
			list=service.searchReservedList(param);
		}else if(param.get("searchWord")==null) {
			list=service.reservedList();
		}
		
		if(param.get("searchWordH")!=null) {
			hlist=service.searchReservedHistoryList(param, cPage, numPerPage);
			totalBook = service.searchReservedHistoryCount(param);
			
		}else if(param.get("searchWordH")==null) {
			hlist=service.reservedHistoryList(cPage, numPerPage);
			totalBook = service.reservedHCount();
		}
		String pageBar=new AdminPagingTemplate().adminPagingTemplate(cPage,numPerPage,totalBook);
		m.addAttribute("list",list);
		m.addAttribute("hlist",hlist);
		m.addAttribute("param",param);
		m.addAttribute("pageBar",pageBar);
		return "admin/book/bookReservedList";
	}
	
	//예약도서 체크 삭제
	@RequestMapping("/admin/book/deleteReservedCheck.do")
	public String deleteReservedCheck(@RequestParam String bookingNo, Model model) {
		Map map = new HashMap();
		map.put("bookingNo", bookingNo.split(","));
		List<Booking> list=service.selectDRCList(map); //체크도서 선택(여러개)
		int result=service.insertDRCList(list); //선택된 체크도서 내역도서에 삽입
		result+=service.deleteReservedCheck(map);
		model.addAttribute("msg",result>2?"체크된 예약의 취소를 성공하였습니다.":"체크된 예약의 취소를 실패하였습니다.");
		model.addAttribute("loc","/admin/book/bookReservedList.do");
		return "common/msg";
	}
	
	//예약취소
	@RequestMapping("/admin/book/cancelReserved.do")
	public String cancelReserved(Model m, @RequestParam Map param) {
		String msg="도서예약 취소를 실패햐였습니다.";
		String loc="/admin/book/bookReservedList.do";
		Booking booking = service.selectBooking(param);
		int bhResult=service.insertBookingHistory(booking);
		int ccResult=service.cancelReserved(param);
		if(bhResult+ccResult==2) {
			msg="도서예약을 취소하였습니다.";
		}else if(bhResult+ccResult<2) {
			if(bhResult==1) {
				msg="도서예약내역 삽입 실패";
			}else if(ccResult==1) {
				msg="도서예약 삭제 실패";
			}
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "common/msg";
	}
	


	// 도서 등록 
	@RequestMapping("/admin/book/registerBook.do")
	public String registerBook() {
		return "admin/book/registerBook";
	}
	
	// 도서상세 
	@RequestMapping("/admin/book/bookDetail.do")
	public ModelAndView bookDetail(@RequestParam String bookNo,ModelAndView mv) {
		Book b = service.selectBook(bookNo);
		List<LendingHistory> h = service.selectLenHis(bookNo);
		mv.addObject("b",b);
		mv.addObject("h",h);
		mv.setViewName("admin/book/bookDetail");
		return mv;
	}
	
	// 도서 ISBN 검색 
	@RequestMapping("/admin/book/searchIsbn.do")
	public String searchIsbn() {
		return "admin/book/searchIsbn";
	}
	
	// isbn 중복여부 확인
	@RequestMapping("/admin/book/checkIsbn.do")
	@ResponseBody
	public Map checkIsbn(String isbnNo) {
		int result = service.checkIsbn(isbnNo);
		Map map = new HashMap();
		map.put("flag", result!=0?"false": "true");
		return map;
	}
	
	// 도서등록 
	@RequestMapping("/admin/book/insertBook.do")
	public ModelAndView insertBook(BookInfo bookInfo,String newBook,ModelAndView mv,HttpServletRequest req) {
		
//		int result = service.insertBook(bookInfo,newBook);
//		mv.addObject("msg",result>0?"등록성공":"등록실패");
		
		//transaction 처리하기
		String msg = "등록성공";
		try {
			service.insertBook(bookInfo, newBook);
		} catch(RuntimeException e) {
			msg = "등록실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/admin/book/registerBook.do");
		
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	public String addDate(String date) {
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			Date d=format.parse(date);
			
			Calendar cal=Calendar.getInstance();
			cal.setTime(d);
			cal.add(Calendar.DATE, 7);
			
			date=format.format(cal.getTime());
			
		}catch(Exception e) {
			
		}
		return date;
	}
	
	// 카테고리별 도서수 
	@RequestMapping("/admin/book/countCatBook.do")
	@ResponseBody
	public Map countCatBook() {
		List<Map<String,Integer>> m = service.countCatBook();
		/* System.out.println(String.valueOf(m.get(0).get("BOOKS"))); */
		// 파싱처리해주기 
		Map hm = new HashMap();
		int key = 0;
		for(Map<String,Integer> ma : m) {
			hm.put(key++, ma.get("BOOKS"));
		}
		return hm;
	}
	
	// 기간별 대출도서 수 
	@RequestMapping("/admin/book/countRenBook.do")
	@ResponseBody
	public Map countRenBook(@RequestParam Map param) {
		
		// 파마미터 값 확인 
		Iterator i = param.keySet().iterator();
		while(i.hasNext()) {
			String key = (String)i.next();
			System.out.println(key + ":"+param.get(key));
		}
		
		List<Map> list = service.countRenBook(param);
		Map result = new HashMap();
		
		for(Map m : list) {
			result.put(String.valueOf(m.get("LENDING_DATE")).substring(0,10) , m.get("LENDING_COUNT"));
		}
		
		return result;
	}
	
	// 관심도서 랭킹 
	@RequestMapping("/admin/book/countLikBook.do")
	@ResponseBody
	public Map countLikBook() {
		
		List<Map> list = service.countLikBook();
		
		// Map 결과값 생성 
		Map result = new HashMap();
		int no = 1;
		for(Map m : list) {
			String bookName = no+++"." +((String)m.get("BOOK_NAME")).substring(0,5);
			String count = String.valueOf(m.get("LIKE_COUNT"));
			System.out.println(bookName + ":" +count);
			result.put(bookName, count);
		}
		
		return result;
	}
	
	//추천도서
	@RequestMapping("/admin/book/bookRecommendList.do")
	public String recommendList() {
		
		return "admin/book/bookRecommendList";
	}
	
	
	//희망도서 리스트
	
	  @RequestMapping("/admin/book/bookWishList.do") public ModelAndView
	  bookWishList(
	  @RequestParam(value = "cPage", defaultValue = "1") int cPage,
	  @RequestParam(value = "numPerpage", defaultValue = "4") int numPerpage,
	  ModelAndView mv) { mv.addObject("list", service.selectBookWishList(cPage,
	 numPerpage)); int totalData=service.selectWishBookCount();
	  mv.addObject("pageBar",PageFactory.getPageBar(totalData,cPage,numPerpage,
	  "bookWishList.do")); mv.setViewName("admin/book/bookWishList"); return mv; 
	  }
	 
	
	//희망도서 삭제
	@RequestMapping("/admin/book/wishBookDelete.do")
	public String ajaxTest(HttpServletRequest request) throws Exception{
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0;i<size; i++) {
			service.deleteWishBook(ajaxMsg[i]);
		}
		return "redirect:/admin/book/bookWishList.do";
	}
	
	//희망도서 구매 (도서등록페이지로 이동)
	@RequestMapping("/admin/book/insertWishBook.do")
	public String insertWishBook(String bookName,String wishBookNo,Model m) {	
		m.addAttribute("bookName",bookName);
		m.addAttribute("wishBookNo",wishBookNo);
		return "admin/book/insertWishBook";
	}
	
	//희망도서 검색
	@RequestMapping("/admin/book/insertWishBook")
	@ResponseBody
	public Map insertWishBook(@RequestParam Map m,@RequestParam(value="wishBookNo") String wishBookNo) {
		
		int result = service.insertWishBookToBookInfo(m);
		result += service.insertWishBookToBook(m);
		result += service.deleteWishBook(wishBookNo);
		
		Map resultMap = new HashMap(); 
		resultMap.put("msg",result>1?"성공":"실패");
		return resultMap;
	}
	
}
