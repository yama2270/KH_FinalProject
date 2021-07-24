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
<form method="post" id="bookDetailSearchForm" action="${path}/searchpage/detailSearch">

<c:choose> 
   <c:when test="${empty list }">
   <table id="bookDetailSearchTbl">
        <tr>
          <td>
            종류
          </td>
          <td id="bookCategorySelectTd" colspan="2">
            <span>
             <select id="book_Category" name="book_Category" style="height:30px;">
              <option selected>도서 대분류</option>
              <option value="000">총류</option>
              <option value="100">철학</option>
              <option value="200">종교</option>
              <option value="600">예술</option>
              <option value="700">언어</option>
              <option value="800">문학</option>
              <option value="900">역사</option>
              <option value="843">소설</option>
              <option value="101">이론 및 철학의 효용</option>
              <option value="004">컴퓨터과학</option>
              <option value="005">프로그래밍</option>              
              <option value="209">종교사</option>
              <option value="603">미술사전</option>
              <option value="609">미술사</option>
              <option value="704">강연집</option>
              <option value="803">사전</option>
              <option value="902">역사보조학</option>
              
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
            <label><input type="radio" name="init" value="44700,45207">ㄱ</label>
            <label><input type="radio" name="init" value="45208,45795">ㄴ</label>
            <label><input type="radio" name="init" value="45796,46971">ㄷ</label>
            <label><input type="radio" name="init" value="46972,47559">ㄹ</label>
            <label><input type="radio" name="init" value="47560,48147">ㅁ</label>
            <label><input type="radio" name="init" value="48148,49323">ㅂ</label>
            <label><input type="radio" name="init" value="49324,50499">ㅅ</label>
            <label><input type="radio" name="init" value="50450,51087">ㅇ</label>
            <label><input type="radio" name="init" value="51088,52263">ㅈ</label>
            <label><input type="radio" name="init" value="52264,52851">ㅊ</label>
            <label><input type="radio" name="init" value="52852,53439">ㅋ</label>
            <label><input type="radio" name="init" value="53440,54027">ㅌ</label>
            <label><input type="radio" name="init" value="54028,54615">ㅍ</label>
            <label><input type="radio" name="init" value="54616,55203">ㅎ</label>
          </td>
         
 
        </tr>

        <tr>
            <td>
               도서명
            </td>
            <td colspan="2">
           <input type="text" name="bookName" placeholder="내용을 입력해주세요" id="inputtext2">
            </td>           

        </tr>
        <tr>
            <td>
              저자명
            </td>
            <td colspan="2">
               <input type="text" name="author" placeholder="내용을 입력해주세요" id="inputtext2">
                
            </td>  

        </tr>
        <tr>
            <td>
                출판사
            </td>
            <td colspan="2">
                <input type="text" name="publisher" placeholder="내용을 입력해주세요" id="inputtext2">
                
            </td>

        </tr>
        <tr>
            <td>
              ISBN
            </td>
            <td colspan="2">
                <input type="text" name="isbnNo" placeholder="내용을 입력해주세요" id="inputtext2">
                
            </td>
           

        </tr>
        <tr>
          <td>
            가격
          </td>
          <td colspan="2">
              <input type="text" name="price" placeholder="내용을 입력해주세요" id="inputtext2">
              
          </td>
          
         

      </tr>
        <tr>
            <td >
               발행연도
            </td>
            <td >
           
            <input id="publishYear1" type="date" name="publishYear" placeholder="발행년(시작)">-
               
               
            </td>
            
             <td >
              
                <input id="publishYear2" type="date" name="publishYear2" placeholder="발행년(끝)">
                
            </td>
            
            
        </tr>

        <tr>
          <td colspan="4">

            <br><br><br>
            <div id="buttonContainer">
            <button id="button21" type="button" onclick="">입력초기화</button>
            <button id="button21" type="submit" onclick="fn_searchDetail()">검색</button>
            </div>
            <br><br><br>

          </td>


        </tr>


   </table>
   
   </c:when>
  </c:choose>
</form>

<c:choose> 
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
<br><br><br><br>

