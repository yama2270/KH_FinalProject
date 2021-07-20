package com.kh.klibrary.qna.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data //롬복처리
public class Attachment {
	private int attachmentNo;
	private int qnaNo;
	private String originalFileName;
	private String renameFileName;
	private Date UploadDate;
	
	//Attachment 클래스에 qnaNo필드 추가 선언
	private int boardNo;
}
