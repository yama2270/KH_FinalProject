package com.kh.klibrary.search.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klibrary.book.model.vo.Book;
import com.kh.klibrary.search.service.SearchServiceImp;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;

@RestController
public class SearchRestController {
	
	

	@Autowired 
	private  RestTemplate restTemplate;

//    private final String CLIENT_ID = "";
//    private final String CLIENT_SECRET = "";
    
    private  final String url1 = "https://dapi.kakao.com/v3/search/book";
	
//	@GetMapping("/searchpage/wishbookPopup")
//  public String searchNaverApi(){
//	  
//	  final HttpHeaders headers = new HttpHeaders();
////      headers.set("X-Naver-Client-Id", "ZfCG0ZXj8iiW9LwvANg"); 
////      headers.set("X-Naver-Client-Secret","VfuM4hfF8r");
//	    headers.set("Authorization","KakaoAK 810a4c928e125944de3726d437eb789f");
//	    
//		
//	    String queryString = "?query=해리";
//	    String url=url1+queryString;
//      
//      System.out.println("header테스트"+headers);
//      //HttpEntity<Object> requestEntity = new HttpEntity<Object>(headers);
//      final HttpEntity<String> entity = new HttpEntity<>(headers);
//      
////      System.out.println("entity테스트"+entity);
////	  System.out.println("json테스트"+JSONObject.class);
////	  System.out.println("템플릿테스트"+restTemplate.exchange(url, HttpMethod.GET, entity, JSONObject.class,"해리포터"));
////      ResponseEntity<JSONArray> responseEntity = 
////    		  restTemplate.exchange(url, HttpMethod.GET, entity, JSONArray.class,"");
////      
////      List result = (List)responseEntity.getBody(); 
////      System.out.println(result);
//      
//     // RequestEntity<String> rq = new RequestEntity<>(headers, HttpMethod.GET, url);
//      ResponseEntity<String> re = restTemplate.exchange(url, HttpMethod.GET,entity, String.class);
//      Object result=re;
// 	String result2=new JSONSerializer().toJSON(result).toString();
// 	//JSON result2=new JSONSerializer().toJSON(result);
//     return result2;
//      //return result;
//
//      
//  }
}
