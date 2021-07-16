<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="대출도서목록" />
</jsp:include>

<div id="ad_right">
	<div id="contHeader">도서관리>대출도서목록</div>
	<div id="contBody">
		<div id="contentTitle">대출도서목록</div>
		<div id="searchWrap">
			<div class="container-fluid" style="padding-right: 0px;">
				<form class="d-flex">
					<select id="searchOption" class="form-select"
						aria-label="Default select example">
						<option selected>검색옵션</option>
						<option value="1">대출번호</option>
						<option value="2">도서번호</option>
						<option value="3">도서명</option>
						<option value="4">아이디</option>
						<option value="5">이름</option>
						<option value="6">대출일</option>
						<option value="7">반납일</option>
					</select> <input id="searchWord" class="form-control me-2" type="search"
						placeholder="Search" aria-label="Search">
					<button id="searchBtn" class="btn btn-outline-success"
						type="submit">Search</button>
				</form>
			</div>
		</div>
		<div id="contentTabWrap">
			<table id="bookRentalListTab" class="table table-hover">
				<tr>
					<th style="width: 50px; line-height: 18px;"><input
						type="checkbox" /></th>
					<th style="width: 120px;">&nbsp;대출번호 <i
						class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 120px;">도서번호 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 140px;">도서명 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 110px;">아이디 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">이름 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 90px;">대출일 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">반납일 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">연장횟수</th>
					<th style="width: 60px;">연장</th>
					<th style="width: 60px;">반납</th>
				</tr>
				<tr>
					<td><input type="checkbox" /></td>
					<td>대출번호</td>
					<td>도서번호</td>
					<td>도서명</td>
					<td>아이디</td>
					<td>이름</td>
					<td>대출일</td>
					<td>반납일</td>
					<td>연장횟수</td>
					<td><button type="button" class="btn btn-outline-secondary">연장</button></td>
					<td><button type="button" class="btn btn-outline-secondary">반납</button></td>
				</tr>
			</table>
			<div id="bookRentalListBtn">
				<button type="button" class="btn btn-outline-secondary">반납</button>
			</div>
		</div>
	</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />