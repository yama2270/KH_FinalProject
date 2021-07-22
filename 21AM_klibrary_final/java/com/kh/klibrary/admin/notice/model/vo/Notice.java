package com.kh.klibrary.admin.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String originalFileName;
	private Date noticeDate;
	private int noticeCount;
	private String noticeCate;
	
	
}