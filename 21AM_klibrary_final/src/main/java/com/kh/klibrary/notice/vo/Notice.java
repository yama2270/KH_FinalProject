package com.kh.klibrary.notice.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {
	
	private int noticeNo;
	private String userId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFile;
	private Date noticeDate;
	private int noticeCount;

}
