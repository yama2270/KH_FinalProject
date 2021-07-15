<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="qna작성폼"/>
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
    <title>QnA 작성 폼</title>
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
            <div id="contHeader">Q&A 묻고답하기 -> 글작성</div>
            <div id="contbody" class="sech"></div>
                <div class="borderbody">
                    <form>
                        <table class="table2">
                            <tr>
                                <td class="title">제목</td>
                                <td class="name"><input type="text" class="titlename2"></td>
                            </tr>
                            <tr>
                                <td class="title">분류</td>
                                <td class="name">
                                    <select name="katagori">
                                        <option value="도서">도서</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="title">작성자</td>
                                <td class="name"></td>
                            </tr>
                            <tr>
                                <td class="title">공개여부</td>
                                <td class="name">
                                    <input type="radio" value="공개">공개
                                    <input type="radio" value="비공개">비공개
                                </td>
                            </tr>
                        </table>
                        <textarea name="" id="" cols="161" rows="20" class="textarea"></textarea>
                        <input type="submit" value="등록" class="newtext">
                        <button type="onclick" id="backtext">취소</button>
                    </form>
                </div>
            </div>
        </div>
</section>        
</body>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>