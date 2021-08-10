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
<div>
	<div id="TitleContainer">
		<h2>도서이용내역</h2>
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
			<h2>대출현황조회</h2>
			<hr id="h2_line2">
		</div>
		<div id="Borrowing_Info_Container" >
			<p id="BIC_p1">총 대출 권수 : <c:out value="${totalData }"/>권</p>
			<!-- <p id="BIC_p2">대출정지만기일 : </p> -->
		</div>
		<hr id="BIC_hr_line">
		<div>
			<img src="${path }/resources/images/book-logo.png" width=50px height=50px style="margin-bottom:10px; float:left;">
			<h2 style="margin-top:30px;">현재 대출 중인 도서</h2>
		</div>
		<div id="Borrwing_List_table">
		<c:choose>
			<c:when test="${not empty list }">
				<c:forEach var="l" items="${list }">
					<table> <!-- 데이터 입력시 테이블 구조&CSS 수정 해야됨 -->
						<tr>
							<th rowspan="7"><img width=185px height=185px src="<c:out value="${l.book.bookInfo.bookImg }"/>" ></th>
							<th>대출 번호 : </th>
							<td><c:out value="${l.lendingNo }"/></td>
						</tr>
						<tr>
							<th>도서 번호 : </th>
							<td><c:out value="${l.bookNo }"/></td>
						</tr>
						<tr>
							<th>ISBN 명 : </th>
							<td><c:out value="${l.book.bookInfo.isbnNo }"/></td>
						</tr>
						 <tr>
							<th>도 서 명 : </th>
							<td><c:out value="${l.book.bookInfo.bookName  }"/></td>
						</tr>
						<tr>
							<th>저 자 명 : </th>
							<td><c:out value="${l.book.bookInfo.bookWriter  }"/></td>
						</tr>
						<tr>
							<th>대출/반납일자 : </th>
							<td><c:out value="${l.lendingDate }"/>~<c:out value="${l.returnDate }"/></td>
						</tr>
						<tr>
							<th>연장 횟수 : </th>
							<td><c:out value="${l.bookExtend }"/><button id="AddExtendBtn" type="button" onclick="location.assign('${path}/admin/book/addBookExtend.do?lendingNo=${l.lendingNo }&bookExtend=${l.bookExtend }&returnDate=${l.returnDate }&userId=${l.member.userId }&checkloc=mb')">연장하기</button></td>
						</tr>
					</table>
					<hr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h2 id="Nodata">대여중인 도서가 없습니다.</h2>
			</c:otherwise>
		</c:choose>
		</div>
		<div id="pagebar-container">
        	${pageBar }
        </div>
	</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>