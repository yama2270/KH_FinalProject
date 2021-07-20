package com.kh.klibrary.book.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class KdcDetail {
	
	private String kdcDetailNo;
	private String kdcDetailName;
	private String kdcNo;
	private KdcType kdcType;
	
}
