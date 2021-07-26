package com.kh.klibrary.member.model.vo;

import lombok.Data;

@Data
public class BookingHistory {
	private int bookingHistoryNo;
	private String userId;
	private int bookingNo;
	private String bookNo;
	private String bookingDate;
	private String bookingPickUpDate;
	
	private Member member;
}
