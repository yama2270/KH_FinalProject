package com.kh.klibrary.search.service;

 
import java.util.List;

import org.json.JSONArray;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
 



@Service
public class SearchServiceImp {
	
	private  RestTemplate restTemplate;

    private final String CLIENT_ID = "";
    private final String CLIENT_SECRET = "";
    
    private  final String url = "https://openapi.naver.com/v1/search/book?d_titl=해리포터";
	
  public ResponseEntity<List> searchNaverApi(){
	  
	  final HttpHeaders headers = new HttpHeaders();
      headers.set("X-Naver-Client-Id", "ZfCVG0ZXj8iiW9LwvANg");
      headers.set("X-Naver-Client-Secret","VfuM4hfF8r");
      
      System.out.println("header테스트"+headers);

      final HttpEntity<String> entity = new HttpEntity<>(headers);
      
      System.out.println("entity테스트"+entity);
	  System.out.println("jsonarry테스트"+JSONArray.class);
	  System.out.println("템플릿테스트"+restTemplate.exchange(url, HttpMethod.GET, entity, JSONArray.class,"해리포터"));
      ResponseEntity<JSONArray> responseEntity = restTemplate.exchange(url, HttpMethod.GET, entity, JSONArray.class,"해리포터");

      List result = (List)responseEntity.getBody(); 
      System.out.println(result);
      
     return ResponseEntity.ok(result);
      //return result;

      
  }

	
	
	
}
