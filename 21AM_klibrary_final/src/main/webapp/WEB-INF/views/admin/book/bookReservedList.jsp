<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="도서예약목록" />
</jsp:include>

<div id="ad_right">
	<div id="contHeader">도서관리>예약도서목록</div>
	<div id="contBody">
		<div id="contentTitle">예약도서목록</div>
		<div id="searchWrap">
			<div class="container-fluid" style="padding-right: 0px;">
				<form class="d-flex" action="${path }/admin/book/searchReservedList.do" method="post">
					<select id="searchOption" name="searchOption" class="form-select"
						aria-label="Default select example" required>
						<option ${param.searchOption !=null? "":"selected"}>검색옵션</option>
						<option value="booking_no">예약번호</option>
						<option value="book_no">도서번호</option>
						<option value="book_name">도서명</option>
						<option value="user_id">아이디</option>
						<option value="user_name">이름</option>
					</select> <input id="searchWord" class="form-control me-2" type="search" name="searchWord"
						placeholder="Search" aria-label="Search" value='${param.searchWord!=null?param.searchWord:"" }' required>
					<button id="searchBtn" class="btn btn-outline-success"
						type="submit">Search</button>
				</form>
			</div>
		</div>
		<div id="contentTabWrap">
			<table id="bookReservedListTab" class="table table-hover">
				<tr>
					<th style="width: 50px; line-height: 18px;"><input
						type="checkbox" /></th>
					<th style="width: 120px;">&nbsp;예약번호 <i
						class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 120px;">도서번호 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 120px;">도서명 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 110px;">아이디 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 80px;">이름 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">예약일 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">대출예정일 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 60px;">예약취소</th>
				</tr>
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach var="l" items="${list }">
							<tr>
								<td><input type="checkbox" /></td>
								<td><c:out value="${l.bookingNo}"/></td>
								<td><c:out value="${l.bookNo}"/></td>
								<td><c:out value="${l.book.bookInfo.bookName}"/></td>
								<td><c:out value="${l.userId}"/></td>
								<td><c:out value="${l.member.userName}"/></td>
								<td><c:out value="${l.bookingDate}"/></td>
								<td><c:out value="${l.bookingPickUpDate}"/></td>
								<td><button type="button" class="btn btn-outline-secondary" onClick="location.assign('${path}/admin/book/cancelReserved.do?bookingNo=${l.bookingNo }&userId=${l.member.userId }')">취소</button></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td><input type="checkbox" /></td>
							<td>예약번호</td>
							<td>도서번호</td>
							<td>도서명</td>
							<td>아이디</td>
							<td>이름</td>
							<td>예약일</td>
							<td>대출예정일</td>
							<td><button type="button" class="btn btn-outline-secondary">취소</button></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<div id="bookReservedListBtn">
				<button type="button" class="btn btn-outline-secondary">예약취소</button>
			</div>
		</div>
	</div>
</div>
</section>

	<script>
	
    $(function(){
        // ul show()
        $(".navOptions").eq(1).show();
        // ul li 배경화면 
        $(".navOptions").eq(1).children().eq(2).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
