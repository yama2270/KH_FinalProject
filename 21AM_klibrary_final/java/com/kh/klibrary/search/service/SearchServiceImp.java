package com.kh.klibrary.search.service;

 
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.klibrary.book.model.vo.BookInfo;
import com.kh.klibrary.search.dao.SearchDao;
import com.kh.klibrary.search.dao.SearchDaoImpl;
 



@Service
public class SearchServiceImp implements SearchService{
	
	@Autowired
	SqlSessionTemplate session;
	
	@Autowired 
	private  RestTemplate restTemplate;
	
	@Autowired
	private SearchDao dao;
    
    private  final String url1 = "https://dapi.kakao.com/v3/search/book";
    
    @Override
	public ResponseEntity<String> searchNaverApi(String keyword,String category,int page,int size){
	  
		final HttpHeaders headers = new HttpHeaders();
	//      headers.set("X-Naver-Client-Id", "ZfCG0ZXj8iiW9LwvANg"); 
	//      headers.set("X-Naver-Client-Secret","VfuM4hfF8r");
		headers.set("Authorization","KakaoAK 810a4c928e125944de3726d437eb789f");
	
	
		String queryString = "?query="+keyword;
		String queryString2="";
		String queryString3="&page="+1; //선택페이지
		String queryString4="&size="+10;  //한페이지에나올데이터수
		
		if(category!="") {
			queryString2="&target="+category;
		}
		if(page!=0) {
			
			queryString3="&page="+page;
		}
		
		if(size!=0) {
			
			queryString4="&size="+size;
		}
		    
		String url=url1+queryString+queryString2+queryString3+queryString4;
		    
		    
		System.out.println("header테스트"+headers);
		//HttpEntity<Object> requestEntity = new HttpEntity<Object>(headers);
		final HttpEntity<String> entity = new HttpEntity<>(headers);
		  
		//      System.out.println("entity테스트"+entity);
		//	  System.out.println("json테스트"+JSONObject.class);
		//	  System.out.println("템플릿테스트"+restTemplate.exchange(url, HttpMethod.GET, entity, JSONObject.class,"해리포터"));
		//      ResponseEntity<JSONArray> responseEntity = 
		//    		  restTemplate.exchange(url, HttpMethod.GET, entity, JSONArray.class,"");
		//      
		//      List result = (List)responseEntity.getBody(); 
		//      System.out.println(result);
		  
		 // RequestEntity<String> rq = new RequestEntity<>(headers, HttpMethod.GET, url);
		ResponseEntity<String> re = restTemplate.exchange(url, HttpMethod.GET,entity, String.class);
		return re;
		//return result;
	  }

	@Override
	public List<BookInfo> selectBookInfoList(Map param) {
		// TODO Auto-generated method stub
		return dao.selectBookInfoList(session, param);
	}
	
	@Override
	public int insertWishBook(Map param) {
		// TODO Auto-generated method stub
		return dao.insertWishBook(session, param);
	}
	@Override
	 public List<BookInfo> bookTotalSearch(HashMap<String, Object> hashMap){
			  
			 return dao.bookTotalSearch(session,hashMap); 
			 
	 
	   }

	@Override
	public List<BookInfo> bookTotalSearch2(HashMap<String, Object> hashMap){
			  
			 return dao.bookTotalSearch2(session,hashMap); 
			 
	
	  }
	  
	@Override
	 public int selectBookCount() {
		 
		 return dao.selectBookCount(session); 
	 }
	
	
	
}
