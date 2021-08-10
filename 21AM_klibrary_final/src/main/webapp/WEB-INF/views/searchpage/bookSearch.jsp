<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%   request.setCharacterEncoding("UTF-8");
String pageId = request.getParameter("pageId");
%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="통합검색"/>
</jsp:include>
<%
request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");
String category =  request.getParameter("category");
String totalData=request.getParameter("totalData");
%>



<body>
  
  <div class="totalSearchcontainer1">
    <br>
    <h2 id="totalSearchTitle1">통합검색</h2>
    <br>
  </div>

<div class="list-group-container" >
  <!-- <h2 id="title">자료검색</h2> -->
  <ul class="list-group">
    <li class="list-group-item" id="menutitle">자료검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/bookSearch.do')">통합검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/detailSearch.do')">상세검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/categorySearch.do')">주제별검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/wishbook.do')">희망도서신청</li>
  </ul>
  <br><br>
  <table id="recentKeywordList">
     <tr>
       <td id="recentkeywordTd">
		<h5 class="recenttit">최근검색어</h3>
		</td>
	 </tr>
	 <tr>
	   <td id="recentkeywordTd2">
		 <ol class="recentkwdPop" id="recentpopword" > 		
							
				<li class="skwd"></li>																						
				<li class="skwd"></li>															
				<li class="skwd"></li>																			
				<li class="skwd"></li>																				
				<li class="skwd"></li>							
											
	    </ol>
	  </td>
	</tr>
  </table>
  
  <br><br>
   <table class="bestKeywordList">
     <tr>
       <td id="keywordTd">
		<h5 class="tit">기관추천도서</h3>
		</td>
	 </tr>
	 <tr>
	   <td id="keywordTd2">
		 <ol class="kwdPop" id="popword" > 		
			<li>
				<em class="num themeColor themeBD">1</em>
				<span class="kwd"></span>				
				
			</li>		
			<li>
				<em class="num themeColor themeBD">2</em>
				<span class="kwd"></span>
				
			</li>		
			<li>
				<em class="num themeColor themeBD">3</em>
				<span class="kwd"></span>				
				
			</li>
		
			<li>
				<em class="num ">4</em>
				<span class="kwd"></span>								
			</li>		
			<li>
				<em class="num ">5</em>
				<span class="kwd"></span>				
				
			</li>		
			<li>
				<em class="num ">6</em>
				<span class="kwd"></span>				
				
			</li>		
			<li>
				<em class="num ">7</em>
				<span class="kwd"></span>
				
			</li>	
			
	    </ol>
	  </td>
	</tr>
  </table>
<br><br><br><br>
</div>



<div class="book-search-container">
		  <div class="populor-words">
		  
		    <span>추천도서<i class="fa fa-search"></i></span>&nbsp;&nbsp;   
		    
		  </div>
		
		  <form id="bookSearchForm" action="${path}/searchpage/bookTotalSearch">
		
		    <div class="searchSelectDiv">
		      <label for="searchKey" class="blind"></label>
		      <select id="searchKey" name="category" title="검색 선택">
		        <option value="all" selected>전체</option>
		        <option value="book_name" >도서명</option>
		        <option value="book_writer">저자</option>
		        <option value="book_company">발행자</option>
		        <option value="isbnNo">ISBN</option>
		        
		
		      </select>
		
		    </div>
		      
		    <input type="text" placeholder="  검색" name="keyword" id="inputtext" onkeypress="if(event.keyCode == 13){fn_searchBook(); return false;}"
		    <%if(keyword!=null) {%>
		    value="<%=keyword %>" <%}else{ %>
		    value="" <%} %>>
		    <button id="searchButton" type="button" onclick="fn_searchBook();" ><i class="fa fa-search"></i>검색</button>
		  </form>


<br><br><br><br>


