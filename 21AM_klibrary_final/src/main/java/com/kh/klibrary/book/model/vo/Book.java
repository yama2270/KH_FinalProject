package com.kh.klibrary.book.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Book {
	private String bookNo;
	private String isbnNo;
	private String bookingState;
	private String lendingState;
	private List<BookInfo> bookInfo=new ArrayList();
}
