<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
 <link rel="stylesheet" href="${path }/resources/css/sy.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- css -->
    <link rel="stylesheet" href="${path }/resources/css/hy.css">
    <link rel="stylesheet" href="${path }/resources/css/dg.css">
    <link rel="stylesheet" href="${path }/resources/css/hj.css">
    <link rel="stylesheet" href="${path }/resources/css/sh.css">
    <link rel="stylesheet" href="${path }/resources/css/sy.css">
    <link rel="stylesheet" href="${path }/resources/css/yh.css">
    <link rel="stylesheet" href="${path }/resources/css/cg.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <!-- <script src="../js/jquery-3.6.0.min.js"></script> -->	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<title>Insert title here</title>
</head>
<body>
<header>
	<div id="header_top">
                <ul id="header_ul">
                <c:if test="${loginMember==null }">
                    <li>
                        <a href="${path }/member/memberLogin.do" class="header_a">로그인</a>
                    </li>
                    <li>
                        <a href="${path }/member/memberEnroll.do"  class="header_a">회원가입</a>
                    </li>
                </c:if>
                <c:if test="${loginMember!=null }">
                	<li>
                		<a href="" class="hader_a">마이페이지</a>
                	</li>
                	<li>
                		<button class="btn btn-outline-light text-dark" type="button" onclick="location.replace('${path}/member/memberLogout.do');">로그아웃</button>
                	</li>
                </c:if>
                </ul>
            </div>
        </div>
	<div id="nav">
		<ul id="main-menu">
			<li><a href="">자료검색</a>
				<ul id="sub-menu">
					<li><a href="${path}/searchpage/bookSearch.do" aria-label="subemnu">통합검색</a></li>
					<li><a href="${path}/searchpage/detailSearch.do" aria-label="subemnu">상세검색</a></li>
					<li><a href="${path}/searchpage/categorySearch.do" aria-label="subemnu">주제별검색</a></li>
					<li><a href="${path}/searchpage/wishbook.do" aria-label="subemnu">희망도서신청</a></li>
				</ul>
			</li>
			<li><a href="">열람실</a>
				<ul id="sub-menu">
					<li><a href="" aria-label="subemnu">열람실안내</a></li>
				</ul>
			</li>
			<li><a href="">이용안내</a>
				<ul id="sub-menu">
					<li><a href="" aria-label="subemnu">이용시간</a></li>
					<li><a href="" aria-label="subemnu">편의시설</a></li>
					<li><a href="" aria-label="subemnu">공지사항</a></li>
					<li><a href="" aria-label="subemnu">자주묻는질문</a></li>
					<li><a href="" aria-label="subemnu">QNA</a></li>
				</ul>
			</li>
			<li><a href="${path }/member/memberInfo.do">마이페이지</a>
				<ul id="sub-menu">
					<li><a href="" aria-label="subemnu">개인정보확인</a></li>
					<li><a href="" aria-label="subemnu">도서이용내역</a></li>    
					<li><a href="" aria-label="subemnu">희망도서</a></li>
					<li><a href="" aria-label="subemnu">관심도서</a></li>
					<li><a href="" aria-label="subemnu">열람실 이용내역</a></li>
					<li><a href="" aria-label="subemnu">모바일 회원증</a></li>  
					<li><a href="" aria-label="subemnu">회원탈퇴</a></li>              
				</ul>
			</li>
		</ul>
	</div>
</header> 
<hr>
</head>
