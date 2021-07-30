package com.kh.klibrary.admin.member.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDrop {
	private String userId;
	private String dropRequest;
	private AdminMember Adminmember;

}
