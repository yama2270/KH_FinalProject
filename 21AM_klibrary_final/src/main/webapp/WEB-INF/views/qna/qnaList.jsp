<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="qna리스트"/>
</jsp:include> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>QnA묻고답하기</title>
</head>

<body id="ad_body">
    <header id="ad_header">
        <div id="header_title">K-도서관</div>
    </header>
    <section id="ad_container">
        <div class="list-group-container" >
            <ul class="list-group">
              <li class="list-group-item" id="menutitle">이용안내</li>
              <li class="list-group-item">공지사항</li>
              <li class="list-group-item">자주묻는질문</li>
              <li class="list-group-item">QNA</li>
            </ul>
          </div>
        <div id="ad_right_fq">
            <div id="contHeader">Q&A 묻고답하기</div>
            <div  id="contbody" class="sech">
                <form>
                    <select required class="fontsize">
                        <option value="">제목</option>
                        <option value="">내용</option>
                    </select>
                    <input type="text" class="textbox">
                    <input type="submit" value="검색" class="fontsize">
                </form>
                <button class="writing">글쓰기</button>
            </div>
            <div class="tableMapqa">
                <table class="table">
                    <tr>
                        <th class="head2">번호</th>
                        <th class="head">제목</th>
                        <th class="head2">첨부파일</th>
                        <th class="head3">등록일</th>
                        <th class="head2">조회수</th>
                        <th class="head2">처리상태</th>
                    </tr>
                </table>
            </div>
        </div>
</section>        
</body>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>