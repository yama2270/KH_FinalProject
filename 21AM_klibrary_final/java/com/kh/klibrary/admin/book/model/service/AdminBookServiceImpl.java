package com.kh.klibrary.admin.book.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klibrary.admin.book.model.dao.AdminBookDao;
import com.kh.klibrary.book.model.vo.BookInfo;

@Service
public class AdminBookServiceImpl implements AdminBookService {
	
	@Autowired
	private AdminBookDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int checkIsbn(String isbnNo) {
		return dao.checkIsbn(isbnNo,session);
	}
	
	@Override
	public int insertBook(BookInfo bookInfo,String newBook) {
		
		// isbn 등록
		if(newBook.equals("true")) {
			int result = dao.insertBookInfo(bookInfo,session);
		}
		
		return dao.insertBook(bookInfo,session);
	}
	
//	@Autowired
//	private RestTemplate restTemplate;
	
	
	
	// restTemplate 국립중앙도서관 요청
//	@Override
//	public Object searchBook(Map param) {
//		
//		// http헤더 생성 
//		HttpHeaders headers = new HttpHeaders();
//		
//		
//		// 국립중앙도서관 request Url 필수요소 
//		// 국립중앙도서관 주소 
//		String url = "https://www.nl.go.kr/NL/search/openApi/search.do";
//		// 발급키 
//		String urlKey = "?key=1d86b36fbb82daa3f582eea8d7fb0da3d7a6605c95a3f4a0eae32bbb0db43e5c";
//		// pageNum
//		String urlPageNum ="&pageNum=1";
//		// pageSize
//		String urlPageSize = "$pageSize=10";
//		
//		if((String)param.get("pageNum")!="" || (String)param.get("pageNum")!= null) {
//			urlPageNum = "&pageNum="+(String)param.get("pageNum");
//		}
//		
//		//String url 만들기 
//		url = url + urlKey + urlPageNum + urlPageSize;
//		url = "https://www.nl.go.kr/NL/search/openApi/search.do?key=1d86b36fbb82daa3f582eea8d7fb0da3d7a6605c95a3f4a0eae32bbb0db43e5c&apiType=xml&srchTarget=total&kwd=%ED%86%A0%EC%A7%80&pageSize=10&pageNum=1&sort=&category=%EB%8F%84%EC%84%9C";
//		/*
//		 * HttpEntity<String> entity = new HttpEntity<>(headers); ResponseEntity<String>
//		 * re = restTemplate.exchange(url, HttpMethod.GET,entity,String.class);
//		 */
//		Object result = restTemplate.getForObject(url,Object.class);
//		return result;
//	}

	
	
}
