package com.kh.klibrary.admin.studyroom.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminStudyroomManage {
	
	private int studyManageNo;
	private String roomName;
	private int toSeat;
	private int toUsSeat;
	private int toReSeat;
	private int toNaSeat;
	
}
