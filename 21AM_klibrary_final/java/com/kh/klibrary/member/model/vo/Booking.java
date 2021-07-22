package com.kh.klibrary.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.klibrary.book.model.vo.Book;

import lombok.Data;

@Data
public class Booking {
	private int bookingNo;
	private String userId;
	private String bookNo;
	private Date bookingDate;
	private Date bookingPickUpDate;
	
	private Member member;
	private Book book;
}
