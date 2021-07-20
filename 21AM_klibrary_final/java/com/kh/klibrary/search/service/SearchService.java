package com.kh.klibrary.search.service;

import java.util.List;

import java.util.Map;

import org.springframework.http.ResponseEntity;

public interface SearchService {

	ResponseEntity<String> searchNaverApi(String keyword,String category,int page,int size);
	
	
}
