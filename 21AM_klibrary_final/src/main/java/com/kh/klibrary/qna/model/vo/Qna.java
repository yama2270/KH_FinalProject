package com.kh.klibrary.qna.model.vo;

import java.util.Date;

import lombok.Data;

@Data//  롬복
public class Qna {
	private int qna_No;
	private String user_Id;
	private String qna_Title;
	private String qna_Img;
	private Date qna_Date;
	private int qna_Count;
	private String qna_State;
}
