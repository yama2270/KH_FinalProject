
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="도서상세페이지"/>
</jsp:include>
<!-- Chart.js CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<%   request.setCharacterEncoding("UTF-8");
/* String pageId = request.getParameter("pageId");
String keyword = request.getParameter("keyword");
String category = request.getParameter("category"); */
String isbnNo = request.getParameter("isbnNo");

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


<div id="searchResultDiv5">
 <c:choose> 
   	<c:when test="${not empty book }">
<input type=hidden name="isbnNo" value="${book.bookInfo.isbnNo }">
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
                 
                    저자   <br>
                    발행자  <br>              
                    발행연도 <br>            
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
					
					<td><input type="checkbox" name="bookCheck" id="check1" ></td>
					
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
						<a href='${path}/searchpage/bookReservation?isbnNo=${book.bookInfo.isbnNo }' name="booking" value="${book.bookInfo.isbnNo }" class="tblBtn tB01">예약하기</a>
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
							
        <a href="${path}/searchpage/interestingbook?isbnNo=${book.bookInfo.isbnNo  }" id="addBasketBatchBtn" class="btn down themeBtn">관심도서담기</a>
        <a href="${path}/member/memberBookMark.do" id="btnView" class="btn down themeBtn">관심도서보기</a>
    
        
        <a href="javascript:history.back();" id="listBtn" class="btn down themeBtn">목록으로</a>
       <%--  <%if( keyword!=null) {%>
        <a href="${path}/searchpage/bookTotalSearch?keyword=<%=keyword %>&category=<%=category %>" id="listBtn" class="btn down themeBtn">목록으로</a>
        <%} %> --%>
        </div>
       
        
</div>
<br><br><br><br><br><br>
	      <c:choose>
	      <c:when test="${not empty ageList }">
		        <div class="canQua" >
							<div class="canQuaHea" style="text-align:right;"><h4>연령별 관심 현황</h4></div><br><br>
							<div class="quaCat" style="margin-left:35%;">
								<canvas id="likeBook" width="600px" height="300px"  ></canvas>
							</div>
				</div>
		</c:when>
		</c:choose>
<br><br><br>		
		<c:choose>
		<c:when test="${not empty publisherList }" >
		
				<table id=recommendTable2 style=" text-align:center;">
				 
				  <tr>
				    <td colspan="5" >
				      <hr>
				      이 책과 발행자가 같은 도서      
				      <hr>
				   </td>
				  </tr>
				    <tr>
				      
				  <c:forEach var="b" items="${publisherList }">
				        <td id="imgContainerDiv"  >
				
				            
				                
				                <img id="bookImg" src="${b.bookImg }" alt="${b.bookName}"
				                onclick="location.href='${path}/searchpage/bookDetail.do?isbnNo=${b.isbnNo }'" style="cursor:pointer;"><br>
				                <span><c:out value="${b.bookName }"/></span>
				                
				        </td>
				        
				 </c:forEach>
				   
				    
				    </tr>
				    
				    <tr>
				      <td colspan="5">
				         <hr>
				      </td>
				    </tr>
		       </table>
		 </c:when>
		 </c:choose>
<br><br><br>	
		<c:choose>
		<c:when test="${not empty kdcNoList }" >
		
		      <table id=recommendTable2 style=" text-align:center;">      
				 
				  <tr>
				    <td colspan="5" >
				      <hr>
				      이 책과 주제가 같은 도서      
				      <hr>
				   </td>
				  </tr>
				    <tr>
				      
				  <c:forEach var="b" items="${kdcNoList }">
				        <td id="imgContainerDiv"  >
				
				            
				                
				                <img id="bookImg" src="${b.bookImg }" alt="${b.bookName}"
				                onclick="location.href='${path}/searchpage/bookDetail.do?isbnNo=${b.isbnNo }'" style="cursor:pointer;"><br>
				                <span><c:out value="${b.bookName }"/></span>
				                
				        </td>
				 </c:forEach>
				    
				    </tr>
				    <tr>
				      <td colspan="5">
				         <hr>
				      </td>
				    </tr>
		     </table>	
		
		 </c:when>
		</c:choose>
		<br><br><br><br>  
</div>
 
 
 
       

</body>
	
	
</html>
<script>

//연령별 관심 현황

$(function(){
	let isbnNo = $("input[name='isbnNo']").attr('value');
	
 $.ajax({	
	url : "${path}/searchpage/selectAge.do?isbnNo="+isbnNo,
	success:function(data){
				
		 const keyArr = Object.keys(data);
		
 
		 // key 정렬 
		  keyArr.sort(function(a,b){
			if(a[0]>b[0]){
				return 1;
			} else {
			return -1;
			}
		})   
		console.log("keyArr테스트"+keyArr);
		const sortedList = {};
				 
		 keyArr.forEach(function(key){
			 
			sortedList[key] = data[key];
			console.log(sortedList[key]);
		}) 
		
	
		
		const likCan = document.getElementById("likeBook").getContext("2d");
		const likChart = new Chart(likCan,{
			type:"bar",
			data : {
				labels : keyArr,
				datasets : [{
					data : sortedList,
					backgroundColor : ["skyblue"],
					barThickness : 30
				}]
			},
			options : {
				responsive : false,
				scales : {
					y :{
						grid : {
							borderDash : [2,5]
						},
						//suggestedMin : 0,
						//suggestedMax : 10
						min : 0,
						max : 6
					}
				},
				plugins : {								// legend 설정 
					legend : {
						display : false 
					}
				},
			}
		})
	  }
   })
})
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	