<form id="searchResultForm" method="get" action="interestingbook">
<table id=searchResultTable2>

 <c:choose> 
   	<c:when test="${not empty list }">
   	
  
  <tr>
    <th colspan="5" id="searchCaptionTh2">
      <div style="text-align:center">
        <div id="searchCaption22">
            <p><%if(keyword!=null) {%>
            <%=keyword %> 
            검색결과 ${totalData }건  이 검색되었습니다.
             <%}else{ %>
             <%} %>
             </p>
        </div>
  
        <div class="selectForm3">
      
	        
	        <select id="searchNumber" title="검색건수" name="searchNumber">
	          <option value=10 ${searchNumber == 10? "selected":""}>10건</option>
	          <option value=20 ${searchNumber == 20? "selected":""}>20건</option>
	          <option value=30 ${searchNumber == 30? "selected":""}>30건</option>
	          <option value=40 ${searchNumber == 40? "selected":""}>40건</option>
	          <option value=50 ${searchNumber == 50? "selected":""}>50건</option>
	  
	        </select>
	        <button id="button44" type="button" onclick="fn_searchBook2();" style="border:none">확인</button>
      </div>
     </div>
   </th>
   </tr>
   
	   <tr>
		    <td colspan="5" >
		      <hr>
		    <td>
	   </tr> 
	   <tr>
		     <td colspan="1" id="searchTable2td">
		      <input type="checkbox" name="bookSelect" id="allCheck" onclick="selectAll(this)" value="all">
		      
		     </td>
		     <td colspan="4">
		       <button id="button22" type="submit"  >관심도서담기</button>
		     </td>
	   </tr>
	   <tr>
	     <td td colspan="5">
	      <hr>
	    </td>
	  </tr>
 		  
     </c:when>
     </c:choose>
   
    <c:choose> 
   	<c:when test="${not empty list }">
   		<c:forEach var="b" items="${list }">
   
 
 
  
  <tr>
      <td id="bookCheckTd" rowspan="2" >
          <input type="checkbox" name="bookCheck" id="bookCheck" value="${b.isbnNo }"> 
    
      </td>
    <td id="imgContainerDiv"  rowspan="2" >

          
            
            <img id="totalSearchbookImg"  src="${b.bookImg }" alt="${b.bookName} " 
            onclick="location.href='${path}/searchpage/bookDetail.do?isbnNo=${b.isbnNo }&keyword=<%=keyword %>&category=<%=category %>'" style="cursor:pointer;">
            
    </td>
    <td colspan="2">
          <div id="bookInfoDiv3">
            <dl class="authorData" id="bookTitleDl" >
               <dd>
                    
                    <a href="#link" onclick="location.href='${path}/searchpage/bookDetail.do?isbnNo=${b.isbnNo }&keyword=<%=keyword %>&category=<%=category %>'" 
                    style="cursor:pointer;"><c:out value="${b.bookName }"/></a>
            
                    </dd>
            </dl>
          </div>
         

      </td>
      <td id="buttonWrapTd" rowspan="2">
        <div class="buttonWrap">
           <button id="button22" type="button" onclick="location.href='${path}/searchpage/bookReservation?isbnNo=${b.isbnNo}'"  >도서예약신청</button>
          <button id="button22" type="button" onclick="location.href='${path}/searchpage/interestingbook?isbnNo=${b.isbnNo}'"  >관심도서담기</button>
          </div>
      </td>
    </tr>
    <tr>
	   <td>
	
	   </td>
     <td>
      <div id="bookInfoDiv4">
        <dl class="authorData2">
           <dd>
                
                  
                <span>저자 </span><br>
                <span>발행자</span><br>                    
                <span>발행연도</span> <br>                  
                <span>ISBN</span><br>
                 <span>분류번호</span><br>
                 <span>위치번호</span>
                                                       
            
                  </dd>
        </dl>
      </div>

     </td>
     <td>
      <div id="bookInfoDiv3">
        <dl class="authorData3">
           <dd>
                
                  
                <span><c:out value="${b.bookWriter }"/></span><br>
                <span><c:out value="${b.bookCompany }"/></span><br>                    
                <span><c:out value="${b.bookDate }"/></span><br>                            
                <span><c:out value="${b.isbnNo }"/></span><br>
                 <span><c:out value="${b.bookKdc }"/></span><br>
                 <span><c:out value="${b.bookLocation }"/></span>
                                                                    
                  </dd>
        </dl>
      </div>
     </td>
     
     <td>

     </td>
    </tr>
    
		    <tr>
		      <td colspan="5">
		         <hr>
		      </td>
		    </tr>
    </c:forEach>
    </c:when>
    
	    <c:otherwise>
	   					<tr>
	   					<td colspan="5"></td>
	   					</tr>
	   	</c:otherwise>  
    </c:choose>
  </table>
  </form>
  <c:choose> 
   	<c:when test="${not empty list }">
         <div id="pagebar-container">
        	${pageBar }
        </div>
       </c:when>
   </c:choose>
 <br>
 <c:choose>
   <c:when test="${empty list }">
     <div style="text-align:center; "><h5>도서를 검색하세요</h5></div>
     <br><br><br>
      <table id=recommendTable2 style="text-align:left;">      
				 
				
	  </table>	
   
   </c:when>
  </c:choose> 
  
  
