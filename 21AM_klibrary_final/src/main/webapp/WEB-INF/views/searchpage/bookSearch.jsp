<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%   request.setCharacterEncoding("UTF-8");
String pageId = request.getParameter("pageId");

%> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="통합검색"/>
</jsp:include>




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
    <li class="list-group-item" onclick="location.replace('${path}/klibrary/searchpage/bookSearch.do')">통합검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/klibrary/searchpage/detailSearch.do')">상세검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/klibrary/searchpage/categorySearch.do')">주제별검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/klibrary/searchpage/wishbook.do')">희망도서신청</li>
  </ul>
</div>


<div class="book-search-container">
  <div class="populor-words">
  
    <span>인기검색어<i class="fa fa-search"></i></span>&nbsp;&nbsp;
    <span>책1</span>&nbsp;
    <span>책2</span>&nbsp;
    <span>책3</span>
    
  </div>

  <form id="bookSearchForm" action="/action_page.php">

    <div class="searchSelectDiv">
      <label for="searchKey" class="blind"></label>
      <select id="searchKey" name="searchKey" title="검색 선택">
        <option value="ALL">전체</option>
        <option value="TITLE" selected="selected">서명</option>
        <option value="AUTHOR">저자</option>
        <option value="PUBLISHER">발행자</option>
        <option value="KEYWORD">키워드</option>

      </select>

    </div>

    <input type="text" placeholder="  검색" name="search" id="inputtext">
    <button id="searchButton" type="submit"><i class="fa fa-search"></i>검색</button>
  </form>

</div>

</body>

</html>
<script>
$(function(){
	$('.list-group-item').click(function(){
		$('.list-group-item').removeClass('on')
		  $(this).addClass('on')
	})
	
})
$(function(){
	console.log(window.location.href );
	  if(window.location.href=='http://localhost:9090/klibrary/searchpage/wishbook.do'||window.location.href=='http://localhost:9090/klibrary/searchpage/wishbookRequest.do'){
		  console.log(document.getElementsByClassName('list-group-item')[1]);
		  document.getElementsByClassName('list-group-item')[1].style.background = "";
		  document.getElementsByClassName('list-group-item')[2].style.background = "";
		  document.getElementsByClassName('list-group-item')[3].style.background = "";
		  document.getElementsByClassName('list-group-item')[4].style.background = "lightgrey";
		  
	  } if(window.location.href=='http://localhost:9090/klibrary/searchpage/bookSearch.do'){
		  document.getElementsByClassName('list-group-item')[1].style.background = "lightgrey";
		  document.getElementsByClassName('list-group-item')[2].style.background = "";
		  document.getElementsByClassName('list-group-item')[3].style.background = "";
		  document.getElementsByClassName('list-group-item')[4].style.background = "";
	  } if(window.location.href=='http://localhost:9090/klibrary/searchpage/detailSearch.do'){
		  document.getElementsByClassName('list-group-item')[1].style.background = "";
		  document.getElementsByClassName('list-group-item')[2].style.background = "lightgrey";
		  document.getElementsByClassName('list-group-item')[3].style.background = "";
		  document.getElementsByClassName('list-group-item')[4].style.background = "";
	  } if(window.location.href=='http://localhost:9090/klibrary/searchpage/categorySearch.do'){
		  document.getElementsByClassName('list-group-item')[1].style.background = "";
		  document.getElementsByClassName('list-group-item')[2].style.background = "";
		  document.getElementsByClassName('list-group-item')[3].style.background = "lightgrey";
		  document.getElementsByClassName('list-group-item')[4].style.background = "";
	  }
	
	 
	   
	})

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
