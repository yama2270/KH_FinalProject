package com.kh.klibrary.member.model.vo;

import java.util.ArrayList;
import java.util.List;

import com.kh.klibrary.book.model.vo.BookInfo;

import lombok.Data;
@Data
public class Likes {
	private String userId;
	private String isbnNo;
	
	private List<Member> member = new ArrayList();
	private List<BookInfo> bookInfo = new ArrayList();
}
