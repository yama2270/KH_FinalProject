package com.kh.klibrary.search.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

public interface SearchService {

	ResponseEntity<List> searchNaverApi();
	
	
}
