<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="공지사항목록"/>
</jsp:include>
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
                    <li><a href="${path }/notice/noticeList.do">공지사항</a></li>                            
                    <li><a href="">Q&A묻고답하기</a></li>
                    <li><a href="">FAQ 자주하는질문</a></li>
                </ul>
            </div>
        </div>
        <div id="ad_right">
            <div id="contHeader">공지사항</div>
            <div id="contbody" class="sech">
                <form>
                    <select required class="fontsize">
                        <option value="">제목</option>
                        <option value="">내용</option>
                    </select>
                    <input type="text" class="textbox">
                    <input type="submit" value="검색" class="fontsize">
                </form>
            </div>
            <div class="tableMap">
                <table class="table">
                    <tr>
                        <th class="head2">번호</th>
                        <th class="head">제목</th>
                        <th class="head2">첨부파일</th>
                        <th class="head3">등록일</th>
                        <th class="head2">조회수</th>
                    </tr>
                    <!-- 게시글 출력 -->
                    <c:choose>
                    	<c:when test="${not empty list }">
                    		<c:forEach var="n" items="${list }">
                    			<tr>
                    				<td class="head2"><c:out value="${n.noticeNo }"/></td>
                    				<td class="head"><c:out value="${n.noticeTitle }"/></td>
                    				<td class="head2"><c:out value="${n.noticeFile }"/></td>
                    				<td class="head3"><c:out value="${n.noticeDate }"/></td>
                    				<td class="head2"><c:out value="${n.noticeCount }"/></td>
                    				
                    			</tr>
                    		</c:forEach>
                    	</c:when>
		                <c:otherwise>
		                   <tr>
		                   	<td clospan="6">조회된 공지사항이 없습니다</td>
		                   </tr>
		                </c:otherwise>
                    </c:choose>
                </table>
                <!-- 페이징처리 -->
               <div id="pagebar-container">
               	${pageBar }
               </div>
            </div>
        </div>
    </section>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>