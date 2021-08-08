package com.kh.klibrary.admin.studyroom.model.vo;

import java.sql.Date;

import com.kh.klibrary.member.model.vo.Member;

import lombok.Data;

@Data
public class AdminStudyroomHistory {
	private int studyroomHistoryNo;
	private String userId;
	private int bookingNo;
	private String studyroomType;
	private String seatNo;
	private String startTime;
	private String endTime;
	private Date usageDate;
	
	private Member member;
}
