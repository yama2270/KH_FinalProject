package com.kh.klibrary.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BookingHistory {
	private int bookingHistoryNo;
	private String userId;
	private int bookingNo;
	private String bookNo;
	private Date bookingDate;
	private Date bookingPickUpDate;
	
	private Member member;
}