</div>  
<br><br><br><br><br><br><br><br>

</body>

</html>
<script>
   
$(function(){
$.get("${pageContext.request.contextPath}/searchpage/likeBest",data=>{
		console.log("data테스트"+data);		
		console.log("data테스트2"+data[0]["bookName"]);
		
		let str="<tr>";	
		str+="<td colspan='5' >";
		str+="<hr>";
		str+="&nbsp;&nbsp;<a id='likebest' style='cursor:pointer; font-size:20px; color:skyblue' onclick='fn_likebest()'>관심도서순위</a> &nbsp;&nbsp;  <a id='lendingbest' style='cursor:pointer' onclick='fn_lendingbest()'>대출베스트</a>  &nbsp;&nbsp; <a id='recommend'style='cursor:pointer'  onclick='fn_recommend()'>기관추천도서</a>";
		str+="<hr>"
		str+="</td>"
		str+="</tr>"
		str+="<tr>"
		  for(let i=0;i<data.length; i++){
			str+="<td id='imgContainerDiv'  >"
			  str+="<img id='bookImg' src='"+data[i]["bookImg"]+"' alt='"+data[i]["bookName"]+"'"
			  str+="onclick='location.href=\"${pageContext.request.contextPath}/searchpage/bookDetail.do?isbnNo="+data[i]["isbnNo"]+"\" ' style='cursor:pointer;'><br><br>"
					  str+="<span>"+data[i]["bookName"].substring(0,13)+"</span>"  	
			str+="</td>"
		  }
	   str+="</tr>"
	   str+="<tr>"
	   str+="<td colspan='5'>"
	   str+="<hr>"
	   str+="</td>"
	   str+="</tr>"
	 
	   $('#recommendTable2').html("");
	   $('#recommendTable2').html(str).show(500);
      
	});
	
  
	
})

function fn_likebest(){
	$.get("${pageContext.request.contextPath}/searchpage/likeBest",data=>{
		console.log("data테스트"+data);		
		console.log("data테스트2"+data[0]["bookName"]);
		
		
		let str="<tr>"
		str+="<td colspan='5' >";
		str+="<hr>";
		str+="&nbsp;&nbsp;<a id='likebest' style='cursor:pointer; font-size:20px; color:skyblue' onclick='fn_likebest()'>관심도서순위</a> &nbsp;&nbsp;  <a id='lendingbest' style='cursor:pointer' onclick='fn_lendingbest()'>대출베스트</a>  &nbsp;&nbsp; <a id='recommend' style='cursor:pointer'  onclick='fn_recommend()'>기관추천도서</a>";
		str+="<hr>"
		str+="</td>"
		str+="</tr>"
		str+="<tr>"
		  for(let i=0;i<data.length; i++){
			str+="<td id='imgContainerDiv'  >"
			  str+="<img id='bookImg' src='"+data[i]["bookImg"]+"' alt='"+data[i]["bookName"]+"'"
			  str+="onclick='location.href=\"${pageContext.request.contextPath}/searchpage/bookDetail.do?isbnNo="+data[i]["isbnNo"]+"\" ' style='cursor:pointer;'><br><br>"
					  str+="<span>"+data[i]["bookName"].substring(0,13)+"</span>"  	
			str+="</td>"
		  }
	   str+="</tr>"
	   str+="<tr>"
	   str+="<td colspan='5'>"
	   str+="<hr>"
	   str+="</td>"
	   str+="</tr>"
	 
	   $('#recommendTable2').html("");
	   $('#recommendTable2').html(str).show(500);
      
	});
		
}

