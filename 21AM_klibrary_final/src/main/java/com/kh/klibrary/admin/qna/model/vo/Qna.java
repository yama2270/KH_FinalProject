package com.kh.klibrary.admin.qna.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Qna {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaImg;
	private Date qnaDate;
	private int qnaCount;
	private String qnaState;
}