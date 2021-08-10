<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/hy.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/dg.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/hj.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sh.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sy.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/yh.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/cg.css">
	
<title>ISBN 검색</title>

<!-- icon  -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>

	<div class="popupTitleContainer">
		<br>
		<h3 id="popupTitle">
			도서검색
			</h1>
			<br>
	</div>


	<div class="pop-container">
		<div class="populor-words">

			<span>※아래 검색결과에서 원하시는 도서를 클릭하세요.</span>


		</div>
			<div class="searchSelect">
				<label for="searchKey" class="blind"></label> <select id="searchKey"
					name="searchKey" title="검색 선택">
					<option value="title" selected>도서명</option>
					<option value="person">저자</option>
					<option value="publisher">출판사</option>
					<option value="isbn">ISBN</option>
				</select>

			</div>

			<input type="text" placeholder="검색" name="search" id="inputText" value="${bookName}">
			<button type="button" onclick="fn_searchIsbn()">
				<i class="fa fa-search"></i>검색
			</button>
	</div>
	<br>
	<br>
	<br>
	<br>

	<div id="searchResultTable3Div"></div>
	<div id='searchPageBar' style="width:800px;height:70px;"></div>
	<div class="closeBtnDiv">
		<button id="closeBtn" type="submit" onclick="fn_closePop()">닫기</button>
	</div>

	<br>
	<br>

</body>

