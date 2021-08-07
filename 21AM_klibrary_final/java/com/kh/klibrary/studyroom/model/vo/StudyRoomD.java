package com.kh.klibrary.studyroom.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StudyRoomD {
	private String seatNo;
	private String userId;
	private String usageStatus;
	private int bookingNo;
	private String startTime;
	private String endTime;
	private Date usageDate;

}
