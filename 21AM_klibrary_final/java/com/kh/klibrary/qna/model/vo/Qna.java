package com.kh.klibrary.qna.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data//  롬복
public class Qna {
	private int qnaNo;
	private String userId;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int qnaCount;
	private String qnaState;
	private String qnaCate;
	private String qnaAnswerContent;
	
	//attachements 객체 생성
	private List<Attachment> attachments = new ArrayList<>();
}
