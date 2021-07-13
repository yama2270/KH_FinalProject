<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="열람실 이용내역"/>
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
			<h2>열람실 이용내역</h2>
			<hr id="h2_line2" >
		</div>
		<div>
			<img src="${path }/resources/images/book-logo.png" width=50px height=50px id="book_logo">
			<h2 id="Room_List_title">열람실 예약현황</h2>
			<hr id="RR_hr_line2">
		</div>
		<div id="Room_Record_Container">
			<ul>
				<li>예 약 날 짜 : 2021-07-13</li>
				<li>예 약 시 간 : 10시 00분</li>
				<li>열 람 실 : A 열람실</li>
				<li>좌 석 번 호 : A-30</li>
			</ul>
			<button type="button" class="btn btn-outline-danger">예약 취소</button>
		</div>
		<div id="Room_Record_Container2">
			<img src="${path }/resources/images/book-logo.png" width=50px height=50px id="book_logo">
			<h2 id="Room_List_title">열람실 이용내역</h2>
			<hr id="RR_hr_line2" >
		</div>
		<div id="ReadingRoom_List_table">
			<table class="table table-hover" style="text-align:center">
				<thead>
					<tr>
						<th>이 용 날 짜</th>
						<th>열 람 실</th>
						<th>좌 석 번 호</th>
						<th>입 실 시 간</th>
						<th>퇴 실 시 간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2021-06-28</td>
						<td>A열람실</td>
						<td>A-16</td>
						<td>12시 31분</td>
						<td>16시 12분</td>
					</tr>
					<tr>
						<td>2021-07-03</td>
						<td>C열람실</td>
						<td>C-02</td>
						<td>14시 03분</td>
						<td>19시 53분</td>
					</tr>
					<tr>
						<td>2021-07-10</td>
						<td>B열람실</td>
						<td>B-23</td>
						<td>09시 11분</td>
						<td>13시 42분</td>
					</tr>
				</tbody>
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