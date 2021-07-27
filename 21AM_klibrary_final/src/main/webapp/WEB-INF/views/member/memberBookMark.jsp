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
			<img src="${path }/resources/images/book-logo.png" width=50px height=50px id="book_logo">
			<h2 id="BookMark_List_title">관심 도서</h2>
			<hr id="BMK_hr_line2">
		</div>
		<div id="Booking_List_table">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>ISBN</th>
						<th>제  목</th>
						<th>저  자</th>
						<th><img src="${path }/resources/images/icon-star.png" id="Star_icon"></th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach var="l" items="${list }">
							<tr>
								<td><c:out value="${l.isbnNo }"/></td>
								<td><c:out value="${l.bookInfo.bookName }"/></td>
								<td><c:out value="${l.bookInfo.bookWriter }"/></td>
								<td><button type="button" id="Star_btn" onclick="location.assign('${path}/member/cancelMark.do?isbnNo=${l.isbnNo}')"><img src="${path }/resources/images/icon-star-yellow.png" width=30px height=30px></button></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h2 id=Nodata>관심 도서가 없습니다.</h2>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		<div id="pagebar-container">
        	${pageBar }
        </div>
	</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>