<form id="searchResultForm" method="get" action="interestingbook">
<table id=searchResultTable2>

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
      <button id="button22" type="submit" name="bookCheck" value="" >관심도서담기</button>
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
	<script>
 /*  $(function() {
            $('#book_Category').change(function() {
                var general = ["총류일반", "도서관,정보학", "일반백과사전","일반전집,총서","필사본,희귀본"];
                var philosophy = ["철학일반", "고대,중세,동양철학", "서양철학(현대)","형이상학","심리학","윤리학"];
                var religion = ["기독교", "자연신학", "불교 및 한국종교","이슬람교","조로아스터교"];
                var socialScience = ["사회과학일반", "정치학", "법학","사회복지","무역","일반통계학","경제학","행정학","교육학"];
                var naturalScience = ["수학일반", "천문학", "물리학","화학","지구과학","생물학","식물학","동물학"];
                var technologyScience = ["기술과학일반", "일반공학", "화학공학","의학","농업","제조","건축"];
                var art = ["예술일반", "그림,장식예술", "판화,판각","음악","도시,풍경예술","조각","회화","사진술"];
                var language = ["어학일반", "영어", "불어","스페인,포르투갈어","고대그리스어","한국어","독어","이태리어","기타언어"];
                var history = ["지리,역사일반", "유럽역사", "아프리카역사","남아메리카 역사","아시아 역사","북아메리카 역사"];
                var changeItem;
                if (this.value == "general") {
                    changeItem = general;
                } else if (this.value == "philosophy") {
                    changeItem = philosophy;
                }
                else if (this.value == "religion") {
                    changeItem = religion;
                }
                else if (this.value == "socialScience") {
                    changeItem = socialScience;
                }
                else if (this.value == "naturalScience") {
                    changeItem = naturalScience;
                }
                else if (this.value == "technologyScience") {
                changeItem = technologyScience;
                }
                else if (this.value == "art") {
                changeItem = art;
                }
                else if (this.value == "language") {
                changeItem = language;
              }
                else if (this.value == "history") {
                changeItem = history;
                }
                
                $('#book_Category2').empty();
                for (var count = 0; count < changeItem.length; count++) {
                    var option = $("<option>" + changeItem[count] + "</option>");
                    $('#book_Category2').append(option);

                }
            });
        }); */
       function fn_searchDetail(){
        	 $("#bookDetailSearchTbl").hide(); 
        	
        	/* console.log("test1")
        	let bookCategory=$("#book_Category option:selected").val();
        	let init=$('input[name="init"]:checked').val();
        	let bookName=$('input[name=bookName]').val();
        	let author=$('input[name=author]').val();
        	let publisher=$('input[name=author]').val();
        	let isbnNo=$('input[name=isbnNo]').val();
        	let price=$('input[name=price]').val();
        	let publishYear1=$('input[name=publishYear1]').val();
        	let publishYear2=$('input[name=publishYear2]').val();
        	console.log("test2")
        	console.log("bookcategory="+bookCategory+"init="+init+"bookNane="+bookName+"author="+author+"publisher="+publisher+"isbnNo="+isbnNo+"price="+price+"publishYear1"+publishYear1+"publishYear2="+publishYear2)
        	
        	let str="${path}/searchpage/detailSearch?";
        	if (bookCategory!=null && bookCategory!=""){
        		str+="bookCategory="+bookCategory;
        	}else if (init!=null && init!=""){
        		str+="&init="+init;
        	}else if(bookName!=null && bookName!=""){
        		str+="&bookName="+bookName;
        	}else if(author!=null && author!=""){
        		str+="&author="+author;
        	}else if(publisher!=null && publisher!=""){
        		str+="&publisher="+publisher;
        	}else if(isbnNo!=null && isbnNo!=""){
        		str+="&isbnNo="+isbnNo;
        	}else if(price!=null && price !=""){
        		str+="&price="+price;
        	}else if(publishYear1 !=null && publishYear1 !=""){
        		str+="&publishYear1="+publishYear1;     		
        	}else if(publishYear2 !=null && publishYear2 != ""){
        		str+="&publishYear2="+publishYear2;
        	}else if(searchNumber !=null && pageNo != null && totalData2 != null){
        	
        	str+="&searchNumber="+searchNumber+"&cPage="+pageNo+"&totalData="+totalData2
        	
        	}
        	location.href=str; */
        	       	
        	
        }
       
  
        
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

        function fn_paging2(pageNo,totalData,numPerpage){
        	console.log(totalData);
        	let totalData2=parseInt(totalData);
        	let searchNumber=$("#searchNumber").val();
        	
        	const formElement = $("#bookDetailSearchForm");
        	const table = $("#bookDetailSearchTbl");
        	
        	let tr=$("<tr>");
        	let cPage=$("<td>").html(pageNo);
        	cPage.attr("name","cPage");
        	let searchNumberTd=$("<td>").html(searchNumber);
        	searchNumberTd.attr("name","searchNumber");
        	
        	tr.append(cPage).append(searchNumberTd);
        	table.append(tr);
        	
        	formElement.attr("action","${path}/searchpage/detailSearch")
        	formElement.submit();
        	
        	
        	
        	
        }

        function bookReservation(isbnNo){
        	console.log(isbnNo);
        	
        	
        }

        function selectAll(selectAll)  {
        	  const checkboxes 
        	       = document.getElementsByName('bookCheck');
        	 
        	  checkboxes.forEach((checkbox) => {
        		  
        		  checkbox.checked = selectAll.checked;
            	    
        	  })
        	}
        	
        
        
        
        
  
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
</html>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