function fn_lendingbest(){
	
	$.get("${pageContext.request.contextPath}/searchpage/lendingbest",data=>{
		console.log("data테스트"+data);		
		console.log("data테스트2"+data[0]["bookName"]);
		
		
		let str="<tr>";	
		str+="<td colspan='5' >";
		str+="<hr>";
		str+="&nbsp;&nbsp;<a id='likebest' style='cursor:pointer' onclick='fn_likebest()'>관심도서순위</a> &nbsp;&nbsp;  <a id='lendingbest' style='cursor:pointer; font-size:20px; color:skyblue' onclick='fn_lendingbest()'>대출베스트</a>  &nbsp;&nbsp; <a id='recommend' style='cursor:pointer'  onclick='fn_recommend()'>기관추천도서</a>";
		str+="<hr>"
		str+="</td>"
		str+="</tr>"
		str+="<tr>"
		  for(let i=0;i<data.length; i++){
			str+="<td id='imgContainerDiv'  >"
			  str+="<img id='bookImg' src='"+data[i]["bookImg"]+"' alt='"+data[i]["bookName"]+"'"
			  str+="onclick='location.href=\"${pageContext.request.contextPath}/searchpage/bookDetail.do?isbnNo="+data[i]["isbnNo"]+"\" ' style='cursor:pointer;'><br><br>"
					  str+="<span>"+data[i]["bookName"].substring(0,13)+"</span>"  	
			str+="</td>"
		  }
	   str+="</tr>"
	   str+="<tr>"
	   str+="<td colspan='5'>"
	   str+="<hr>"
	   str+="</td>"
	   str+="</tr>"
	 
	   $('#recommendTable2').html("");
	   $('#recommendTable2').html(str).show(500);
	
	
   });
}

