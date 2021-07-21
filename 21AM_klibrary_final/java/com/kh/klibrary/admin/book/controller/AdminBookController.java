package com.kh.klibrary.admin.book.controller;

import java.util.HashMap;
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
import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.book.model.vo.BookInfo;

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
		int totalPage = (int)Math.ceil((double)totalBook/numPerPage);
		
		// 페이지바
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		// 페이지 바 
		String pageBar = "<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>이전</a>";
			pageBar +="</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			} else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		// ${}은 넘길수 없다. 
//		pageBar += "<script>";
//		pageBar += "function fn_paging(cPage){";
//		pageBar += "location.assign('$${{path}}/admin/book/bookAllList.do');";
//		pageBar += "}";
//		pageBar +="</script>";
		
		m.addAttribute("list",list);
		m.addAttribute("pageBar",pageBar);
		return "admin/book/bookAllList";
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
	public String rentalList() {
		return "admin/book/bookRentalList";
	}

	// 예약도서목록
	@RequestMapping("/admin/book/bookReservedList.do")
	public String reservedList() {
		return "admin/book/bookReservedList";
	}

	// 희망도서목록
	@RequestMapping("/admin/book/bookWishList.do")
	public String wishList() {
		return "admin/book/bookWishList";
	}
	

	//
	@RequestMapping("/admin/book/registerBook.do")
	public String registerBook() {
		return "admin/book/registerBook";
	}

	@RequestMapping("/admin/book/bookDetail.do")
	public String bookDetail() {
		return "admin/book/bookDetail";
	}

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
	
}
