<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<link rel="stylesheet" href="${path }/resources/css/cg.css" type="text/css">  
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="희망도서 신청조회"/>
</jsp:include>

<section id="container">
<div style="width:1800px">
	<div style="width:270px; float:left;">
		<div class="btn-group-vertical" style="width:250px;">
			<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberInfo.do')">개인정보확인</button>
			<button type="button" class="btn btn-outline-primary" data-toggle="collapse" data-target="#borrow">도서이용내역</button>
			<div id="borrow" class="collapse">
				<a class="dropdown-item" href="${path }/member/memberBorrowing.do">▷대출현황조회</a>
		      	<a class="dropdown-item" href="${path }/member/memberBorrowed.do">▷대출이력조회</a>
		      	<a class="dropdown-item" href="${path }/member/memberBooking.do">▷예약현황조회</a>
			</div>
			<button type="button" class="btn btn-outline-primary" data-toggle="collapse" data-target="#hope">희망 도서</button>
			<div id="hope" class="collapse">
				<a class="dropdown-item" href="${path }/member/memberHopeBook.do">▷희망도서 신청</a>
		      	<a class="dropdown-item" href="${path }/member/memberHopeBookRecord.do">▷희망도서 신청/이력 조회</a>
			</div>
			<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberBookMark.do')">관심 도서</button>
			<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberReadingRoom.do')">열람실 이용내역</button>
			<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/membershipCard.do')">모바일 회원증</button>
			<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberDelete.do')">회원 탈퇴</button>
		</div>
	</div>
	<div style="width:1530px; margin-left:300px; margin-top:10px">
		<div>
			<h2>희망도서 신청/이력 조회</h2>
			<hr style="border:gray 2px solid" >
		</div>
		<div>
			<img src="${path }/resources/images/book-logo.png" width=50px height=50px style="margin-bottom:10px; float:left;">
			<h2 style="margin-top:10px; float:left;">신청 내역</h2>
			<hr style="width:1490px; border:gray 1px solid; margin-top:70px;" >
		</div>
		<div>
			<table class="table table-hover" style="text-align:center">
				<thead>
					<tr>
						<th>도서번호</th>
						<th>제  목</th>
						<th>저  자</th>
						<th>출 판 사</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>00000000</td>
						<td>springframework</td>
						<td>a2121212</td>
						<td>2021-06-03</td>
					</tr>
					<tr>
						<td>11111111</td>
						<td>apache</td>
						<td>b23333b2</td>
						<td>2021-06-27</td>
					</tr>
					<tr>
						<td>22222222</td>
						<td>Server</td>
						<td>c879c523</td>
						<td>2021-07-01</td>
					</tr>
				</tbody>
			</table>
			<hr style="width:1490px; border:gray 1px dashed; margin-top:50px;" >
		</div>
		
		<ul class="pagination" style="margin-top:100px;margin-left:600px;">
		  <li class="page-item"><a class="page-link" href="#">이전</a></li>
		  <li class="page-item active"><a class="page-link" href="#">1</a></li>
		  <li class="page-item"><a class="page-link" href="#">2</a></li>
		  <li class="page-item"><a class="page-link" href="#">3</a></li>
		  <li class="page-item"><a class="page-link" href="#">4</a></li>
		  <li class="page-item"><a class="page-link" href="#">5</a></li>
		  <li class="page-item"><a class="page-link" href="#">다음</a></li>
		</ul>
	</div>
</div>
</section>
<style>
	table, td{
	font-size:20px;
	width:1000px; 
	weight:500px;
	}
	th {
	background-color:lightgray;
	text-align:center;
	width:200px;
	}
</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>