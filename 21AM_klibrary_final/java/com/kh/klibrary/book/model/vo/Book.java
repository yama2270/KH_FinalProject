package com.kh.klibrary.book.model.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Book {
	private String bookNo;
	private String isbnNo;
	private String bookingState;

	private String lendingState;	
	private BookInfo bookInfo;
	
//	private List<BookInfo> bookInfo=new ArrayList();

}
