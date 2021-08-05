package com.kh.klibrary.admin.studyroom.model.vo;

import java.sql.Date;


import com.kh.klibrary.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminStudyroomBooking {
	
	private int bookingNo;
	private String roomName;
	private String userId;
	private String seatNo;
	private String startTime;
	private String endTime;
	private Date usageDate;
	private Member member;
	
}
