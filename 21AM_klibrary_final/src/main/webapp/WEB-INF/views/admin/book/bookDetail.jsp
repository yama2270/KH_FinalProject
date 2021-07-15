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
			<div id="bookDetImg">이미지</div>
			<div id="bookDetTabCont">
				<table id="bookDetTab">
					<tr>
						<th>도서번호</th>
						<td></td>
						<th>발행일</th>
						<td></td>
					</tr>
					<tr>
						<th>도서명</th>
						<td></td>
						<th>가격</th>
						<td></td>
					</tr>
					<tr>
						<th>ISBN</th>
						<td></td>
						<th>청구기호</th>
						<td></td>
					</tr>
					<tr>
						<th>저자</th>
						<td></td>
						<th>분류</th>
						<td></td>
					</tr>
					<tr>
						<th>출판사</th>
						<td></td>
						<th>상세분류</th>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="bookLenHis">
			<div id="bookLenHisHeader">도서대출내역</div>
			<table id="lenHisTab">
				<tr>
					<th>회원번호</th>
					<th>회원이름</th>
					<th>대출일</th>
					<th>반납일</th>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
				</tr>
			</table>
		</div>
		<div id="bookDetBtn">
			<button type="button" class="btn btn-outline-secondary">뒤로가기</button>
		</div>
	</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />