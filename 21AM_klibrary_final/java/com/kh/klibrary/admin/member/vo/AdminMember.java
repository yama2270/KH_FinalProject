package com.kh.klibrary.admin.member.vo;

import java.sql.Date;

import com.kh.klibrary.admin.notice.model.vo.Notice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminMember {

	private String userId;
	private String userPassword;
	private String userName;
	private String email;
	private String birthDate;
	private String address;
	private String phone;
	private Date signupDate;
}