</html>
<script>

 
 
 /* Ajax로 도서정보 검색하기 */
 const fn_searchIsbn = function(cPage){
	 
				 
			// 검색키워드 
			let target = $("#searchKey").val();
	 		let kwd = $("#inputText").val();
	 		
	 		// 페이징처리 
	 		if(cPage == null){
	 			cPage = 1;
	 		}
	 		
			// 카카오 api
			$.ajax({
			url:'https://dapi.kakao.com/v3/search/book?query='+kwd+'&target='+target+'&page='+cPage,
			beforeSend : function(req){
				req.setRequestHeader("Authorization","KakaoAK 810a4c928e125944de3726d437eb789f");
				},		
			success:function(data){
				console.log(data);
				
			  // 검색 결과 헤더 
			  let str="<table id='searchResultTable3' >";
			  str+="<tr>";
			
			  str+="<td colspan='3' id='searchCaptionTh'>"			  
			  str+="<div id='searchCaption'>"
			  str+="검색건수 :"+data.meta.pageable_count+"건</p>"
			  str+="</div>"
			  str+="</td>"
			  str+="</tr>"
			  str+="<tr>"
			  str+="<td colspan='3'>"
			  str+="<hr>"
			  str+="</td>"
			  str+="</tr>"
			   
			  // 검색 결과 파싱처리 
 			$.each(data.documents,function(i,v){
			  str+="<tr>";
			  str+="<td id='imgContainerDiv' rowspan='2'>"
			  str+="<img id='bookImg' src='"+v["thumbnail"]+"' alt='준비중'>"
			  str+="</td>"
			  str+="<td colspan='2'>"
			  str+="<dt class='tit'>"
			  str+="<a href='#' onclick='fn_chooseBook(this)'>"+v["title"]+"</a>"
			  str+="<br><br>"
			  str+="</dt>" 
			  str+="</td>"
			  str+="</tr>"			  
			  str+="<tr >"			      			    
			  str+="<td id='bookInfoDiv'>"
			  str+="<div >"
			  str+="<dl>"			                         
			  str+="<dd class='authorData'>"
			  str+="<span>저자 </span><br>"
		      str+="<span>발행자</span><br>"                  
		      str+="<span>발행연도</span> <br>"                                
		      str+="<span>ISBN</span><br>"     
		      str+="<span>가격</span><br>"			                        		                                            
		      str+="</dd>"
		      str+="<dd>"
		      str+="</dd>"         
		      str+="</dl>"
		      str+="</div>"
		      str+="</td>"
		      str+="<td id='bookInfoDiv2'>"
		      str+="<div >"
		      str+="<dl>"			                         
		      str+="<dd class='authorData2'>"
		      str+="<span>"+v["authors"]+"</span><br>"
		      str+="<span>"+v["publisher"]+"</span><br>"                   
		      str+="<span>"+v["datetime"].substring(0,10)+"</span><br> "                 
		      str+="<span>"+v["isbn"].substring(0,10)+"</span><br>"
		      str+="<span>"+v["price"]+"원</span><br>"	
		      str+="</dd>"
		      str+="<dd>"
		      str+="<br>"
		      str+="</dd>"    
		      str+="</dl>"
		      str+="</div>"
		      str+="</td>"
		      str+="</tr>"
		      str+="<tr>"
		      str+="<td colspan='3'>"
		      str+="<hr>";
		      str+="</td>";
		      str+="</tr>";
		      str+="<tr style='display:none'>";
		      str+="<td>";
 		      str+="<input id='isbn' class='bookInfo' value='"+v["isbn"].substring(0,10)+"' style='display:none;'/>";
 		      str+="<input id='title' class='bookInfo' value='"+v["title"]+"' style='display:none;'/>";
 		      str+="<input id='authors'class='bookInfo' value='"+v["authors"]+"' style='display:none;'/>";
 		      str+="<input id='publisher' class='bookInfo' value='"+v["publisher"]+"' style='display:none;'/>";
 		      str+="<input id='datetime' class='bookInfo' value='"+v["datetime"].substring(0,10)+"' style='display:none;'/>";
 		      str+="<input id='price' class='bookInfo' value='"+v["price"]+"' style='display:none;'/>";
 		      str+="<input id='contents' class='bookInfo' value='"+v["contents"]+"' style='display:none;'/>";
 		      str+="<input id='thumbnail' class='bookInfo' value='"+v["thumbnail"]+"' style='display:none;'/>";
 		     str+="<input class='bookInfo' value='"+cPage+"' style='display:none;'/>";
			  str+= "</td>";		      
		      str+="</tr>";
				})
		      str+="</table>"	
		      
		    // 페이징처리 
			let numPerPage =10;
			let totalData = data.meta.pageable_count;
			let totalPage = Math.round(totalData/numPerPage);					
			
			let pageBarSize = 5;
			let pageNo = Math.floor((cPage-1)/pageBarSize)*pageBarSize+1;
			let pageEnd = pageNo+pageBarSize-1;
			
			let pageBar = "";
			pageBar += "<ul class='pagination justifycontent-center pagination-sm' style='margin-top:20px;margin-left:240px'>";
			
			if(pageNo == 1){
				pageBar += "<li class='page-item disabled'>";
				/* pageBar += "<a class='page-link' href='#'>이전</a>"; */
				pageBar += "</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_searchIsbn("+(pageNo-1)+")'>이전</a>";
				pageBar += "</li>";
			}
			
			while(!(pageNo>pageEnd || pageNo>totalPage)){
				if(cPage == pageNo){
					pageBar += "<li class='page-item active'>";
					pageBar += "<a class='page-link' href='#'>"+pageNo+"</a>";
					pageBar += "</li>";
				} else {
					pageBar += "<li class='page-item'>";
					pageBar += "<a class='page-link' href='javascript:fn_searchIsbn("+pageNo+")'>"+pageNo+"</a>";
					pageBar += "</li>";
				}
				pageNo++;
			}
			
			if(pageNo>totalPage){
				pageBar += "<li class='page-item disabled'>";
/* 				pageBar += "<a class='page-link'>다음</a>"; */
				pageBar += "</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_searchIsbn("+pageNo+")'>다음</a>";
				pageBar += "</li>";
			}
			
			pageBar += "</ul>";
			
			$("#searchResultTable3Div").html(str);		
			$("#searchPageBar").html(pageBar);
				}//success 
			}) // aJax
		}; // function 
 		
		
		/* close window  */
		const fn_closePop = function(){
			window.close();
		}
		
		
		
		/* 팝업창 내에서 도서선택 */
		const fn_chooseBook = function(e){
			
			const isbnNo = $("#isbn").val();
			const bookName = $("#title").val();
			const writer = $("#authors").val();
			const company = $("#publisher").val();
			const date = $("#datetime").val();
			const price = $("#price").val();
			const location = '843.1.26.69';
			const content= $("#contents").val();
			const img =$("#thumbnail").val();
			const kdc = 843;
			
			
			console.log('${wishBookNo}');
			
			$.ajax({
				url : '${path}/admin/book/insertWishBook?isbnNo='+isbnNo+'&bookName='+bookName+'&writer='+writer+'&company='
						+company+'&date='+date+'&price='+price+'&location='+location+'&content='+content+'&img='+img+'&kdc='+kdc+'&wishBookNo=${wishBookNo}',
				success : function(data){
					alert(data.msg);
					window.close();
				}
			})
						
		}
		
	
			
</script>
