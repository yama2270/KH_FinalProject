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
</div>


<div class="book-search-container">
  <div class="populor-words">
  
    <span>인기검색어<i class="fa fa-search"></i></span>&nbsp;&nbsp;
    <span>책1</span>&nbsp;
    <span>책2</span>&nbsp;
    <span>책3</span>
    
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
    <button id="searchButton" type="submit" ><i class="fa fa-search"></i>검색</button>
  </form>

</div>
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
        <select id="searchType" title="검색선택" name="category">
            <option value="all" selected="selected">전체</option>
            <option value="book_name" >도서명</option>
          <option value="book_writer">저자</option>
          <option value="book_company">발행자</option>
          <option value="isbnNo">ISBN</option>
  
        </select>
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
    <td colspan="5">
      <hr>
      
      <input type="checkbox" name="bookSelect" id="allCheck" onclick="selectAll(this)" value="all">
      <button id="button22" type="submit"  >관심도서담기</button>
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
          <button id="button22" type="button" onclick="bookReservation(${b.isbnNo })" >도서예약신청</button>
          <button id="button22" type="submit" name="bookCheck" value="${b.isbnNo }" >관심도서담기</button>
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


</body>

</html>
<script>

 function fn_searchBook(){
	let category=$("#searchKey").val();
	let keyword=document.getElementById('inputtext').value;
	
	console.log(keyword);
	console.log(category);
	location.href="${path}/searchpage/bookTotalSearch?keyword="+keyword+"&category="+category;
	
	
}

function fn_searchBook2(){
	let keyword=$("#inputtext").val();
	let category=$("#searchType").val();
	let searchNumber=$("#searchNumber").val();
	
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

function bookReservation(isbnNo){
	console.log(isbnNo);
	location.href="${path}/searchpage/bookReservation?isbnNo="+isbnNo;
	
}

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
	console.log(window.location.href );
	
	  
	  $(".list-group").children().eq(1).css({"backgroundColor" : "lightgrey"})
	  
		 	   
	})

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
