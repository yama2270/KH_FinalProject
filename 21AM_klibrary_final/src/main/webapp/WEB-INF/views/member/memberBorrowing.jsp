<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path }/resources/css/cg.css" type="text/css">  
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="대출현황조회"/>
</jsp:include>

<section id="container">
<div style="width:1800px">
	<div id="UserInfo_Menu_Container">
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
	<div id="UserInfo_Container">
		<div>
			<h2>대출현황조회</h2>
			<hr id="h2_line2">
		</div>
		<div id="Borrowing_Info_Container" >
			<p id="BIC_p1">대출연체권수 : </p>
			<p id="BIC_p2">대출정지만기일 : </p>
		</div>
		<hr id="BIC_hr_line">
		<div>
			<img src="${path }/resources/images/book-logo.png" width=50px height=50px style="margin-bottom:10px; float:left;">
			<h2 style="margin-top:10px; float:left;">현재 대출 중인 도서</h2>
			<hr id="BIC_hr_line2">
		</div>
		<div id="Borrwing_List_table">
			<table> <!-- 데이터 입력시 테이블 구조&CSS 수정 해야됨 -->
				<tr>
					<th rowspan="4"><img src="${path }/resources/images/Book_img.png"></th>
					<th>ISBN : </th>
					<td>00000000</td>
				</tr>
				<tr>
					<th>제 목 : </th>
					<td>Spring final Project</td>
				</tr>
				<tr>
					<th>저 자 : </th>
					<td>홍길동</td>
				</tr>
				<tr>
					<th>대출기간 : </th>
					<td>2021-07-06 ~ 2021-07-31</td>
				</tr>
			</table>
			<hr>
		</div>
		<div id="Borrwing_List_table">
			<table>
				<tr>
					<th rowspan="4"><img src="${path }/resources/images/Book_img.png"></th>
					<th>ISBN : </th>
					<td>00000000</td>
				</tr>
				<tr>
					<th>제 목 : </th>
					<td>Spring final Project</td>
				</tr>
				<tr>
					<th>저 자 : </th>
					<td>홍길동</td>
				</tr>
				<tr>
					<th>대출기간 : </th>
					<td>2021-07-06 ~ 2021-07-31</td>
				</tr>
			</table>
			<hr>
		</div>
		
		<ul class="pagination" id="UserInfo_Paging_Container">
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>