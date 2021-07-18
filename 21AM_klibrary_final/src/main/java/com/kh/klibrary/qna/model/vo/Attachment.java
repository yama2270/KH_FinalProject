package com.kh.klibrary.qna.model.vo;

import java.util.Date;

import lombok.Data;

@Data //롬복처리
public class Attachment {
	private int attachmentNo;
	private int qnaNo;
	private String oringalFileName;
	private String RenameFileName;
	private Date UploadDate;
	
}
