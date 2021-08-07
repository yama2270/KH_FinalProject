<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="대출도서목록" />
</jsp:include>

<div id="ad_right">
	<div id="contHeader">도서관리>대출도서목록</div>
	<div style="overflow: auto; height:670px;">
		<div id="contBody">
			<div id="contentTitle">대출도서목록</div>
			<div id="searchWrap">
				<div class="container-fluid" style="padding-right:0px;">
					<form class="d-flex" action="${path }/admin/book/bookRentalList.do" method="post">
						<select id="searchOption" name="searchOption" class="form-select" onchange="changeSelect()"
							aria-label="Default select example" required>
							<option value="" ${param.searchOption !=null? "":"selected"}>검색옵션</option>
							<option value="lending_no" ${param.searchOption =="lending_no"? "selected":""}>대출번호</option>
							<option value="book_no" ${param.searchOption =="book_no"? "selected":""}>도서번호</option>
							<option value="book_name" ${param.searchOption =="book_name"? "selected":""}>도서명</option>
							<option value="user_id" ${param.searchOption =="user_id"? "selected":""}>아이디</option>
							<option value="user_name" ${param.searchOption =="user_name"? "selected":""}>이름</option>
							<option value="lending_date" ${param.searchOption =="lending_date"? "selected":""}>대출일</option>
							<option value="return_date" ${param.searchOption =="return_date"? "selected" :"" }>반납일</option>
						</select>
						<c:choose>
							<c:when test="${param.searchOption eq'lending_date' or param.searchOption eq 'return_date'}">
								<input id="searchWord" class="form-control me-2" type="date" name="searchWord"
								placeholder="Search" aria-label="Search" value='${param.searchWord!=null?param.searchWord:"" }' required>
							</c:when>
							<c:otherwise>
								<input id="searchWord" class="form-control me-2" type="search" name="searchWord"
								placeholder="Search" aria-label="Search" value='${param.searchWord!=null?param.searchWord:"" }' required>
							</c:otherwise>
						</c:choose>
						<button id="searchBtn" class="btn btn-outline-success"
							type="submit">Search</button>
					</form>
				</div>
			</div>
			<div id="contentTabWrap">
				<table id="bookRentalListTab" class="table table-hover">
					<tr>
						<th style="width: 50px; line-height: 18px;"><input id="selBox" type="checkbox" onclick="fn_selBox();" /></th>
						<th style="width: 120px;">&nbsp;대출번호 <i
							class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 120px;">도서번호 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 140px;">도서명 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 110px;">아이디 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 100px;">이름 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 100px;">대출일 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 100px;">반납일 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 100px;">연장횟수</th>
						<th style="width: 60px;">연장</th>
						<th style="width: 60px;">반납</th>
					</tr>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="l" items="${list}">
								<tr>
									<td><input type="checkbox" name="checkFl" class="checkFl" value="${l.lendingNo}" /></td>
									<td><c:out value="${l.lendingNo}"/></td>
									<td><c:out value="${l.book.bookNo}"/></td>
									<td><c:out value="${l.book.bookInfo.bookName}"/></td>
									<td><c:out value="${l.member.userId}"/></td>
									<td><c:out value="${l.member.userName}"/></td>
									<td><c:out value="${l.lendingDate}"/></td>
									<td><c:out value="${l.returnDate}"/></td>
									<td><c:out value="${l.bookExtend}"/></td>
									<td><button type="button" class="btn btn-outline-secondary" onClick="location.assign('${path}/admin/book/addBookExtend.do?lendingNo=${l.lendingNo }&bookExtend=${l.bookExtend }&returnDate=${l.returnDate }&userId=${l.member.userId }')">연장</button></td>
									<td><button type="button" class="btn btn-outline-secondary" onClick="location.assign('${path}/admin/book/returnBook.do?lendingNo=${l.lendingNo }&userId=${l.member.userId }')">반납</button></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
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
						</c:otherwise>
					</c:choose>
				</table>
				<div id="pageBar">
	            	<c:out value="${pageBar }" escapeXml="false"/>
	            </div>
				<div id="bookRentalListBtn">
					<button id="delRentalBtn" type="button" class="btn btn-outline-secondary">반납</button>
				</div>
			</div>
			<div id="contentTitle" style="margin-top:600px;">대출도서 내역목록</div>
			<div id="searchWrap">
				<div class="container-fluid" style="padding-right:0px;">
					<form class="d-flex" action="${path }/admin/book/bookRentalList.do" method="post">
						<select id="searchOption2" name="searchOption2" class="form-select" onchange="changeSelect2()"
							aria-label="Default select example" required>
							<option value="" ${param.searchOption2 !=null? "":"selected"}>검색옵션</option>
							<option value="lending_history_no" ${param.searchOption2 =="lending_history_no"? "selected":""}>대출내역번호</option>
							<option value="lending_no" ${param.searchOption2 =="lending_no"? "selected":""}>대출번호</option>
							<option value="book_no" ${param.searchOption2 =="book_no"? "selected":""}>도서번호</option>
							<option value="user_id" ${param.searchOption2 =="user_id"? "selected":""}>아이디</option>
							<option value="user_name" ${param.searchOption2 =="user_name"? "selected":""}>이름</option>
							<option value="lending_date" ${param.searchOption2 =="lending_date"? "selected":""}>대출일</option>
							<option value="return_date" ${param.searchOption2 =="return_date"? "selected" :"" }>반납일</option>
						</select>
						<c:choose>
							<c:when test="${param.searchOption2 eq'lending_date' or param.searchOption2 eq 'return_date'}">
								<input id="searchWord2" class="form-control me-2" type="date" name="searchWord2"
								placeholder="Search" aria-label="Search" value='${param.searchWord2!=null?param.searchWord2:"" }' required>
							</c:when>
							<c:otherwise>
								<input id="searchWord2" class="form-control me-2" type="search" name="searchWord2"
								placeholder="Search" aria-label="Search" value='${param.searchWord2!=null?param.searchWord2:"" }' required>
							</c:otherwise>
						</c:choose>
						<button id="searchBtn" class="btn btn-outline-success"
							type="submit">Search</button>
					</form>
				</div>
			</div>
			<div id="contentTabWrap">
				<table id="bookRentalListTab" class="table table-hover">
					<tr>
						<th style="width: 120px;">대출내역 번호 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 120px;">&nbsp;대출번호 <i
							class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 120px;">도서번호 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 110px;">아이디 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 100px;">이름 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 100px;">대출일 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 100px;">반납일 <i class="fas fa-arrows-alt-v"></i></th>
						<th style="width: 100px;">연장횟수</th>
					</tr>
					<c:choose>
						<c:when test="${not empty hlist }">
							<c:forEach var="l" items="${hlist}">
								<tr>
									<td><c:out value="${l.lendingHistoryNo}"/></td>
									<td><c:out value="${l.lendingNo}"/></td>
									<td><c:out value="${l.bookNo}"/></td>
									<td><c:out value="${l.member.userId}"/></td>
									<td><c:out value="${l.member.userName}"/></td>
									<td><c:out value="${l.lendingDate}"/></td>
									<td><c:out value="${l.returnDate}"/></td>
									<td><c:out value="${l.bookExtend}"/></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
								<tr>
									<td>대출내역 번호</td>
									<td>대출번호</td>
									<td>도서번호</td>
									<td>아이디</td>
									<td>이름</td>
									<td>대출일</td>
									<td>반납일</td>
									<td>연장횟수</td>
								</tr>
						</c:otherwise>
					</c:choose>
				</table>
				<div id="pageBar">
	            	<c:out value="${pageBar2 }" escapeXml="false"/>
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
        $(".navOptions").eq(1).children().eq(1).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
    // 페이지 이동 
    const fn_paging = function(cPage){
    	location.assign('${path}/admin/book/bookRentalList.do?cPage='+cPage);
    }
	 // 페이지 이동2 
    const fn_paging2 = function(cPage){
    	location.assign('${path}/admin/book/bookRentalList.do?cPage2='+cPage);
    }
    
    //선택목록 변경
    function changeSelect(){
    	if($("#searchOption option:selected").val()=='lending_date'||$("#searchOption option:selected").val()=='return_date'){
    		document.getElementById('searchWord').setAttribute('type','date');
    	}else{
    		document.getElementById('searchWord').setAttribute('type','search');
    	}
    }
    
    //선택목록 변경 (내역)
    function changeSelect2(){
    	if($("#searchOption2 option:selected").val()=='lending_date'||$("#searchOption2 option:selected").val()=='return_date'){
    		document.getElementById('searchWord2').setAttribute('type','date');
    	}else{
    		document.getElementById('searchWord2').setAttribute('type','search');
    	}
    }
    
    //대출반납 버튼
    $("button[id=delRentalBtn]").click(e=>{
    	const checkItem=$("input:checkbox[name=checkFl]:checked")
    	console.log(checkItem);
    	if(checkItem.length!=0){
    		if(confirm("반납하시겠습니까?")){
    			let checkArr = new Array();
    			$.each($(checkItem),function(i,v){
    				checkArr.push($(v).val());
    			})
    			console.log(checkArr);
    			location.href="${path}/admin/book/deleteRentalCheck.do?lendingNo="+checkArr;
    		}
    	}else{
    		alert("반납도서를 선택해주세요");
    	}
    })
    
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />