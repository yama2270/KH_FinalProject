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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hy.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dg.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hj.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sy.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/cg.css">
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="../js/jquery-3.6.0.min.js"></script>
    <title>메인페이지</title>
</head>
<body id="ad_body">
    <header id="ad_header">
        <div id="header_title">K-도서관</div>
        <div id="header_options">
            <div id="header_moveMain">메인페이지</div>
            <div id="header_logout">로그아웃</div>
        </div>
    </header>
    <section id="ad_container">
        <div id="ad_left">
            <div id="leftNav">
                <ul id="lefNavList">
                    <li><a href="">공지사항</a></li>                            
                    <li><a href="">Q&A묻고답하기</a></li>
                    <li><a href="">FAQ 자주하는질문</a></li>
                </ul>
            </div>
        </div>
        <div id="ad_right">
            <div id="contHeader">FAQ 자주하는질문</div>
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
</body>
<script>
    let flag=true;
    $(".contents").prev().on("click",(e)=>{
        console.log(e.target);
        console.log($(e.target).next());
        $(e.target).next().slideToggle(1000);
        $(".contents").not($(e.target).next()).css("display","none");
    });
</script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>