function fn_recommend(){
	
	$.ajax({
		url: 'http://api.kcisa.kr/openapi/service/rest/meta/KPEagen?serviceKey=7768636f-81cf-4cd9-8da9-f46a57b56e89&numOfRows=20&pageNo=1',
		type: 'GET',
		dataType: 'xml',
		timeout: 1000,
		error: function(){
			alert('Error loading XML document');
		},
		success: function(xml){
			let arr = [];
			let bookArr = [];
			$(xml).find('item').each(function(){ // xml 문서 item 기준으로 분리후 반복
				 let creator = $(this).find("creator").text(); 
				 let title = $(this).find("title").text(); 
				 let description = $(this).find("description").text(); 
				 let rights = $(this).find("rights").text(); 
				 /*var view_text = link + title + description + tag ;
				 $("#id").append(view_text);   */
				 let obj= new Object();
				 
				 obj["title"] = title.replace(/\(.*\)/g, '');
				 
				 arr.push(obj);
				  console.log("creator="+creator+"title="+title+"description="+description+"rights="+rights); 
				 
			});	
			
			
			   let formData = {
					   "nameArr": [  arr[0]["title"],arr[1]["title"],arr[2]["title"],arr[3]["title"],arr[4]["title"],arr[5]["title"],arr[6]["title"],arr[7]["title"]  ]
					   }
			   
				   console.log("formData테스트"+formData);
			   $.ajax({
				  url : "${pageContext.request.contextPath}/searchpage/recommendBook",
				  type : "post",
				  dataType: "json",
				  data : formData,				  
				  success : function(data){
					  
					 
					    let str="<tr>";	
						str+="<td colspan='5' >";
						str+="<hr>";
						str+="&nbsp;&nbsp;<a id='likebest' style='cursor:pointer' onclick='fn_likebest()'>관심도서순위</a> &nbsp;&nbsp;  <a id='lendingbest' style='cursor:pointer' onclick='fn_lendingbest()'>대출베스트</a>  &nbsp;&nbsp; <a id='recommend' style='cursor:pointer; font-size:20px; color:skyblue;'  onclick='fn_recommend()'>기관추천도서</a>";
						str+="<hr>"
						str+="</td>"
						str+="</tr>"
						str+="<tr>"
						  for(let i=0;i<data.length; i++){
							str+="<td id='imgContainerDiv'  >"
							  str+="<img id='bookImg' src='"+data[i]["bookImg"]+"' alt='"+data[i]["bookName"]+"'"
							  str+="onclick='location.href=\"${pageContext.request.contextPath}/searchpage/bookDetail.do?isbnNo="+data[i]["isbnNo"]+"\" ' style='cursor:pointer;'><br><br>"
									  str+="<span>"+data[i]["bookName"].substring(0,13)+"</span>"  	
							str+="</td>"
						  }
								
					   str+="</tr>"
					   str+="<tr>"
					   str+="<td colspan='5'>"
					   str+="<hr>"
					   str+="</td>"
					   str+="</tr>"
					 
					   $('#recommendTable2').html("");
					   $('#recommendTable2').html(str).show(500);
					  
				  }
			   
			   })
			   	
			
		}
				
	})
		
}





	 let setCookie= function(cookie_name, value, days) {
		 let exdate = new Date();
		  exdate.setDate(exdate.getDate() + days);
		  // 설정 일수만큼 현재시간에 만료값으로 지정
	
		 let cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
		  document.cookie = cookie_name + '=' + cookie_value;
		}
	
	 let getCookie=function(cookie_name) {
		 let x, y;
		 let val = document.cookie.split(';');
	
			  for (let i = 0; i < val.length; i++) {
			    x = val[i].substr(0, val[i].indexOf('='));
			    y = val[i].substr(val[i].indexOf('=') + 1);
			    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
			    if (x == cookie_name) {
			      return unescape(y); // unescape로 디코딩 후 값 리턴
			    }
			  }
			}
	 
	
	 
  $(function(){	
	     let keywordArray=[];
	     
	     if(getCookie("searchKeyword")!=null&&getCookie("searchKeyword")!=''){
		    keywordArray= getCookie("searchKeyword").split(',');		    
		    
	     }else{
	    	 console.log($("#recentKeywordList"));
			 $("#recentKeywordList").hide(); 
	     }
	     
		 for(let i=0; i<$(".skwd").length; i++){			 
				 if(keywordArray[i]!=null && keywordArray[i]!==undefined){
				 $(".skwd").eq(i).append("<a href='${path}/searchpage/bookTotalSearch?keyword="+keywordArray[i]+"&category=all'>"+keywordArray[i]+"</a><a style='color:black' type='button' onclick='deleteKeyword("+i+")' class='btnClear'>☒</a>");
				 
				 }
				
		 }
			 	   
	 })
	 
  function deleteKeyword(num){ 
		  $(".skwd").eq(num).empty();
		  
		 let keywordArray=[];
		     
		 if(getCookie("searchKeyword")!=null){
		   keywordArray= getCookie("searchKeyword").split(',');
		 }
		 
		 keywordArray.splice(num,1);
		 
		 setCookie("searchKeyword",keywordArray,3);
		 
		 
	
	  
  }
	 
 function fn_searchBook(){
	let category=$("#searchKey").val();
	let keyword=document.getElementById('inputtext').value;	  
	
	
	addCookie(keyword);
				 
	
	location.href="${path}/searchpage/bookTotalSearch?keyword="+keyword+"&category="+category;
	

	
}

function fn_searchBook2(){
	let keyword=$("#inputtext").val();
	let category=$("#searchKey").val();
	let searchNumber=$("#searchNumber").val();
	  addCookie(keyword);
	
	location.href="${path}/searchpage/bookTotalSearch?keyword="+keyword+"&category="+category+"&searchNumber="+searchNumber;
	
	
} 

function fn_paging(pageNo,totalData){
	console.log(totalData);
	let totalData2=parseInt(totalData);
	let keyword=$("#inputtext").val();
	let category=$("#searchType").val();
	let searchNumber=$("#searchNumber").val();
	
	location.href="${path}/searchpage/bookTotalSearch?keyword="+keyword+"&category="+category+"&searchNumber="+searchNumber+"&cPage="+pageNo+"&totalData="+totalData2;
	
}

/* function fn_paging2(pageNo,totalData,numPerpage,init,bookCategory,bookName,author,publisher,isbnNo,price,publishYear1,publishYear2){
	console.log(totalData);
	let totalData2=parseInt(totalData);
	let searchNumber=$("#searchNumber").val();
	
	location.href="${path}/searchpage/detailSearch?searchNumber="+numPerpage+"&cPage="+pageNo+"&totalData="+totalData2+"&init="+init+"&bookCategory="+bookCategory+"&bookName="+bookName+"&author="+author+"&publisher="+publisher+"&isbnNo="+isbnNo+"&price="+price+"&publishYear1="+publishYear1+"&publishYear2="+publishYear2;
	
} */



