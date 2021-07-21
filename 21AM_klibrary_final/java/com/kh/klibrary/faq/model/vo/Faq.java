package com.kh.klibrary.faq.model.vo;



import lombok.Data;

@Data//롬복
public class Faq {

	private int faqNo;
	private String faqCate;
	private String faqContent;
	private String faqAnswer;
}

