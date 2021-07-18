<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>     
<link rel="stylesheet" href="${path }/resources/css/cg.css" type="text/css">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="관심도서"/>
</jsp:include>

<section id="container">
<div>
	<div id="TitleContainer">
		<h2>관심 도서</h2>
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
	<div id="UserInfo_Container">
		<div>
			<img src="${path }/resources/images/book-logo.png" width=50px height=50px id="book_logo">
			<h2 id="BookMark_List_title">관심 도서</h2>
			<hr id="BMK_hr_line2">
		</div>
		<div id="Booking_List_table">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>도서번호</th>
						<th>제  목</th>
						<th>저  자</th>
						<th><img src="${path }/resources/images/icon-star.png" id="Star_icon"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>00000000</td>
						<td>springframework</td>
						<td>a2121212</td>
						<td><button type="button" id="Star_btn"><img src="${path }/resources/images/icon-star-yellow.png" width=30px height=30px></button></td>
					</tr>
					<tr>
						<td>11111111</td>
						<td>apache</td>
						<td>b23333b2</td>
						<td><button type="button" id="Star_btn"><img src="${path }/resources/images/icon-star-yellow.png" width=30px height=30px></button></td>
					</tr>
					<tr>
						<td>22222222</td>
						<td>Server</td>
						<td>c879c523</td>
						<td><button type="button" id="Star_btn"><img src="${path }/resources/images/icon-star-yellow.png" width=30px height=30px></button></td>
					</tr>
				</tbody>
			</table>
			<hr style="" >
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