function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('bookCheck');
	 
	  checkboxes.forEach((checkbox) => {
		  
		  checkbox.checked = selectAll.checked;
    	    
	  })
	}
	

	 /* function interestingBook(){
		 const checkboxes 
	       = document.getElementsByName('bookCheck').value;
		 alert("관심도서를선택하세요.");
		 console.log(checkboxes);
			
		
	}  */

$(function(){
	
	$.ajax({
		url: 'http://api.kcisa.kr/openapi/service/rest/meta/KPEagen?serviceKey=7768636f-81cf-4cd9-8da9-f46a57b56e89&numOfRows=20&pageNo=1',
		type: 'GET',
		dataType: 'xml',
		timeout: 1000,
		error: function(){
			alert('Error loading XML document');
		},
		success: function(xml){
			let arr = [];
			$(xml).find('item').each(function(){ // xml 문서 item 기준으로 분리후 반복
				 let creator = $(this).find("creator").text(); 
				 let title = $(this).find("title").text(); 
				 let description = $(this).find("description").text(); 
				 let rights = $(this).find("rights").text(); 
				 /*var view_text = link + title + description + tag ;
				 $("#id").append(view_text);   */
				 let obj= new Object();
				 obj["creator"] = creator;
				 obj["title"] = title.replace(/\(.*\)/g, '');
				 obj["description"] = description;
				 obj["rights"] = rights;
				 arr.push(obj);
				 /* console.log("creator="+creator+"title="+title+"description="+description+"rights="+rights); */
				 
			});
						
			/* console.log("테스트"+arr[0]["creator"]); */
			    
			let str="<a href='${path}/searchpage/bookTotalSearch?keyword="+arr[0]["title"]+"&category=all' id=span0>"+arr[0]["title"]+"</a>&nbsp;&nbsp;&nbsp;"
			    str+="<a href='${path}/searchpage/bookTotalSearch?keyword="+arr[1]["title"]+"&category=all' id=span1>"+arr[1]["title"]+"</a>&nbsp;&nbsp;&nbsp;"
			    str+="<a href='${path}/searchpage/bookTotalSearch?keyword="+arr[2]["title"]+"&category=all' id=span2>"+arr[2]["title"]+"</a>&nbsp;&nbsp;&nbsp;"
			    str+="<a href='${path}/searchpage/bookTotalSearch?keyword="+arr[3]["title"]+"&category=all' id=span3>"+arr[3]["title"]+"</a>&nbsp;&nbsp;&nbsp;"
			 			  
			     $(".populor-words").append(str);
			    for(let i=0; i<$(".kwd").length;i++){
			    	$(".kwd").eq(i).append("<a href='${path}/searchpage/bookTotalSearch?keyword="+arr[i]["title"]+"&category=all'>"+arr[i]["title"]+"</a>");
			    }
			
		
		}
		
	})
	
	
})



	function addCookie(id) {
		let items = getCookie('searchKeyword'); // 이미 저장된 값을 쿠키에서 가져오기
		let maxItemNum = 5; // 최대 저장 가능한 아이템개수
		let expire = 3; // 쿠키값을 저장할 기간
		  if (items) {
			  let itemArray = items.split(',');
		    if (itemArray.indexOf(id) != -1) {
		      // 이미 존재하는 경우 종료
		      console.log('Already exists.');
		    }
		    else {
		      // 새로운 값 저장 및 최대 개수 유지하기
		      itemArray.unshift(id);
		      if (itemArray.length > maxItemNum ) itemArray.length = 5;
		      items = itemArray.join(',');
		      setCookie('searchKeyword', items, expire);
		    }
		  }
		  else {
		    // 신규 id값 저장하기
		    setCookie('searchKeyword', id, expire);
		  }
		}
	   
$(function(){
	  
	  $(".list-group").children().eq(1).css({"backgroundColor" : "lightgrey"})
	  
		 	   
	})

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
