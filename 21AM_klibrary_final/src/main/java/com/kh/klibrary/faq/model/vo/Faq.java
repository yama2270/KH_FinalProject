package com.kh.klibrary.faq.model.vo;



import lombok.Data;

@Data//롬복
public class Faq {

	private int faq_No;
	private String faq_Category;
	private String faq_Content;
	private String faq_Answer;
}

