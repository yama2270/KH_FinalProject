package com.kh.klibrary.admin.notice.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder


public class Notice {
	private int noticeNo;
	private String userId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFile;
	private Date noticeDate;
	private int noticeCount;
	private List<Attachment> attachments=new ArrayList();
}