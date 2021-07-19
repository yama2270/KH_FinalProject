<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="faq리스트"/>
</jsp:include> 
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="../js/jquery-3.6.0.min.js"></script>
    <title>FAQ자주하는질문</title>
</head>



<body id="ad_body">
    <header id="ad_header">
        <div id="header_title">K-도서관</div>
    </header>
    <section id="ad_container">
        <div class="leftmenu" >
            <ul class="list-group">
           		<li class="list-group-item" id="menutitle">이용안내</li>            
              	<li class="list-group-item"><a href="${path}/notice/noticeList.do">공지사항</a></li>  	
            	<li class="list-group-item"><a href="${path }/faq/faqList.do"></a>자주묻는질문</li>	
            	<li class="list-group-item"><a href="${path }/qna/qnaList.do">QNA</a></li>	
            </ul>
          </div>
        <div id="he_right">
            <div id="contHeaderd">FAQ 자주하는질문</div>
            <div id="contbody">
                <div class="qabody">
                    <form class="qsech">
                        <select name="katagori" id="katagori">
                            <option value="제목">제목</option>
                            <option value="내용">내용</option>
                        </select>
                        <input type="text" class="sechtext">
                        <input type="submit" value="검색" id="katagori">
                    </form>
						<c:forEach var="f" items= "${list}">
	                    	<div class="qmenu"><c:out value="${f['FAQ_CATE'] }"/></div>
	                        	<p class="contents"><c:out value="${f['FAQ_CONTENT']}"/></p>
						</c:forEach>
                    <div class="qmenu">두번째 질문</div>
                        <p class="contents">내용2</p>
                    <div class="qmenu">세번째 질문</div>
                        <p class="contents">내용3</p>
                    <div class="qmenu">네번째 질문</div>
                        <p class="contents">내용4</p>
                    <div class="qmenu">다섯번째 질문</div>
                        <p class="contents">내용5</p>
                </div>
            </div>
        </div>
    </section>
<script>
    let flag=true;
    $(".contents").prev().on("click",(e)=>{
        console.log(e.target);
        console.log($(e.target).next());
        $(e.target).next().slideToggle(500);
        $(".contents").not($(e.target).next()).css("display","none");
    });
</script>

</body>
</html>