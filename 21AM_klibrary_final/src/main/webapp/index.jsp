<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path }/resources/css/hy.css">
    <link rel="stylesheet" href="${path }/resources/css/dg.css">
    <link rel="stylesheet" href="${path }/resources/css/hj.css">
    <link rel="stylesheet" href="${path }/resources/css/sh.css">
    <link rel="stylesheet" href="${path }/resources/css/sy.css">
    <link rel="stylesheet" href="${path }/resources/css/yh.css">
    <link rel="stylesheet" href="${path }/resources/css/cg.css">
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <!-- JQuery -->
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
    <title>메인페이지</title>
</head>

<body>
	<h1>메인페이지</h1>
    <header>
        <div id="header">
            <div id="logo">
                <a href="" class="header_a">logo</a>
            </div>

            <div id="header_top">
                <ul id="header_ul">
                <c:if test="${loginMember1==null }">
                    <li>
                        <a href="${path }/member/memberLogin.do" class="header_a">로그인</a>
                    </li>
                    <li>
                        <a href="${path }/member/memberEnroll.do"  class="header_a">회원가입</a>
                    </li>
                </c:if>
                <c:if test="${loginMember1!=null }">
                	<li>
                		<a href="" class="hader_a">마이페이지</a>
                	</li>
                	<li>
                		<button class="btn btn-outline-light text-dark" type="button" onclick="${path}/member/memberLogout.do }">로그아웃</button>
                	</li>
                </c:if>
                </ul>
            </div>
        </div>

        <div id="nav">
            <ul id="main-menu">
                <li><a href="">자료검색</a></li>
                  <ul id="sub-menu">
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>
                  </ul>
                <li><a href="">열람실</a>
                  <ul id="sub-menu">
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>
                  </ul>
                </li>
                <li><a href="">이용안내</a>
                  <ul id="sub-menu">
                    <li><a href="#" aria-label="subemnu">뭐넣지</a></li>
                    <li><a href="#" aria-label="subemnu">뭐넣지</a></li>
                  </ul>
                </li>
                <li><a href="">마이페이지</a>
                  <ul id="sub-menu">
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>                    
                  </ul>
              </ul>
        </div>
    </header> 

    <hr>

    
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
            <img src="https://mblogthumb-phinf.pstatic.net/MjAxNzA1MzFfMTAg/MDAxNDk2MTkyODgzODIz.jhmAXS2asxbS1M9-IeBvi65TFbo50D9UYlOHNlmRm-kg.WGunJDi22LU6Wy_zX73ZSQ_TcNrR35gNwJpybs-eTLQg.JPEG.heeyy2/%EB%8F%84%EC%84%9C%EA%B4%80%EC%82%AC%EC%A7%84_3.jpg?type=w800" class="d-block w-100 image_container" alt="...">
            </div>
        </div>
    </div>

    <div id="carouselExampleSlidesOnly" class="carousel slide readingroom" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
            <a href=""><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj8K9DoY26dO6lExcxc6JVZCAY2ivpfv8a-w&usqp=CAU" class="d-block w-100 image_readingroom" alt="..."></a>
            </div>
        </div>
    </div>

    <div id="user_info">
  <!-- As a heading -->
  <nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
      <span class="navbar-brand mb-0 h1">이용안내</span>
      <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
          메뉴
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
          <li><button class="dropdown-item" type="button">이용시간</button></li>
          <li><button class="dropdown-item" type="button">휴무일</button></li>
          <li><button class="dropdown-item" type="button">찾아오시는 길</button></li>
        </ul>
      </div>
    </div>
  </nav>

  <div id="use_inform">
    <div class="use_inform">
        <ul>
            이용시간

            <li>도서관 이용시간 : 09:00 ~ 18:00</li>
            <li>열람실 이용시간 : 09:00 ~ 22:00</li>
            <li>공휴일 : 매주 수요일 휴무</li>
        </ul>
        </div>
        <div class="use_inform">
            <ul>
                찾아오시는길
                <li>주소 및 위치</li>
            </ul>
        </div>
    </div>
    </div>
    
    <div id="library_tab">
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">도서관</span>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
                메뉴
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                <li><button class="dropdown-item" type="button">뭐넣지</button></li>
                <li><button class="dropdown-item" type="button">뭐넣지</button></li>
                <li><button class="dropdown-item" type="button">뭐넣지</button></li>
                </ul>
            </div>
            </div>
        </nav>
        
        <div id="main_cate">
            <button type="button" class="btn btn-outline-secondary">소설</button>
            <button type="button" class="btn btn-outline-secondary">수필</button>
            <button type="button" class="btn btn-outline-secondary">시</button>
            <button type="button" class="btn btn-outline-secondary">과학</button>
            <button type="button" class="btn btn-outline-secondary">수학</button>
        </div>  
        
      </div>

      <div id="main_list">

      </div>



    <!-- footer -->
    <div id="footer">
        <hr>
        <p>
            TEL. 02.1234.5678 / 서울시 강남구 강남로<br>
            Copyright 2021. 코딩육망주<br>
            All right reserved.
        </p>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>