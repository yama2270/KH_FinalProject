package com.kh.klibrary.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LendingHistory {
	private int lendingHistoryNo;
	private String lendingNo;
	private String userId;
	private String bookNo;
	private Date lendingDate;
	private Date returnDate;
	private int bookExtend;
	
	private Member member;
}
