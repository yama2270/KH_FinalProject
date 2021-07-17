<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="희망도서목록" />
</jsp:include>

<div id="ad_right">
	<div id="contHeader">도서관리>희망도서목록</div>
	<div id="contBody">
		<div id="contentTitle">희망도서목록</div>
		<div id="searchWrap">
			<div class="container-fluid" style="padding-right: 0px;">
				<form class="d-flex">
					<select id="searchOption" class="form-select"
						aria-label="Default select example">
						<option selected>검색옵션</option>
						<option value="1">희망도서번호</option>
						<option value="2">아이디</option>
						<option value="3">ISBN</option>
						<option value="4">도서명</option>
						<option value="5">저자</option>
						<option value="6">출판사</option>
					</select> <input id="searchWord" class="form-control me-2" type="search"
						placeholder="Search" aria-label="Search">
					<button id="searchBtn" class="btn btn-outline-success"
						type="submit">Search</button>
				</form>
			</div>
		</div>
		<div id="contentTabWrap">
			<table id="bookWishListTab" class="table table-hover">
				<tr>
					<th style="width: 50px; line-height: 18px;"><input
						type="checkbox" /></th>
					<th style="width: 120px;">&nbsp;희망도서번호 <i
						class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">아이디 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 120px;">ISBN <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 110px;">도서명 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 80px;">저자 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">출판사 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">발행일</th>
					<th style="width: 80px;">가격 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 60px;">구입</th>
					<th style="width: 60px;">삭제</th>
				</tr>
				<tr>
					<td><input type="checkbox" /></td>
					<td>희망도서번호</td>
					<td>아이디</td>
					<td>ISBN</td>
					<td>도서명</td>
					<td>저자</td>
					<td>출판사</td>
					<td>발행일</td>
					<td>가격</td>
					<td><button type="button" class="btn btn-outline-secondary">구입</button></td>
					<td><button type="button" class="btn btn-outline-secondary">삭제</button></td>
				</tr>
			</table>
			<div id="bookWishListBtn">
				<button type="button" class="btn btn-outline-secondary">구입</button>
				<button type="button" class="btn btn-outline-secondary">삭제</button>
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
        $(".navOptions").eq(1).children().eq(3).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />