<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<%   request.setCharacterEncoding("UTF-8");
String pageId = request.getParameter("pageId");

%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="책상세검색"/>
</jsp:include>

<body>
  
  <div class="divcontainer1">
    <br>
    <h2 id="title11">상세검색</h2>
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
<br><br><br>
<form method="get" id="bookDetailSearchForm" action="${path}/searchpage/detailSearch">

 
   <table id="bookDetailSearchTbl">
        <tr>
          <td>
            종류
          </td>
          <td id="bookCategorySelectTd" colspan="2">
            <span>
             <select id="book_Category" name="book_Category" style="height:30px;">
              <option ${book_Category == "도서 대분류"?"selected" : "" }>도서 대분류</option>
              <option value="000" ${book_Category == "000"?"selected" : "" }>총류</option>
              <option value="100" ${book_Category == "100"?"selected" : "" }>철학</option>
              <option value="200" ${book_Category == "200"?"selected" : "" }>종교</option>
              <option value="600" ${book_Category == "600"?"selected" : "" }>예술</option>
              <option value="700" ${book_Category == "700"?"selected" : "" }>언어</option>
              <option value="800" ${book_Category == "800"?"selected" : "" }>문학</option>
              <option value="900" ${book_Category == "900"?"selected" : "" }>역사</option>
              <option value="843" ${book_Category == "843"?"selected" : "" }>소설</option>
              <option value="101" ${book_Category == "101"?"selected" : "" }>이론 및 철학의 효용</option>
              <option value="004" ${book_Category == "004"?"selected" : "" }>컴퓨터과학</option>
              <option value="005" ${book_Category == "005"?"selected" : "" }>프로그래밍</option>              
              <option value="209" ${book_Category == "209"?"selected" : "" }">종교사</option>
              <option value="603" ${book_Category == "603"?"selected" : "" }>미술사전</option>
              <option value="609" ${book_Category == "609"?"selected" : "" }>미술사</option>
              <option value="704" ${book_Category == "704"?"selected" : "" }>강연집</option>
              <option value="803" ${book_Category == "803"?"selected" : "" }>사전</option>
              <option value="902" ${book_Category == "902"?"selected" : "" }>역사보조학</option>
              
              <!-- <option value="socialScience">사회과학</option>
              <option value="naturalScience">자연과학</option>
              <option value="technologyScience">기술과학</option> -->
            </select>
            </span>
            
            
           <!--  <span>
            <select id="book_Category2" name="book_Category2" style="height:30px;">
              <option value="" selected>도서 소분류</option>
            </select>
             </span> -->
          </td>
          <td>
          </td>
          

        </tr>

        <tr>
          <td>
            초성검색
          </td>
          <td id="alphabetCheckTd" colspan="2">
            <label><input type="radio" name="init" value="44700,55203"   ${empty init || init == "44700,55203" ? "checked" : ""}>선택안함</label>&nbsp;&nbsp;&nbsp;
            <label><input type="radio" name="init" value="44700,45207" ${init == "44700,45207" ?"checked" : "" }>ㄱ</label>
            <label><input type="radio" name="init" value="45208,45795" ${init == "45208,45795" ?"checked" : "" }>ㄴ</label>
            <label><input type="radio" name="init" value="45796,46971" ${init == "45796,46971" ?"checked" : "" }>ㄷ</label>
            <label><input type="radio" name="init" value="46972,47559" ${init == "46972,47559" ?"checked" : "" }>ㄹ</label>
            <label><input type="radio" name="init" value="47560,48147" ${init == "47560,48147" ?"checked" : "" }>ㅁ</label>
            <label><input type="radio" name="init" value="48148,49323" ${init == "48148,49323" ?"checked" : "" }>ㅂ</label>
            <label><input type="radio" name="init" value="49324,50499" ${init == "49324,50499" ?"checked" : "" }>ㅅ</label>
            <label><input type="radio" name="init" value="50450,51087" ${init == "50450,51087" ?"checked" : "" }>ㅇ</label>
            <label><input type="radio" name="init" value="51088,52263" ${init == "51088,52263" ?"checked" : "" }>ㅈ</label>
            <label><input type="radio" name="init" value="52264,52851" ${init == "52264,52851" ?"checked" : "" }>ㅊ</label>
            <label><input type="radio" name="init" value="52852,53439" ${init == "52852,53439" ?"checked" : "" }>ㅋ</label>
            <label><input type="radio" name="init" value="53440,54027" ${init == "53440,54027" ?"checked" : "" }>ㅌ</label>
            <label><input type="radio" name="init" value="54028,54615" ${init == "54028,54615" ?"checked" : "" }>ㅍ</label>
            <label><input type="radio" name="init" value="54616,55203" ${init == "54616,55203" ?"checked" : "" }>ㅎ</label>
          </td>
         
 
        </tr>

        <tr>
            <td>
               도서명
            </td>
            <td colspan="2">
           <input type="text" name="bookName" placeholder="내용을 입력해주세요" id="inputtext2" value="${bookName }">
            </td>           

        </tr>
        <tr>
            <td>
              저자명
            </td>
            <td colspan="2">
               <input type="text" name="author" placeholder="내용을 입력해주세요" id="inputtext2" value="${author }">
                
            </td>  

        </tr>
        <tr>
            <td>
                출판사
            </td>
            <td colspan="2">
                <input type="text" name="publisher" placeholder="내용을 입력해주세요" id="inputtext2" value="${publisher }">
                
            </td>

        </tr>
        <tr>
            <td>
              ISBN
            </td>
            <td colspan="2">
                <input type="text" name="isbnNo" placeholder="내용을 입력해주세요" id="inputtext2" value="${isbnNo }">
                
            </td>
           

        </tr>
        <tr>
          <td>
            가격
          </td>
          <td colspan="2">
              <input type="text" name="price" placeholder="내용을 입력해주세요" id="inputtext2" value="${price }">
              
          </td>
          
         

      </tr>
        <tr>
            <td >
               발행연도
            </td>
            <td >
           
            <input id="publishYear1" type="date" name="publishYear" placeholder="발행년(시작)" value="${publishYear }">-
               
               
            </td>
            
             <td >
              
                <input id="publishYear2" type="date" name="publishYear2" placeholder="발행년(끝)" value="${publishYear2}">
                
            </td>
            
            
        </tr>

        <tr>
          <td colspan="4">

            <br><br><br>
            <div id="buttonContainer">
            <button id="button21" type="button" onclick="fn_searchReset()">입력초기화</button>
            <button id="button21" type="submit" >검색</button>
            </div>
            <br><br><br>

          </td>


        </tr>


   </table>
   
   <table id="bookDetailSearchTbl2" style="display:none" >
        <tr>
          <td>
            종류
          </td>
          <td id="bookCategorySelectTd" colspan="2">
            <span>
             <select id="book_Category" name="book_Category" style="height:30px;">
              <option ${book_Category == "도서 대분류"?"selected" : "" }>도서 대분류</option>
              <option value="000" ${book_Category == "000"?"selected" : "" }>총류</option>
              <option value="100" ${book_Category == "100"?"selected" : "" }>철학</option>
              <option value="200" ${book_Category == "200"?"selected" : "" }>종교</option>
              <option value="600" ${book_Category == "600"?"selected" : "" }>예술</option>
              <option value="700" ${book_Category == "700"?"selected" : "" }>언어</option>
              <option value="800" ${book_Category == "800"?"selected" : "" }>문학</option>
              <option value="900" ${book_Category == "900"?"selected" : "" }>역사</option>
              <option value="843" ${book_Category == "843"?"selected" : "" }>소설</option>
              <option value="101" ${book_Category == "101"?"selected" : "" }>이론 및 철학의 효용</option>
              <option value="004" ${book_Category == "004"?"selected" : "" }>컴퓨터과학</option>
              <option value="005" ${book_Category == "005"?"selected" : "" }>프로그래밍</option>              
              <option value="209" ${book_Category == "209"?"selected" : "" }">종교사</option>
              <option value="603" ${book_Category == "603"?"selected" : "" }>미술사전</option>
              <option value="609" ${book_Category == "609"?"selected" : "" }>미술사</option>
              <option value="704" ${book_Category == "704"?"selected" : "" }>강연집</option>
              <option value="803" ${book_Category == "803"?"selected" : "" }>사전</option>
              <option value="902" ${book_Category == "902"?"selected" : "" }>역사보조학</option>
           
            </select>
            </span>
 
          </td>
          <td>
          </td> 
        </tr>
        <tr>
          <td>
            초성검색
          </td>
          <td id="alphabetCheckTd" colspan="2">
            <label><input type="radio" name="init" value="44700,55203"   ${empty init || init == "44700,55203" ? "checked" : ""}>선택안함</label>&nbsp;&nbsp;&nbsp;
            <label><input type="radio" name="init" value="44700,45207" ${init == "44700,45207" ?"checked" : "" }>ㄱ</label>
            <label><input type="radio" name="init" value="45208,45795" ${init == "45208,45795" ?"checked" : "" }>ㄴ</label>
            <label><input type="radio" name="init" value="45796,46971" ${init == "45796,46971" ?"checked" : "" }>ㄷ</label>
            <label><input type="radio" name="init" value="46972,47559" ${init == "46972,47559" ?"checked" : "" }>ㄹ</label>
            <label><input type="radio" name="init" value="47560,48147" ${init == "47560,48147" ?"checked" : "" }>ㅁ</label>
            <label><input type="radio" name="init" value="48148,49323" ${init == "48148,49323" ?"checked" : "" }>ㅂ</label>
            <label><input type="radio" name="init" value="49324,50499" ${init == "49324,50499" ?"checked" : "" }>ㅅ</label>
            <label><input type="radio" name="init" value="50450,51087" ${init == "50450,51087" ?"checked" : "" }>ㅇ</label>
            <label><input type="radio" name="init" value="51088,52263" ${init == "51088,52263" ?"checked" : "" }>ㅈ</label>
            <label><input type="radio" name="init" value="52264,52851" ${init == "52264,52851" ?"checked" : "" }>ㅊ</label>
            <label><input type="radio" name="init" value="52852,53439" ${init == "52852,53439" ?"checked" : "" }>ㅋ</label>
            <label><input type="radio" name="init" value="53440,54027" ${init == "53440,54027" ?"checked" : "" }>ㅌ</label>
            <label><input type="radio" name="init" value="54028,54615" ${init == "54028,54615" ?"checked" : "" }>ㅍ</label>
            <label><input type="radio" name="init" value="54616,55203" ${init == "54616,55203" ?"checked" : "" }>ㅎ</label>
          </td>
        </tr>
        <tr>
            <td>
               도서명
            </td>
            <td colspan="2">
           <input type="text" name="bookName" placeholder="내용을 입력해주세요" id="inputtext2" value="${bookName }">
            </td>           
        </tr>
        <tr>
            <td>
              저자명
            </td>
            <td colspan="2">
               <input type="text" name="author" placeholder="내용을 입력해주세요" id="inputtext2" value="${author }">                
            </td>  
        </tr>
        <tr>
            <td>
                출판사
            </td>
            <td colspan="2">
                <input type="text" name="publisher" placeholder="내용을 입력해주세요" id="inputtext2" value="${publisher }">               
            </td>
        </tr>
        <tr>
            <td>
              ISBN
            </td>
            <td colspan="2">
                <input type="text" name="isbnNo" placeholder="내용을 입력해주세요" id="inputtext2" value="${isbnNo }">               
            </td>
        </tr>
        <tr>
          <td>
            가격
          </td>
          <td colspan="2">
              <input type="text" name="price" placeholder="내용을 입력해주세요" id="inputtext2" value="${price }">             
          </td>
      </tr>
        <tr>
            <td >
               발행연도
            </td>
            <td >          
            <input id="publishYear1" type="date" name="publishYear" placeholder="발행년(시작)" value="${publishYear }">-               
            </td>           
             <td >              
                <input id="publishYear2" type="date" name="publishYear2" placeholder="발행년(끝)" value="${publishYear2}">                
            </td>           
        </tr>
        <tr>
          <td colspan="4">
            <br><br><br>
            <div id="buttonContainer">
            <button id="button21" type="button" onclick="fn_searchReset()">입력초기화</button>
            <button id="button21" type="submit" >검색</button>
            </div>
            <br><br><br>
          </td>
        </tr>
   </table>  
</form>

<%-- <c:choose> 
   	<c:when test="${not empty list }">
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
		    value="">
		    <button id="searchButton" type="submit" ><i class="fa fa-search"></i>검색</button>
		  </form>
		
		 </div>
	</c:when>
</c:choose>
<br><br><br><br> --%>

<form id="searchResultForm" method="get" action="interestingbook">
<table id=searchResultTable2 style="margin:auto;" >

 <c:choose> 
   	<c:when test="${not empty list }">
   	
  
  <tr>
    <th colspan="5" id="searchCaptionTh2">
      <div style="text-align:center">
        <div id="searchCaption22">
            <p>            
             ${totalData }건  이 검색되었습니다.             
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
        <button id="button44"  type="button" onclick="fn_searchBook2();" style="border:none;width:50px;height:40px;">확인</button>
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

          
            
            <img id="totalSearchbookImg"  src="${b.bookImg }" alt="${b.bookName} " onclick="location.href='${path}/searchpage/bookDetail.do?isbnNo=${b.isbnNo }'"
             style="cursor:pointer;">
            
    </td>
    <td colspan="2">
          <div id="bookInfoDiv3">
            <dl class="authorData" id="bookTitleDl" >
               <dd>
                    
                    <a href="#link"  onclick="location.href='${path}/searchpage/bookDetail.do?isbnNo=${b.isbnNo }'"
                    style="cursor:pointer;"><c:out value="${b.bookName }"/></a>
            
                    </dd>
            </dl>
          </div>
         

      </td>
      <td id="buttonWrapTd" rowspan="2">
        <div class="buttonWrap">
           <input type="button" id="button22" style="margin-right:10px;"  onclick="location.href='${path}/searchpage/bookReservation?isbnNo=${b.isbnNo}'" value="도서예약신청" > 
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
       <div id="pagebar-container" style="margin-left:25%;">
        	${pageBar }
        </div>
     </c:when>
   </c:choose>


