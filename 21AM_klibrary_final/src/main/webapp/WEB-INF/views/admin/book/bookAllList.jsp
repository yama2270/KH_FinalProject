<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="전체도서목록"/>
</jsp:include>

	<div id="ad_right">
            <div id="contHeader">도서관리>전체도서목록</div>
            <div style="overflow: auto; height:670px;">
                <div id="contBody">
                    <div id="contentTitle">전체도서목록</div>
                    <div id="searchWrap">
                        <div class="container-fluid" style="padding-right:0px;">
                            <form class="d-flex">
                                <select id="searchOption" class="form-select" aria-label="Default select example">
                                    <option selected>검색옵션</option>
                                    <option value="1">도서번호</option>
                                    <option value="2">ISBN</option>
                                    <option value="3">도서명</option>
                                    <option value="4">저자</option>
                                    <option value="5">출판사</option>
                                </select>
                                <input id="searchWord" class="form-control me-2" type="search" placeholder="Search"
                                    aria-label="Search" style="margin-left:5px;">
                                <button id="searchBtn" class="btn btn-outline-success" type="submit">Search</button>
                                <button id="searchDeBtn" class="btn btn-outline-success"
                                    style="width:90px;margin-left:5px;" type="button"
                                    onclick="showDetSea()">상세검색</button>
                            </form>
                        </div>
                    </div>
                    <div id="detSeaWrap" style="display: none;">
                        <form action="" method="post">
                            <table id="detSeaTab">
                                <tr>
                                    <td>도서명</td>
                                    <td>
                                        <input type="checkbox"> ㄱ
                                        <input type="checkbox"> ㄴ
                                        <input type="checkbox"> ㄷ
                                        <input type="checkbox"> ㄹ
                                        <input type="checkbox"> ㅁ
                                        <input type="checkbox"> ㅂ
                                        <input type="checkbox"> ㅅ
                                        <input type="checkbox"> ㅇ
                                        <input type="checkbox"> ㅈ
                                        <input type="checkbox"> ㅊ
                                        <input type="checkbox"> ㅋ
                                        <input type="checkbox"> ㅌ
                                        <input type="checkbox"> ㅍ
                                        <input type="checkbox"> ㅎ
                                        <br>
                                        <input type="checkbox"> ㄲ
                                        <input type="checkbox"> ㄸ
                                        <input type="checkbox"> ㅃ
                                        <input type="checkbox"> ㅆ
                                        <input type="checkbox"> ㅉ
                                    </td>
                                </tr>
                                <tr>
                                    <td>도서명</td>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <td>ISBN</td>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <td>저자</td>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <td>출판사</td>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <td>가격</td>
                                    <td><input type="text"> ~ <input type="text"></td>
                                </tr>
                                <tr>
                                    <td>발행년</td>
                                    <td><input type="text"> ~ <input type="text"></td>
                                </tr>
                            </table>
                            <div id="detSeaBtn">
                                <button type="button" class="btn btn-outline-secondary">검색하기</button>
                                <button type="button" class="btn btn-outline-secondary"
                                    onclick="closeDetSea()">접기</button>
                            </div>
                        </form>
                    </div>
                    <div id="contentTabWrap">
                        <table id="bookAllListTab" class="table table-hover">
                            <tr>
                                <th style="width:50px;line-height:18px;"><input id="selBox" type="checkbox" onclick="fn_selBox();" /></th>
                                <th style="width:100px;">&nbsp;도서번호 <i class="fas fa-arrows-alt-v"></i></th>
                                <th style="width:100px;">ISBN <i class="fas fa-arrows-alt-v"></i></th>
                                <th style="width:120px;">도서이름 <i class="fas fa-arrows-alt-v"></i></th>
                                <th style="width:100px;">저자</th>
                                <th style="width:90px;">출판사 <i class="fas fa-arrows-alt-v"></i></th>
                                <th style="width:100px;">발행일</th>
                                <th style="width:70px;">가격 <i class="fas fa-arrows-alt-v"></i></th>
                                <th>청구기호</th>
                                <th style="width:70px;">분류 <i class="fas fa-arrows-alt-v"></i></th>
                                <th style="width:90px;">상세분류 <i class="fas fa-arrows-alt-v"></i></th>
                                <th style="width:80px;">예약여부</th>
                                <th style="width:80px;">대출여부</th>
                            </tr>
                            <c:forEach var="b" items="${list }">
                            <tr class="bookInfo">
                                <td><input type="checkbox" name="checkFl" class="checkFl" value="${b.bookNo }" /></td>
                                <td><c:out value="${b.bookNo }"/></td>
                                <td><c:out value="${b.isbnNo }"/></td>
                                <td><c:out value="${b.bookInfo.bookName }"/></td>
                                <td><c:out value="${b.bookInfo.bookWriter }"/></td>
                                <td><c:out value="${b.bookInfo.bookCompany }"/></td>
                                <td><c:out value="${b.bookInfo.bookDate }"/></td>
                                <td><c:out value="${b.bookInfo.bookPrice }"/></td>
                                <td><c:out value="${b.bookInfo.bookLocation }"/></td>
                                <td><c:out value="${b.bookInfo.kdcDetail.kdcType.kdcName }"/></td>
                                <td><c:out value="${b.bookInfo.kdcDetail.kdcDetailName }"/></td>
                                <td><c:out value="${b.bookingState }"/></td>
                                <td><c:out value="${b.lendingState }"/></td>
                            </tr>
                            </c:forEach>
                        </table>
                        <div id="pageBar">
                        	<c:out value="${pageBar }" escapeXml="false"/>
                        </div>
                        <div id="bookAllListBtn">
                            <button id="delBookBtn" type="button" class="btn btn-outline-secondary">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </section>
	
	<script>
	
	// 상세검색 클릭 시 펼지기 

    const showDetSea = function () {
        $("#searchWrap").hide();
        $("#detSeaWrap").show();
    }

    const closeDetSea = () => {
        $("#searchWrap").show();
        $("#detSeaWrap").hide();
    }
    
    
	</script>
	
	<script>
	
    $(function(){
        // ul show()
        $(".navOptions").eq(1).show();
        // ul li 배경화면 
        $(".navOptions").eq(1).children().eq(0).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
    // 페이지 이동 
    const fn_paging = function(cPage){
    	location.assign('${path}/admin/book/bookAllList.do?cPage='+cPage);
    }
    
    
    
    // 선택 도서 삭제 
    $("button[id=delBookBtn]").click(e=>{
    	
		// 선택 객체 
		const checkItem = $("input:checkbox[name=checkFl]:checked")
		
    	// 선택 여부 확인 
    	if(checkItem.length!=0){
	    	// 선택객체 삭제 
	    	if(confirm("삭제하시겠습니까?")){
	    		let checkArr = new Array();
	    		$.each($(checkItem),function(i,v){
	    			checkArr.push($(v).val());
	    		})
	        	location.href="${path}/admin/book/deleteBook.do?bookNo="+checkArr;
	    	} // 삭제if문 
    	} else {
    		alert("도서를 선택해주세요");
    	}
    })
    
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>