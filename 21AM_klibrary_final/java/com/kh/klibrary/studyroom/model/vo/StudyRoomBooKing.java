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
public class StudyRoomBooKing {
	private int bookingNo;
	private String userId;
	private String studyroomType;
	private String seatNo;
	private String startTime;
	private String endTime;
	private Date usageDate;

}