</body>
	<script>
	 $(function(){			 
			if( ($("input[name='bookCheck']").attr('value'))!=null ){
					 console.log( $("#bookDetailSearchTbl"));
					 $("#bookDetailSearchTbl").hide();	//category범위맞으면 해당메뉴보여주기					 										 
			}else{
					 $("#bookDetailSearchTbl").show();
			}		 
			 			 					 
        })

   
        function fn_searchBook2(){
        	
            let searchNumber=$("#searchNumber").val();
        	
        	/* const formElement = $("#bookDetailSearchForm");
        	const table = $("#bookDetailSearchTbl");*/
        	
        	
        	let bookCategory=$("select[name=book_Category]").val();
        	let init=$('input[name="init"]:checked').val();
        	let bookName=$('input[name=bookName]').val();
        	let author=$('input[name=author]').val();
        	let publisher=$('input[name=author]').val();
        	
        	let isbnNo=$('input[name=isbnNo]').val();
        	let price=$('input[name=price]').val();
        	let publishYear1=$('input[name=publishYear]').val();
        	let publishYear2=$('input[name=publishYear2]').val();
        	console.log("test2")
        	console.log("bookcategory="+bookCategory+"init="+init+"bookNane="+bookName+"author="+author+"publisher="+publisher+"isbnNo="+isbnNo+"price="+price+"publishYear1"+publishYear1+"publishYear2="+publishYear2)
        	
        	let str="${path}/searchpage/detailSearch?";        	
        		str+="bookCategory="+bookCategory;
        	console.log(str);        
        		str+="&init="+init;
        		console.log(str);        	
        		str+="&bookName="+bookName;
        		console.log(str);       	
        		str+="&author="+author;
        		console.log(str);       	
        		str+="&publisher="+publisher;
        		console.log(str);       	
        		str+="&isbnNo="+isbnNo;
        		console.log(str);        	
        		str+="&price="+price;
        		console.log(str);        	
        		str+="&publishYear="+publishYear1;
        		console.log(str);        	
        		str+="&publishYear2="+publishYear2;
        		console.log(str);        	
        	
        	str+="&searchNumber="+searchNumber+"&cPage="+1;
        	      
        	location.href=str;
        	
        	
        } 

  
       
        
        function fn_paging(pageNo,totalData,numPerpage){
        	
        	let totalData2=parseInt(totalData);
        	let searchNumber=$("#searchNumber").val();
        	
        	/* const formElement = $("#bookDetailSearchForm");
        	const table = $("#bookDetailSearchTbl");*/
        	
        	
        	let bookCategory=$("select[name=book_Category]").val();
        	let init=$('input[name="init"]:checked').val();
        	let bookName=$('input[name=bookName]').val();
        	let author=$('input[name=author]').val();
        	let publisher=$('input[name=author]').val();
        	
        	let isbnNo=$('input[name=isbnNo]').val();
        	let price=$('input[name=price]').val();
        	let publishYear1=$('input[name=publishYear]').val();
        	let publishYear2=$('input[name=publishYear2]').val();
        	console.log("test2")
        	console.log("bookcategory="+bookCategory+"init="+init+"bookNane="+bookName+"author="+author+"publisher="+publisher+"isbnNo="+isbnNo+"price="+price+"publishYear1"+publishYear1+"publishYear2="+publishYear2)
        	
        	let str="${path}/searchpage/detailSearch?";        	
        		str+="bookCategory="+bookCategory;
        	console.log(str);        
        		str+="&init="+init;
        		console.log(str);        	
        		str+="&bookName="+bookName;
        		console.log(str);       	
        		str+="&author="+author;
        		console.log(str);       	
        		str+="&publisher="+publisher;
        		console.log(str);       	
        		str+="&isbnNo="+isbnNo;
        		console.log(str);        	
        		str+="&price="+price;
        		console.log(str);        	
        		str+="&publishYear="+publishYear1;
        		console.log(str);        	
        		str+="&publishYear2="+publishYear2;
        		console.log(str);        	
        	
        	str+="&searchNumber="+searchNumber+"&cPage="+pageNo+"&totalData="+totalData2
        	      
        	location.href=str;
        	
        	
        }
        
        function fn_searchReset(){
        	$("#book_Category option:eq(0)").prop("selected", true);
        	$("#book_Category option:eq(0)").prop("selected", true);
        	$('input[name="init"]').removeAttr('checked');
        	
        	$('input[name="init"]')[0].checked = true;
   
   		    document.getElementById('inputtext2').value="";
   		    document.getElementById('publishYear1').value="";
   		    document.getElementById('publishYear2').value="";  		
        	
        }

      /*   function bookReservation(isbnNo){
        	console.log(isbnNo);
        	location.href="${path}/searchpage/bookReservation?isbnNo="+isbnNo;
        	
        }
 */
        function selectAll(selectAll)  {
        	  const checkboxes 
        	       = document.getElementsByName('bookCheck');
        	 
        	  checkboxes.forEach((checkbox) => {
        		  
        		  checkbox.checked = selectAll.checked;
            	    
        	  })
        	}
        	
        
        
        
        
  
        $(function(){
        	console.log(window.location.href );
        	
        	  
        	  $(".list-group").children().eq(2).css({"backgroundColor" : "lightgrey"})
        	  
        		 	   
        	})
	
	
</script>
</html>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
