package com.kh.klibrary.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.klibrary.book.model.vo.Book;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data

public class Lending {
	private String lendingNo;
	private String userId;
	private String bookNo;
	private Date lendingDate;
	private Date returnDate;
	private int bookExtend;
	private Member member;
	private Book book;
}
