<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
				
				<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="w" items="${list }">
				<tr>
					<td><input type="checkbox" /></td>
					<td><c:out value="${ w.wishBookNo}"/></td>
					<td><c:out value="${ w.userId}"/></td>
					<td><c:out value="${ w.isbnNo}"/></td>
					<td><c:out value="${ w.bookName}"/></td>
					<td><c:out value="${ w.bookWriter}"/></td>
					<td><c:out value="${ w.bookCompany}"/></td>
					<td><c:out value="${ w.bookDate}"/></td>
					<td><c:out value="${ w.bookPrice}"/></td>
					<td><button type="button" class="btn btn-outline-secondary">구입</button></td>
					<td><button type="button" class="btn btn-outline-secondary">삭제</button></td>
				</tr>
							</c:forEach>
						</c:when>
				<c:otherwise>
   					<tr>
   					<td colspan="6">조회된 자료가 없습니다</td>
   					</tr>
   				</c:otherwise>       		
          	</c:choose>
			</table>
			<div id="bookWishListBtn">
				<button type="button" class="btn btn-outline-secondary">구입</button>
				<button type="button" class="btn btn-outline-secondary">삭제</button>
			</div>
		</div>
		     <div id="pagebar-container" style="margin-top:60px; margin-left:180px;">
	        	${pageBar }
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