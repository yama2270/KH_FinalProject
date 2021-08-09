package com.kh.klibrary.admin.common;

public class AdminPagingTemplate {
	
	// 기본 template 
	public static String adminPagingTemplate(int cPage,int numPerPage,int totalData) {
		
		// toalPage
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		// pageBar
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		// 페이지 바 
		String pageBar = "<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>이전</a>";
			pageBar +="</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			} else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		return pageBar;
	}
	
	// 도서 key 검색 template
	public static String searchKeyPagingTemplate(int cPage,int numPerPage,int totalData) {
		
		// toalPage
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		// pageBar
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		// 페이지 바 
		String pageBar = "<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>이전</a>";
			pageBar +="</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_searchKey("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			} else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_searchKey("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_searchKey("+(pageNo)+")'>다음</a>";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		return pageBar;
	}
	
	// 도서 Detail 검색 template
		public static String searchDetPagingTemplate(int cPage,int numPerPage,int totalData) {
			
			// toalPage
			int totalPage = (int)Math.ceil((double)totalData/numPerPage);
			
			// pageBar
			int pageBarSize = 5;
			int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd = pageNo+pageBarSize-1;
			
			// 페이지 바 
			String pageBar = "<ul class='pagination justify-content-center pagination-sm'>";
			
			if(pageNo==1) {
				pageBar += "<li class='page-item disabled'>";
				pageBar += "<a class='page-link' href='#'>이전</a>";
				pageBar +="</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_searchDet("+(pageNo-1)+")'>이전</a>";
				pageBar += "</li>";
			}
			
			while(!(pageNo>pageEnd || pageNo>totalPage)) {
				if(pageNo == cPage) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
					pageBar+="</li>";
				} else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:fn_searchDet("+(pageNo)+")'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
			
			if(pageNo>totalPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>다음</a>";
				pageBar+="</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_searchDet("+(pageNo)+")'>다음</a>";
				pageBar += "</li>";
			}
			
			pageBar += "</ul>";
			
			return pageBar;
		}
		
		// 기본 template2 
		public static String adminPagingTemplate2(int cPage,int numPerPage,int totalData) {
			
			// toalPage
			int totalPage = (int)Math.ceil((double)totalData/numPerPage);
			
			// pageBar
			int pageBarSize = 5;
			int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd = pageNo+pageBarSize-1;
			
			// 페이지 바 
			String pageBar = "<ul class='pagination justify-content-center pagination-sm'>";
			
			if(pageNo==1) {
				pageBar += "<li class='page-item disabled'>";
				pageBar += "<a class='page-link' href='#'>이전</a>";
				pageBar +="</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
				pageBar += "</li>";
			}
			
			while(!(pageNo>pageEnd || pageNo>totalPage)) {
				if(pageNo == cPage) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
					pageBar+="</li>";
				} else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging2("+(pageNo)+")'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
			
			if(pageNo>totalPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>다음</a>";
				pageBar+="</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
				pageBar += "</li>";
			}
			
			pageBar += "</ul>";
			
			return pageBar;
		}
		
		// 열람실 A 이용자 pageBarTemplate 
				public static String adminPagingTemplate3(int cPage,int numPerPage,int totalData) {
					
					// toalPage
					int totalPage = (int)Math.ceil((double)totalData/numPerPage);
					
					// pageBar
					int pageBarSize = 5;
					int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
					int pageEnd = pageNo+pageBarSize-1;
					
					// 페이지 바 
					String pageBar = "<ul class='pagination justify-content-center pagination-sm'>";
					
					if(pageNo==1) {
						pageBar += "<li class='page-item disabled'>";
						pageBar += "<a class='page-link' href='#'>이전</a>";
						pageBar +="</li>";
					} else {
						pageBar += "<li class='page-item'>";
						pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
						pageBar += "</li>";
					}
					
					while(!(pageNo>pageEnd || pageNo>totalPage)) {
						if(pageNo == cPage) {
							pageBar+="<li class='page-item active'>";
							pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
							pageBar+="</li>";
						} else {
							pageBar+="<li class='page-item'>";
							pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
							pageBar+="</li>";
						}
						pageNo++;
					}
					
					if(pageNo>totalPage) {
						pageBar+="<li class='page-item disabled'>";
						pageBar+="<a class='page-link' href='#'>다음</a>";
						pageBar+="</li>";
					} else {
						pageBar += "<li class='page-item'>";
						pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
						pageBar += "</li>";
					}
					
					pageBar += "</ul>";
					
					return pageBar;
				}
		
}
