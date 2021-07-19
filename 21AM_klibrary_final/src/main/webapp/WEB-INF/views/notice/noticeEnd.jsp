<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="공지사항확인"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hy.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yh.css">
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
              <li class="list-group-item"><a href="${path }/notice/noticeList.do">공지사항</a></li>
              <li class="list-group-item"><a href="${path }/faq/faqList.do">자주묻는질문</a></li>
              <li class="list-group-item"><a href="${path }/qna/qnaList.do">QNA</a></li>
            </ul>
        </div>
        <div id="he_right">
            <div id="titleheadname">공지사항</div>
            <div class="tableMap2">
                <table class="table2">
                    <tr class="line">
                        <td class="line3">제목</td>
                        <td class="line2"><c:out value="${list.noticeTitle }"/></td>
                    </tr>
                    <tr class="line">
                        <td class="line3">등록일</td>
                        <td class="line2"><c:out value="${list.noticeDate }"/></td>
                    </tr>
	                    <tr class="line">
	                        <td class="line3">첨부파일</td>
	                        <td class="line2">
					        	
	                
	                        </td>
	                    </tr>
                    <tr class="line">
                        <td class="line3">조회수</td>
                        <td class="line2"><c:out value="${list.noticeCount }"/></td>
                    </tr>
                </table>
                <div class="contentbox"><c:out value="${list.noticeContent }"/></div>
                <button class="backbutton" onclick="backbutton();">목록으로</button>
            </div>
        </div>
    </section>
    
    <script>
    	const backbutton=()=>{
    		location.assign("${path}/notice/noticeList.do")
    	}
    </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>