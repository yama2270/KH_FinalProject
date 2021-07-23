package com.kh.klibrary.common;


import java.util.Date;
import java.util.Map;

public class PageFactory3 {

	public static String getPageBar(int totalData, int cPage, int numPerpage,String init,String bookCategory,String bookName,String author,String publisher,String isbnNo,String price,String publishYear1,String publishYear2) {
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging2("+(pageNo-1)+","+totalData+","+numPerpage+","+init+","+bookCategory+","+bookName+","+author+","+publisher+","+isbnNo+","+price+","+publishYear1+","+publishYear2+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging2("+(pageNo)+","+totalData+","+numPerpage+","+init+","+bookCategory+","+bookName+","+author+","+publisher+","+isbnNo+","+price+","+publishYear1+","+publishYear2+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging2("+(pageNo)+","+totalData+","+numPerpage+","+init+","+bookCategory+","+bookName+","+author+","+publisher+","+isbnNo+","+price+","+publishYear1+","+publishYear2+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		/*
		 * pageBar+="<script>"; pageBar+="function fn_paging(cPage){";
		 * pageBar+="location.assign('"+url+"?cPage='+cPage);"; pageBar+="}";
		 * pageBar+="</script>";
		 */
		
		return pageBar;
	}
	
}
