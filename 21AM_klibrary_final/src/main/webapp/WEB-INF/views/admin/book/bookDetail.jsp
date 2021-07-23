<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="도서상세" />
</jsp:include>

<div id="ad_right">
	<div id="contHeader">도서상세</div>
	<div id="contBody">
		<div id="bookDetail">
			<div id="bookDetImg"><img src="${b.bookInfo.bookImg }" style="width:250px;height:250px;"></div>
			<div id="bookDetTabCont">
				<table id="bookDetTab">
					<tr>
						<th>도서번호</th>
						<td><input class="booDetInp" type="text" name="bookNo" value="${b.bookNo }"></td>
						<th>발행일</th>
						<td><input class="booDetInp" type="date" name="bookDate" value="${b.bookInfo.bookDate }" ></td>
					</tr>
					<tr>
						<th>도서명</th>
						<td><input class="booDetInp" type="text" name="bookName" value="${b.bookInfo.bookName }"></td>
						<th>가격</th>
						<td><input class="booDetInp" type="text" name="bookPrice" value="${b.bookInfo.bookPrice }"></td>
					</tr>
					<tr>
						<th>ISBN</th>
						<td><input class="booDetInp" type="text" name="isbnNo" value="${b.bookInfo.isbnNo }"></td>
						<th>청구기호</th>
						<td><input class="booDetInp" type="text" name="bookLocation" value="${b.bookInfo.bookLocation }"></td>
					</tr>
					<tr>
						<th>저자</th>
						<td><input class="booDetInp" type="text" name="bookWriter" value="${b.bookInfo.bookWriter }"></td>
						<th>분류</th>
						<td><input class="booDetInp" type="text" name="kdcName" value="${b.bookInfo.kdcDetail.kdcType.kdcName }"></td>
					</tr>
					<tr>
						<th>출판사</th>
						<td><input class="booDetInp" type="text" name="bookCompany" value="${b.bookInfo.bookCompany }"></td>
						<th>상세분류</th>
						<td><input class="booDetInp" type="text" name="bookDetailName" value="${b.bookInfo.kdcDetail.kdcDetailName }"></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="bookLenHis">
			<div id="bookLenHisHeader">도서대출내역</div>
			<table id="lenHisTab">
				<tr>
					<th>회원아이디</th>
					<th>대출번호</th>
					<th>대출일</th>
					<th>반납일</th>
				</tr>
				<c:forEach var="hi" items="${h }">
				<tr>
					<td><c:out value="${hi.userId }"/></td>
					<td><c:out value="${hi.lendingNo }"/></td>
					<td><c:out value="${hi.lendingDate }"/></td>
					<td><c:out value="${hi.returnDate }"/></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div id="bookDetBtn">
			<button type="button" class="btn btn-outline-secondary" onclick="javascript:history.back()">뒤로가기</button>
		</div>
	</div>
</div>
</section>

<script>
	$(".navOptions").eq(1).show();
</script>>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />