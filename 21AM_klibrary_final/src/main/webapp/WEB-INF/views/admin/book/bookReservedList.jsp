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
	<div style="overflow: auto; height:670px;">
		<div id="contBody">
			<div id="contentTitle">예약도서목록</div>
			<div id="searchWrap">
				<div class="container-fluid" style="padding-right: 0px;">
					<form class="d-flex" action="${path }/admin/book/bookReservedList.do" method="post">
						<select id="searchOption" name="searchOption" class="form-select"
							aria-label="Default select example" required>
							<option value="" ${param.searchOption !=null? "":"selected"}>검색옵션</option>
							<option value="booking_no" ${param.searchOption =="booking_no"? "selected":""}>예약번호</option>
							<option value="book_no" ${param.searchOption =="book_no"? "selected":""}>도서번호</option>
							<option value="book_name" ${param.searchOption =="book_name"? "selected":""}>도서명</option>
							<option value="user_id" ${param.searchOption =="user_id"? "selected":""}>아이디</option>
							<option value="user_name" ${param.searchOption =="user_name"? "selected":""}>이름</option>
						</select> <input id="searchWord" class="form-control me-2" type="search" name="searchWord"
							placeholder="Search" aria-label="Search" value='${param.searchWord!=null?param.searchWord:"" }' required>
						<button id="searchBtn" class="btn btn-outline-success"
							type="submit">Search</button>
					</form>
				</div>
			</div>
			<div id="contentTabWrap"> <!-- 예약중 리스트-->
				<table id="bookReservedListTab" class="table table-hover">
					<tr>
						<th style="width: 50px; line-height: 18px;"><input id="selBox" type="checkbox" onclick="fn_selBox();" /></th>
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
									<td><input type="checkbox" name="checkFl" class="checkFl" value="${l.bookingNo}"/></td>
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
					<button id="delReservedBtn" type="button" class="btn btn-outline-secondary">예약취소</button>
				</div>
			</div>
			
			 <!-- 예약내역 리스트-->
			<div id="contentTitle" style="margin-top:800px;">예약도서내역</div>
			<div id="searchWrap">
				<div class="container-fluid" style="padding-right: 0px;">
					<form class="d-flex" action="${path }/admin/book/bookReservedList.do" method="post">
						<select id="searchOption" name="searchOptionH" class="form-select"
							aria-label="Default select example" required>
							<option value="" ${param.searchOptionH !=null? "":"selected"}>검색옵션</option>
							<option value="booking_History_No" ${param.searchOptionH =="booking_History_No"? "selected":""}>예약내역번호</option>
							<option value="booking_no" ${param.searchOptionH =="booking_no"? "selected":""}>예약번호</option>
							<option value="book_no" ${param.searchOptionH =="book_no"? "selected":""}>도서번호</option>
							<option value="user_id" ${param.searchOptionH =="user_id"? "selected":""}>아이디</option>
							<option value="user_name" ${param.searchOptionH =="user_name"? "selected":""}>이름</option>
						</select> <input id="searchWord" class="form-control me-2" type="search" name="searchWordH"
							placeholder="Search" aria-label="Search" value='${param.searchWordH!=null?param.searchWordH:"" }' required>
						<button id="searchBtn" class="btn btn-outline-success"
							type="submit">Search</button>
					</form>
				</div>
			</div>
			<div id="contentTabWrap"> <!-- 예약중 리스트-->
				<table id="bookReservedListTab" class="table table-hover">
					<tr>
						<th style="width: 120px;">예약내역번호</th>
						<th style="width: 100px;">&nbsp;예약번호 <i
							class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 120px;">도서번호 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 110px;">아이디 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 80px;">이름 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 100px;">예약일 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 100px;">대출예정일 <i class="fas fa-arrows-alt-v"></i></th>
					</tr>
					<c:choose>
						<c:when test="${not empty hlist }">
							<c:forEach var="l" items="${hlist }">
								<tr>
									<td><c:out value="${l.bookingHistoryNo }"/></td>
									<td><c:out value="${l.bookingNo }"/></td>
									<td><c:out value="${l.bookNo }"/></td>
									<td><c:out value="${l.userId }"/></td>
									<td><c:out value="${l.member.userName }"/></td>
									<td><c:out value="${l.bookingDate }"/></td>
									<td><c:out value="${l.bookingPickUpDate }"/></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td>예약내역번호</td>
								<td>예약번호</td>
								<td>도서번호</td>
								<td>아이디</td>
								<td>이름</td>
								<td>예약일</td>
								<td>대출예정일</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
				 <div id="pageBar">
	             	<c:out value="${pageBar }" escapeXml="false"/>
	             </div>
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
    
    
    // 페이지 이동 
    const fn_paging = function(cPage){
    	location.assign('${path}/admin/book/bookReservedList.do?cPage='+cPage);
    }
    
    //예약취소버튼
    $("button[id=delReservedBtn]").click(e=>{
    	const checkItem=$("input:checkbox[name=checkFl]:checked")
    	
    	if(checkItem.length!=0){
    		if(confirm("취소하시겠습니까?")){
    			let checkArr = new Array();
    			$.each($(checkItem),function(i,v){
    				checkArr.push($(v).val());
    			})
    			location.href="${path}/admin/book/deleteReservedCheck.do?bookingNo="+checkArr;
    		}
    	} else{
    		alert("예약도서를 선택해주세요");
    	}
    })
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
