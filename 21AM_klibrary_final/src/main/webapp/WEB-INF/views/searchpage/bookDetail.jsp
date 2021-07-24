
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="도서상세페이지"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<%   request.setCharacterEncoding("UTF-8");
/* String pageId = request.getParameter("pageId");
String keyword = request.getParameter("keyword");
String category = request.getParameter("category"); */


%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



	<body>
  
  <div class="divcontainer1">
    <br>
    <h2 id="bookinfotitle1">도서정보</h2>
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


<div id="searchResultDiv">
 <c:choose> 
   	<c:when test="${not empty book }">
<table  id=searchResultTable>
 <tr>
     <td id="bookTitleTd" colspan="3">
        
            <span class="cate">도서 &nbsp;&nbsp;&nbsp;</span>
            <span ><c:out value="${book.bookInfo.bookName }"/></span>
           
     </td>
 </tr>

  
  <tr>
      
    <td id="imgContainerDiv">

          
            
            <img id="bookImg" src="${book.bookInfo.bookImg }" alt="${book.bookInfo.bookName }">
            
    </td>
    <th id="bookInfoTd">
         
           
                    저자     <br>
                    발행자     <br>              
                    발행연도   <br>            
                    ISBN  <br>
                    분류번호 <br>
                    위치번호      
                                                               
                                                            
               
          
         

      </th>
      <td id="bookInfoTd2">
         <span><c:out value="${book.bookInfo.bookWriter }"/></span><br>
                <span><c:out value="${book.bookInfo.bookCompany }"/></span><br>                    
                <span><c:out value="${book.bookInfo.bookDate }"/></span><br>                            
                <span><c:out value="${book.bookInfo.isbnNo }"/></span><br>
                 <span><c:out value="${book.bookInfo.bookKdc }"/></span><br>
                 <span><c:out value="${book.bookInfo.bookLocation }"/></span>
        
      </td>
      
    </tr>
   
  </table>
  </c:when>
  </c:choose>
  

  <div class="resultBookDesc">
							
    <div >
        <h3 >내용</h3>
        
            
                
        
    </div>
    <div class="desc">
        <p>
         ${book.bookInfo.bookContent}
        </p><span>...</span>
    </div>
   


</div>
<br><br>
<h3 class="bookCurrentStatusTitle">소장정보</h3>
<br>

<div class="tblWrap mobileHide2">
	<table class="tblhasLibrary">
		
	
		<thead class="bookStatusThead">
			<tr class="bookStatusTr">

            	<th id="firstTh"><span>선택</span></th>				
				<th >대출가능여부</th>
				<th >청구기호</th>
				<th >도서번호</th>
					<c:choose>
					<c:when test="${not empty lending }">	
					<th >반납예정일</th>
					</c:when>
					</c:choose>
				<th >예약가능여부</th>
				
			</tr>
		</thead>
		<tbody>
			
				<tr>
					
					<td><input type="checkbox" name="bookCheck" id="check1" value="${book.isbnNo }"></td>
					
					<td>
						<c:out value="${book.lendingState }"/>
						
					</td>
					<td>
						
						
							<a><c:out value="${book.bookInfo.bookLocation }"/></a>
						
					</td>
					<td><c:out value="${book.bookNo }"/></td>
						<c:choose>
							<c:when test="${not empty lending }">	
								<td>
								   <c:out value="${lending.returnDate }"/>
								</td>
							</c:when>					
						</c:choose>
				
						<td>
						<c:choose>
						<c:when test="${book.lendingState eq '가능'}">
						<span>예약가능</span><br>
						<a href="#btn" onclick="" name="booking" value="${book.isbnNo }" class="tblBtn tB01">예약하기</a>
   					    </c:when>
   					    <c:otherwise>
   					       <span>예약불가</span>
   					    </c:otherwise>
   					    </c:choose>
						</td>
	
				</tr>
			
		</tbody>
	</table>

       <div class="btnGroup">
							
        <a href="" id="addBasketBatchBtn" class="btn down themeBtn">관심도서담기</a>
        <a href="" id="btnView" class="btn down themeBtn">관심도서보기</a>
    
        
        <a href="javascript:history.back();" id="listBtn" class="btn down themeBtn">목록으로</a>
       <%--  <%if( keyword!=null) {%>
        <a href="${path}/searchpage/bookTotalSearch?keyword=<%=keyword %>&category=<%=category %>" id="listBtn" class="btn down themeBtn">목록으로</a>
        <%} %> --%>
        </div>
</div>
<br><br><br><br>

</div>


</body>
	
	
</html>
<script>
$(function(){
	console.log(window.location.href );
	  if(window.location.href=='http://localhost:9090/klibrary/searchpage/wishbook.do'||window.location.href=='http://localhost:9090/klibrary/searchpage/wishbookRequest.do'){
		  console.log(document.getElementsByClassName('list-group-item')[1]);
		  
		  document.getElementsByClassName('list-group-item')[4].style.background = "lightgrey";
		  
	  }else if(window.location.href=='http://localhost:9090/klibrary/searchpage/bookSearch.do'||(window.location.href).includes('http://localhost:9090/klibrary/searchpage/bookTotalSearch')){
		  document.getElementsByClassName('list-group-item')[1].style.background = "lightgrey";
		
	  }else if(window.location.href=='http://localhost:9090/klibrary/searchpage/detailSearch.do'){
		
		  document.getElementsByClassName('list-group-item')[2].style.background = "lightgrey";
		 
	  }else if(window.location.href=='http://localhost:9090/klibrary/searchpage/categorySearch.do'){
		
		  document.getElementsByClassName('list-group-item')[3].style.background = "lightgrey";
		 
	  }
	
	 
	   
	})


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	