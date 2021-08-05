package com.kh.klibrary.admin.studyroom.model.vo;

import java.sql.Date;

import com.kh.klibrary.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminStudyroom {
	
	private String seatNo;
	private Member member;
	private String usageStatus;
	private String bookingNo;
	private String startTime;
	private String endTime;
	private Date usageDate;
	
}
