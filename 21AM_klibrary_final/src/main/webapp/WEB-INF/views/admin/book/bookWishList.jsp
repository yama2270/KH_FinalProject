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
				<form class="d-flex" action="${path }/admin/book/bookWishList.do" method="post">
					<select id="searchOption" class="form-select"
						aria-label="Default select example">
						<option value="" ${param.searchOption !=null? "":"selected"}>검색옵션</option>
						<option value="wishbook_no" ${param.searchOption =="wishbook_no"? "selected":""}>희망도서번호</option>
						<option value="user_id" ${param.searchOption =="user_id"? "selected":""}>아이디</option>
						<option value="isbn" ${param.searchOption =="isbn"? "selected":""}>ISBN</option>
						<option value="book_name" ${param.searchOption =="book_name"? "selected":""}>도서명</option>
						<option value="book_author" ${param.searchOption =="book_author"? "selected":""}>저자</option>			
						<option value="book_company" ${param.searchOption =="book_company"? "selected":""}>출판사</option>

					</select> <input id="searchWord" class="form-control me-2" type="search" name="searchWord"
							placeholder="Search" aria-label="Search" value='${param.searchWord!=null?param.searchWord:"" }' required>
					<button id="searchBtn" class="btn btn-outline-success"
						type="submit">Search</button>
				</form>
			</div>
		</div>
		<div id="contentTabWrap">
			<table id="bookWishListTab" class="table table-hover">
				<tr>
					<th style="width:50px;"><input type="checkbox" id="allCheck" name="allCheck" /></th>
					<th style="width: 120px;">&nbsp;희망도서번호 <i
						class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">아이디 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 120px;">ISBN <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 110px;">도서명 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 80px;">저자 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">출판사 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 100px;">발행일</th>
					<th style="width: 80px;">가격 <i class="fas fa-arrows-alt-v"></i></th>
					<th style="width: 80px;">구매 <i class="fas fa-arrows-alt-v"></i></th>
	
				</tr>
				
				<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="w" items="${list }">
				<tr>
					<td class="cols"><input type="checkbox" name="RowCheck" value="${w.wishBookNo }"/>
					<td><c:out value="${ w.wishBookNo}"/></td>
					<td><c:out value="${ w.userId}"/></td>
					<td><c:out value="${ w.isbnNo}"/></td>
					<td><c:out value="${ w.bookName}"/></td>
					<td><c:out value="${ w.bookWriter}"/></td>
					<td><c:out value="${ w.bookCompany}"/></td>
					<td><c:out value="${ w.bookDate}"/></td>
					<td><c:out value="${ w.bookPrice}"/></td>
					<td>
					<button type="button" class="btn btn-outline-secondary" style="height:30px;margin-top:15px;" onclick="regPopup(this)" value="${w.bookName }">구입</button>
					<input type="text" value="${w.wishBookNo }" style="display:none;"/>
					</td>
		
				</tr>
							</c:forEach>
						</c:when>
				<c:otherwise>
   					<tr>
   					<td colspan="10">조회된 자료가 없습니다</td>
   					</tr>
   				</c:otherwise>       		
          	</c:choose>
			</table>
			<div id="bookWishListBtn">
				<input type="button" value="삭제" class="btn btn-outline-dark" style="" onclick="deleteValue();">
			</div>
		</div>
		     <div id="pagebar-container" style="margin-top:30px; margin-left:60px;">
	        	${pageBar }
	        </div>
	</div>
</div>
</section>

	<script>
	
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}
			else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
    
	function deleteValue(){
		var url = "${path}/admin/book/wishBookDelete.do"    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
		var valueArr = new Array();
	    var list = $("input[name='RowCheck']");
	    for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
	            valueArr.push(list[i].value);
	        }
	    }
	    if (valueArr.length == 0){
	    	alert("선택된 글이 없습니다.");
	    }
	    else{
			var chk = confirm("정말 삭제하시겠습니까?");				 
			$.ajax({
			    url : "${path}/admin/book/wishBookDelete.do", // 전송 URL
			    type : 'POST',                // GET or POST 방식
			    traditional : true,
			    data : {
			    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
			    },
                success: function(jdata){
                    if(jdata = 1) {
                        alert("삭제 성공");
                        location.replace("${path}/admin/book/bookWishList.do")
                    }
                    else{
                        alert("삭제 실패");
                    }
                }
			});
		}
	}
	
	
	
	// 팝업창 
    const regPopup = function(e){
    	let bookName = $(e).val();
    	let wishBookNo = $(e).next().val();
    	window.open("${path}/admin/book/insertWishBook.do?bookName="+bookName+"&wishBookNo="+wishBookNo,"regPopup","width=700,height=600,scrollbars=yes");
	}
	
	
    $(function(){
        // ul show()
        $(".navOptions").eq(1).show();
        // ul li 배경화면 
        $(".navOptions").eq(1).children().eq(3).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />