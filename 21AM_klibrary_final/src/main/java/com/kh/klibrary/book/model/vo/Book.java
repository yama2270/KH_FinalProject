package com.kh.klibrary.book.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Book {
	private String isbnNo;
	private String bookName;
	private String bookWriter;
	private String bookCompany;
	private Date bookDate;
	private String bookPrice;
	private String bookLocation;
	private String bookContent;
	private String bookImg;
	private int bookKdc;
	
	

}
