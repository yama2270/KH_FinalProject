<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<table id="bookAllListTab" class="table table-hover">
	<tr>
		<th style="width: 50px; line-height: 18px;"><input id="selBox"
			type="checkbox" onclick="fn_selBox();" /></th>
		<th style="width: 100px;">&nbsp;도서번호 <i
			class="fas fa-arrows-alt-v"></i></th>
		<th style="width: 100px;">ISBN <i class="fas fa-arrows-alt-v"></i></th>
		<th style="width: 120px;">도서이름 <i class="fas fa-arrows-alt-v"></i></th>
		<th style="width: 100px;">저자</th>
		<th style="width: 90px;">출판사 <i class="fas fa-arrows-alt-v"></i></th>
		<th style="width: 100px;">발행일</th>
		<th style="width: 70px;">가격 <i class="fas fa-arrows-alt-v"></i></th>
		<th>청구기호</th>
		<th style="width: 70px;">분류 <i class="fas fa-arrows-alt-v"></i></th>
		<th style="width: 90px;">상세분류 <i class="fas fa-arrows-alt-v"></i></th>
		<th style="width: 80px;">예약여부</th>
		<th style="width: 80px;">대출여부</th>
	</tr>
	<c:forEach var="b" items="${list }">
		<tr class="bookInfo" onclick="fn_bookDetail(this);" style="cursor:pointer;">
			<td><input type="checkbox" name="checkFl" class="checkFl"
				value="${b.bookNo }" /></td>
			<td><c:out value="${b.bookNo }" /></td>
			<td><c:out value="${b.isbnNo }" /></td>
			<td><c:out value="${b.bookInfo.bookName }" /></td>
			<td><c:out value="${b.bookInfo.bookWriter }" /></td>
			<td><c:out value="${b.bookInfo.bookCompany }" /></td>
			<td><c:out value="${b.bookInfo.bookDate }" /></td>
			<td><c:out value="${b.bookInfo.bookPrice }" /></td>
			<td><c:out value="${b.bookInfo.bookLocation }" /></td>
			<td><c:out value="${b.bookInfo.kdcDetail.kdcType.kdcName }" /></td>
			<td><c:out value="${b.bookInfo.kdcDetail.kdcDetailName }" /></td>
			<td><c:out value="${b.bookingState }" /></td>
			<td><c:out value="${b.lendingState }" /></td>
		</tr>
	</c:forEach>
</table>
<div id="pageBar">
	<c:out value="${pageBar }" escapeXml="false" />
</div>
<div id="bookAllListBtn">
	<button id="delBookBtn" type="button" class="btn btn-outline-secondary">삭제</button>
</div>