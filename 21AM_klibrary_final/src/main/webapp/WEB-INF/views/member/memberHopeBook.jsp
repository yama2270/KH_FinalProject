<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<link rel="stylesheet" href="${path }/resources/css/cg.css" type="text/css">  
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="희망도서 신청"/>
</jsp:include>

<section id="container">
<div>
	<div id="TitleContainer">
		<h2>통합검색</h2>
	</div>

	<div class="list-group-container" >
	  <ul class="list-group">
	    <li class="list-group-item" id="menutitle">
	    	마이페이지
	   	</li>
	    <li class="list-group-item">
	    	<button type="button" onclick="location.assign('${path }/member/memberInfo.do')">개인정보확인</button>
	   	</li>
	    <li class="list-group-item">
	    	<button type="button" data-toggle="collapse" data-target="#borrow">도서이용내역</button>
			<div id="borrow" class="collapse">
				<a class="dropdown-item" href="${path }/member/memberBorrowing.do">▷대출현황조회</a>
		      	<a class="dropdown-item" href="${path }/member/memberBorrowed.do">▷대출이력조회</a>
		      	<a class="dropdown-item" href="${path }/member/memberBooking.do">▷예약현황조회</a>
			</div>
		</li>
	    <li class="list-group-item">
	    	<button type="button" data-toggle="collapse" data-target="#hope">희망 도서</button>
			<div id="hope" class="collapse">
				<a class="dropdown-item" href="${path }/member/memberHopeBook.do">▷희망도서 신청</a>
		      	<a class="dropdown-item" href="${path }/member/memberHopeBookRecord.do">▷희망도서 신청/이력 조회</a>
			</div>
	    </li>
	    <li class="list-group-item">
		    <button type="button" onclick="location.assign('${path }/member/memberBookMark.do')">관심 도서</button>
	    </li>
	    <li class="list-group-item">
			<button type="button" onclick="location.assign('${path }/member/memberReadingRoom.do')">열람실 이용내역</button>
	    </li>
	    <li class="list-group-item">
			<button type="button" onclick="location.assign('${path }/member/membershipCard.do')">모바일 회원증</button>
	    </li>
	    <li class="list-group-item">
			<button type="button" onclick="location.assign('${path }/member/memberDelete.do')">회원 탈퇴</button>
	    </li>
	  </ul>
	</div>
	<div style="width:1530px; margin-left:400px; margin-top:10px; ">
		<div>
			<h2>희망 도서</h2>
			<hr style="border:gray 2px solid" >
		</div>
		<div>
			<img src="${path }/resources/images/book-logo.png" width=50px height=50px style="margin-bottom:10px; float:left;">
			<h2 style="margin-top:10px; float:left;">희망 도서 신청하기</h2>
			<hr style="width:1490px; border:gray 1px solid; margin-top:90px;" >
		</div>
		<div>
			<table class="table table-hover" style="text-align:center">
				<tr>
					<th>ISBN</th>
					<td><input type="text" class="bookinput"><button type="button" class="btn btn-outline-success" style="width:200px;">ISBN 검색</button></td>
				</tr>
				<tr>
					<th>제 목</th>
					<td><input type="text" class="bookinput"></td>
				</tr>
				<tr>
					<th>저 자</th>
					<td><input type="text" class="bookinput"></td>
				</tr>
				<tr>
					<th>출 판 사</th>
					<td><input type="text" class="bookinput"></td>
				</tr>
			</table>
		</div>
	</div>
	<div style="text-align:center; margin-top:100px; margin-left:300px;">
		<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberInfoUpdate.do')">확인</button>
		<button type="button" class="btn btn-outline-danger">취소</button>
	</div>
</div>
</section>
<style>
	table, td{
	font-size:25px;
	width:1000px; 
	weight:500px;
	}
	th {
	background-color:lightgray;
	text-align:center;
	width:200px;
	}
	td{
	
	}
	.bookinput{
		width:700px;
		height:40px;
		float:left;
		margin-left:50px;
	}
</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>