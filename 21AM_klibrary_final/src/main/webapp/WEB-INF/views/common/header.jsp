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
<title><c:out value="${param.title }"/></title>
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
	<div id=header-wraper>
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
                <c:if test='${loginMember!=null && (loginMember.userId).equals("admin") }'>
                	<li>
                		<a href="${path }/admin/main.do" class="hader_a btn btn-outline-light text-dark">관리자페이지</a>
                	</li>
                	<li>
                		<button class="btn btn-outline-light text-dark hader_a" type="button" onclick="location.replace('${path}/member/memberLogout.do');">로그아웃</button>
                	</li>
                </c:if>
                <c:if test='${loginMember!=null && !"admin".equals(loginMember.userId) }'>
                	<li>
                		<a href="" class="hader_a btn btn-outline-light text-dark">마이페이지</a>
                	</li>
                	<li>
                		<button class="btn btn-outline-light text-dark" type="button" onclick="location.replace('${path}/member/memberLogout.do');">로그아웃</button>
                	</li>
                </c:if>
                </ul>
            </div>
        
		
		<div id="nav">	
			<div>
				<a href="${path }/"><img src="${path }/resources/images/logo.png" width="400" height="200"></a>
			</div>
			<div class="nav">
			<ul id="main-menu">			
			<li id="subtitle"><a class="subtitle" href="">자료검색</a>
				<ul id="sub-menu">
					<li class="main-menu-li"><a href="${path}/searchpage/bookSearch.do" aria-label="subemnu">통합검색</a></li>
					<li class="main-menu-li"><a href="${path}/searchpage/detailSearch.do" aria-label="subemnu">상세검색</a></li>
					<li class="main-menu-li"><a href="${path}/searchpage/categorySearch.do" aria-label="subemnu">주제별검색</a></li>
					<li class="main-menu-li"><a href="${path}/searchpage/wishbook.do" aria-label="subemnu">희망도서신청</a></li>
				</ul>
			</li>
			<li id="subtitle"><a class="subtitle" href="">열람실</a>
				<ul id="sub-menu">
						
						<li class="main-menu-li"><a href="${path}/notice/redingroomA.do" aria-label="subemnu">열람실 A</a></li>
	                    <li class="main-menu-li"><a href="${path}/notice/redingroomB.do" aria-label="subemnu">열람실 B</a></li>
	                    <li class="main-menu-li"><a href="${path}/notice/redingroomC.do" aria-label="subemnu">열람실 C</a></li>
	                    <li class="main-menu-li"><a href="${path}/notice/redingroomD.do" aria-label="subemnu">열람실 D</a></li>
	                    <li class="main-menu-li"><a href="${path}/notice/redingroomnotice.do" aria-label="subemnu">열람실 이용안내</a></li>
				</ul>
			</li>
			<li id="subtitle"><a class="subtitle" href="">이용안내</a>
				<ul id="sub-menu">
					<li class="main-menu-li"><a href="${path}/notice/booktime.do" aria-label="subemnu">이용시간</a></li>
					<li class="main-menu-li"><a href="${path}/notice/copymachine.do" aria-label="subemnu">편의시설</a></li>
					<li class="main-menu-li"><a href="${path}/notice/noticeList.do" aria-label="subemnu">공지사항</a></li>
					<li class="main-menu-li"><a href="${path}/faq/faqList.do" aria-label="subemnu">자주묻는질문</a></li>
					<li class="main-menu-li"><a href="${path}/qna/qnaList.do" aria-label="subemnu">QNA</a></li>
				</ul>
			</li>
			<c:if test="${loginMember!=null }">
				<li id="subtitle"><a class="subtitle" href="${path }/member/memberInfo.do">마이페이지</a>
					<ul id="sub-menu">
						<li class="main-menu-li"><a href="${path }/member/memberInfo.do" aria-label="subemnu">개인정보확인</a></li>
						<li class="main-menu-li"><a href="${path }/member/memberBorrowing.do" aria-label="subemnu">도서이용내역</a></li>    
						<li class="main-menu-li"><a href="${path }/member/memberHopeBookRecord.do" aria-label="subemnu">희망도서</a></li>
						<li class="main-menu-li"><a href="${path }/member/memberBookMark.do" aria-label="subemnu">관심도서</a></li>
						<li class="main-menu-li"><a href="${path }/member/memberReadingRoom.do" aria-label="subemnu">열람실 이용내역</a></li>
						<li class="main-menu-li"><a href="${path }/member/membershipCard.do" aria-label="subemnu">모바일 회원증</a></li>  
						<li class="main-menu-li"><a href="${path }/member/memberDelete.do" aria-label="subemnu">회원탈퇴</a></li>              
					</ul>
				</li>
			</c:if>
			<c:if test="${loginMember==null }">
				<li><a href="${path }/member/memberLogin.do">마이페이지</a></li>
			</c:if>
			</ul>
			</div>
		</div>
	</div>
</header> 
<hr>
</head>
