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
    
    <!-- css -->
    <link rel="stylesheet" href="${path }/resources/css/hy.css">
    <link rel="stylesheet" href="${path }/resources/css/dg.css">
    <link rel="stylesheet" href="${path }/resources/css/hj.css">
    <link rel="stylesheet" href="${path }/resources/css/sh.css">
    <link rel="stylesheet" href="${path }/resources/css/sy.css">
    <link rel="stylesheet" href="${path }/resources/css/yh.css">
    <link rel="stylesheet" href="${path }/resources/css/cg.css">
    
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
    
    
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- DatePicker -->
    <link rel="stylesheet" href="${path }/resources/css/bootstrap-datepicker3.standalone.min.css">
    <script src="${path }/resources/js/bootstrap-datepicker.js"></script>
    <script src="${path }/resources/js/bootstrap-datepicker.kr.min.js"></script>
    
    <!-- Daum API 주소 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    
    <title>${param.title }</title>
</head>

<body id="ad_body">
    <header id="ad_header">
            <div id="header_title"><img src='${path}/resources/images/logo.png' width="200px" height="100px" style="border-radius:70%" onclick="javascript:location.assign('${path}/admin/main.do')"></div>
            <div id="header_options">
                <div id="header_moveMain"><a href="${path }" style="color:black;text-decoration:none;">메인페이지</a></div>
                <div id="header_logout" style="cursor:pointer;" onclick="javascript:location.replace('${path}/member/memberLogout.do')">로그아웃</div>
        </div>
    </header>
   	<section id="ad_container">
        <div id="ad_left">
            <div id="leftNav">
                <ul id="lefNavList">
                    <li>회원관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li><a href="${path }/admin/member/memberList.do" class="opStyle">회원조회</a></li>
                            <li><a href="${path }/admin/member/memberWithdraw.do" class="opStyle">탈퇴요청</a></li>
                        </ul>
                    </li>                            
                    <li>도서관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li><a href="${path }/admin/book/bookAllList.do" class="opStyle">도서조회</a></li>
                            <li><a href="${path }/admin/book/bookRentalList.do" class="opStyle">대출도서</a></li>
                            <li><a href="${path }/admin/book/bookReservedList.do" class="opStyle">예약도서</a></li>
                            <li><a href="${path }/admin/book/bookWishList.do" class="opStyle">희망도서</a></li>
                            <li><a href="${path }/admin/book/registerBook.do" class="opStyle">도서등록</a></li>
                        </ul>
                    </li>
                    <li>게시글 관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li><a href="${path }/admin/notice/noticeList.do" class="opStyle">공지사항 관리</a></li>
                            <li><a href="${path }/admin/qna/adminqnaList.do" class="opStyle">문의사항 관리</a></li>
                        </ul>
                    </li>
                    <li>열람실 관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li><a href="${path }/admin/studyroom/studyroomAllList.do" class="opStyle">열람실 조회</a></li>
                            <li><a href="${path }/admin/studyroom/studyroomA.do" class="opStyle">열람실 A</a></li>
                            <li><a href="${path }/admin/studyroom/studyroomB.do" class="opStyle">열람실 B</a></li>
                            <li><a href="${path }/admin/studyroom/studyroomC.do" class="opStyle">열람실 C</a></li>
                            <li><a href="${path }/admin/studyroom/studyroomD.do" class="opStyle">열람실 D</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
       





