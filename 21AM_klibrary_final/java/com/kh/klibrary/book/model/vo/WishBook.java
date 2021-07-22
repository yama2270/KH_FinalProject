package com.kh.klibrary.book.model.vo;

import lombok.Data;

@Data
public class WishBook {
	private String wishBookNo;
	private String userId;
	private String isbnNo;
	private String bookName;
	private String bookWriter;
	private String bookCompany;
	private String bookDate;
	private String bookPrice;
	
}
