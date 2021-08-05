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
                            <form class="d-flex" action="${path }/admin/book/searchKeyBook.do" method="post">
                                <select id="searchOption" name="searchOption" class="form-select" aria-label="Default select example" required>
                                    <option value="" ${param.searchOption != null? "":"selected"}>검색옵션</option>
                                    <option value="book_no" ${param.searchOption == "book_no"? "selected":""}>도서번호</option>
                                    <option value="isbn_no" ${param.searchOption == "isbn_no"? "selected":""}>ISBN</option>
                                    <option value="book_name" ${param.searchOption == "book_name"? "selected":""}>도서명</option>
                                    <option value="book_writer" ${param.searchOption == "book_writer"? "selected":""}>저자</option>
                                    <option value="book_company" ${param.searchOption == "book_company"? "selected":""}>출판사</option>
                                </select>
                                <input id="searchWord" class="form-control me-2" name ="searchWord" type="search" placeholder="Search" value='${param.searchWord!=null?param.searchWord:"" }'
                                    aria-label="Search" style="margin-left:5px;" required>
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
                                    <td>초성</td>
                                    <td>
                                        <input type="checkbox" name="detIni" value="44700,45207"> ㄱ
                                        <input type="checkbox" name="detIni" value="45208,45795"> ㄴ
                                        <input type="checkbox" name="detIni" value="45796,46971"> ㄷ
                                        <input type="checkbox" name="detIni" value="46972,47559"> ㄹ
                                        <input type="checkbox" name="detIni" value="47560,48147"> ㅁ
                                        <input type="checkbox" name="detIni" value="48148,49323"> ㅂ
                                        <input type="checkbox" name="detIni" value="49324,50499"> ㅅ
                                        <input type="checkbox" name="detIni" value="50450,51087"> ㅇ
                                        <input type="checkbox" name="detIni" value="51088,52263"> ㅈ
                                        <input type="checkbox" name="detIni" value="52264,52851"> ㅊ
                                        <input type="checkbox" name="detIni" value="52852,53439"> ㅋ
                                        <input type="checkbox" name="detIni" value="53440,54027"> ㅌ
                                        <input type="checkbox" name="detIni" value="54028,54615"> ㅍ
                                        <input type="checkbox" name="detIni" value="54616,55203"> ㅎ
                                    </td>
                                </tr>
                                <tr>
                                    <td>도서명</td>
                                    <td><input type="text" name="detBookName" id="detBookName"  value='${param.searchOption == "book_name"? param.searchWord:""}'></td>
                                </tr>
                                <tr>
                                    <td>ISBN</td>
                                    <td><input type="text" name="detIsbn" id="detIsbn" value='${param.searchOption == "isbn_no"? param.searchWord:""}'></td>
                                </tr>
                                <tr>
                                    <td>저자</td>
                                    <td><input type="text" name="detWriter" id="detWriter" value='${param.searchOption == "book_writer"? param.searchWord:""}'></td>
                                </tr>
                                <tr>
                                    <td>출판사</td>
                                    <td><input type="text" name="detPublisher" id="detPublisher" value='${param.searchOption == "book_company"? param.searchWord:""}'></td>
                                </tr>
                                <tr>
                                    <td>발행년</td>
                                    <td><input type="date" name="detLow" id="detLow"> ~ <input type="date" name="detHigh" id="detHigh"></td>
                                </tr>
                            </table>
                            <div id="detSeaBtn">
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
                            <tr class="bookInfo" onclick="fn_bookDetail(this);" style="cursor:pointer;">
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
    
    // 페이지 도서 key 검색 
	const fn_searchKey = function(cPage){
    	const searchKey = $("#searchOption").val();
     	const searchWord = $("#searchWord").val();
		location.assign('${path}/admin/book/searchKeyBook.do?cPage='+cPage+"&searchOption="+searchKey+"&searchWord="+searchWord);
	}
    
    // 페이지 이동 
    const fn_paging = function(cPage){
    	location.assign('${path}/admin/book/bookAllList.do?cPage='+cPage);
    }
    
    // 상세검색 이벤트 
    $("#detSeaTab input").on("input onchange",e=>{
    	
    	// 객체들 받아오기 
    	let ini = $("input:checkbox[name=detIni]");
    	let inicheck = $("input:checkbox[name=detIni]:checked").val();
    	let detBookName = $("#detBookName").val();
    	let detIsbn = $("#detIsbn").val();
    	let detWriter = $("#detWriter").val();
    	let detPublisher = $("#detPublisher").val();
    	let detLow = $("#detLow").val();
    	let detHigh = $("#detHigh").val();
		
    	// 초성 하나만 체크 
    	ini.click(function(e){
    		ini.not($(e.target)).prop("checked",false);
    	})
    	
    	$.ajax({
	   		url:"${path}/admin/book/searchDetBook.do?iniArr="+inicheck+"&detBookName="+detBookName+"&detIsbn="+detIsbn+"&detWriter="+detWriter+"&detPublisher="+detPublisher+"&detLow="+detLow+"&detHigh="+detHigh,
			success:function(data){
				console.log(data);
				$("#contentTabWrap").html(data);
			}    				
    	})
    })
    
    // 상세검색 페이징 함수 
    const fn_searchDet = function(cPage){
    	
    	// 데이터 받아오기 
    	let inicheck = $("input:checkbox[name=detIni]:checked").val();
    	let detBookName = $("#detBookName").val();
    	let detIsbn = $("#detIsbn").val();
    	let detWriter = $("#detWriter").val();
    	let detPublisher = $("#detPublisher").val();
    	let detLow = $("#detLow").val();
    	let detHigh = $("#detHigh").val();
    	
    	$.ajax({
	   		url:"${path}/admin/book/searchDetBook.do?cPage="+cPage+"&iniArr="+inicheck+"&detBookName="+detBookName+"&detIsbn="+detIsbn+"&detWriter="+detWriter+"&detPublisher="+detPublisher+"&detLow="+detLow+"&detHigh="+detHigh,
			success:function(data){
				console.log(data);
				$("#contentTabWrap").html(data);
			}    				
    	})
    }
    
    // 도서 상세 이동 
    const fn_bookDetail = function(e){
    	let bookNo = $(e).find("input:checkbox").val();
    	location.assign("${path}/admin/book/bookDetail.do?bookNo="+bookNo);
    }
    
    
    
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>