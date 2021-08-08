<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<link rel="stylesheet" href="${path }/resources/css/cg.css" type="text/css">  
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="열람실 이용내역"/>
</jsp:include>

<section id="container">
<div>
	<div id="TitleContainer">
		<h2>열람실 이용내역</h2>
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
				<a class="dropdown-item" href="${path }/searchpage/wishbook.do">▷희망도서 신청</a>
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
			<c:choose>
				<c:when test="${not empty srb }">
					<ul>
						<li>예 약 날 짜 : &nbsp;&nbsp;${srb.usageDate}</li>
						<li>입 실 시 간 : &nbsp;&nbsp;${srb.startTime}</li>
						<li>퇴 실 시 간 : &nbsp;&nbsp;${srb.endTime}</li>
						<li>열 람 실 : &nbsp;&nbsp;${srb.roomName}</li>
						<li>좌 석 번 호 : &nbsp;&nbsp;${srb.seatNo}</li>
					</ul>
					<button type="button" class="btn btn-outline-danger" onclick="location.assign('${path}/member/cancelSRBooking.do?bookingNo=${srb.bookingNo }')">예약 취소</button>
				</c:when>
				<c:otherwise>
					<p style="font-size:20px; padding-top: 60px;">등록된 예약이 없습니다.</p>					
				</c:otherwise>
			</c:choose>
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
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach var="l" items="${list }">
							<tr>
								<td><c:out value="${l.usageDate }"/></td>
								<td><c:out value="${l.studyroomType }"/></td>
								<td><c:out value="${l.seatNo }"/></td>
								<td><c:out value="${l.startTime }"/></td>
								<td><c:out value="${l.endTime }"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td></td>
							<td>예약</td>
							<td>내역이</td>
							<td>없습니다.</td>
							<td></td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<hr>
		</div>
		<div id="pagebar-container">
        	${pageBar }
        </div>
	</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>