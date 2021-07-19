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
        <div class="leftmenu" >
            <ul class="list-group">
              <li class="list-group-item" id="menutitle">이용안내</li>
              <li class="list-group-item" onclick="location.assign('${path}/notice/noticeList.do')">공지사항</li>
              <li class="list-group-item" onclick="location.assign('${path}/faq/faqList.do')">자주묻는질문</li>
              <li class="list-group-item" onclick="location.assign('${path}/qna/qnaList.do')">QNA</li>
            </ul>
        </div>
        <div id="he_right">
            <div id="titleheadname">공지사항</div>
            <div id="contbody" class="sech">
                <form action="${path }/notice/noticesearch.do" method="post">
                    <select required class="fontsize" name="searchType">
                        <option value="제목">제목</option>
                        <option value="내용">내용</option>
                    </select>
                    <input type="text" class="textbox" name="text">
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
                    				<td class="head2">
                    				<c:out value="${n.noticeNo }"/></td>
                    				<td class="head">
	                    				<a href="${path }/notice/noticeEnd.do?no=${n.noticeNo }"/>
	                    				<c:out value="${n.noticeTitle }"/>
                    				</td>
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
    <script>
    $(function(){
	   $('.list-group-item').click(function(){
	      $('.list-group-item').removeClass('on')
	        $(this).addClass('on')
	   })
	   
	})
</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>