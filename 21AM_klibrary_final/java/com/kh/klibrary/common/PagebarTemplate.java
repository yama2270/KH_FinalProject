package com.kh.klibrary.common;

public class PagebarTemplate {
	
	public static String getPagebar(int cPage, int numPerPage, int totalData, int pageBarSize, String url) {
		
		int totalPage = (int) Math.ceil((double)totalData/numPerPage);
		int pageNo = ((cPage-1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String pageBar = "";

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo == 1) {
			pageBar += "<li class='page-item' disabled>"; 
			pageBar += "<a class='page-link' href='#'>[이전]</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>"; 
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo-1) + ")'>[이전]</a>";
			pageBar += "</li>";
		}
		
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(cPage == pageNo) {
				pageBar += "<li class='page-item' disabled>"; 
				pageBar += "<a class='page-link' href='#'>"+ pageNo +"</a>";
				pageBar += "</li>";
			} else {
				pageBar += "<li class='page-item'>"; 
				pageBar += "<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		if(pageNo > totalPage) {
			pageBar += "<li class='page-item' disabled>"; 
			pageBar += "<a class='page-link' href='#'>[다음]</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>"; 
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>[다음]</a>";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage){";
		pageBar += "location.assign('" + url + "?cPage='+cPage)";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar;
		
	}
}
