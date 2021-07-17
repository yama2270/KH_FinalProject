<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    <li class="list-group-item">통합검색</li>
    <li class="list-group-item">상세검색</li>
    <li class="list-group-item">주제별검색</li>
    <li class="list-group-item">희망도서신청</li>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
