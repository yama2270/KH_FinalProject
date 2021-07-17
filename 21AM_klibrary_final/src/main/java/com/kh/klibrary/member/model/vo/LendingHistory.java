package com.kh.klibrary.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LendingHistory {
	private int lendingHistroyNo;
	private String lendingNo;
	private String userId;
	private String bookNo;
	private Date lendingDate;
	private Date returnDate;
	private int bookExtend;
}
