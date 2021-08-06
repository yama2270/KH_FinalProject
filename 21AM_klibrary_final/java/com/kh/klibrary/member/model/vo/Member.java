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
public class Member {
	private String userId;
	private String userPassword;
	private String userName;
	private String email;
	private Date birthDate;
	private String address;
	private String phone;
	private Date signupDate;
}
