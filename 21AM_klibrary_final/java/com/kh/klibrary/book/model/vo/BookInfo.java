package com.kh.klibrary.book.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class BookInfo {
	private String isbnNo;
	private String bookName;
	private String bookWriter;
	private String bookCompany;
	private Date bookDate;
	private String bookPrice;
	private String bookLocation;
	private String bookContent;
	private String bookImg;
	private String bookKdc;
	private KdcDetail kdcDetail;
	
}
