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
<body>
    <div class="divcontainer1">
    <br>
    	<h2 id="title11">공지사항</h2>
    <br>
  </div>
    <section id="ad_containerad">
        <div class="list-group-containers" >
            <ul class="list-group">
              <li class="list-group-item" id="menutitle">이용안내</li>
              <li class="list-group-item" onclick="location.assign('${path}/notice/noticeList.do')">공지사항</li>
              <li class="list-group-item" onclick="location.assign('${path}/faq/faqList.do')">자주묻는질문</li>
              <li class="list-group-item" onclick="location.assign('${path}/qna/qnaList.do')">QNA</li>
            </ul>
        </div>
        <div id="he_right">
            <div id="titleheadnamec">공지사항</div>
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
					        	<c:out value="${list.originalFileName }"/>
	                
	                        </td>
	                    </tr>
                    <tr class="line">
                        <td class="line3">조회수</td>
                        <td class="line2"><c:out value="${list.noticeCount }"/></td>
                    </tr>
                </table>
                <div class="contentbox"><c:out value="${list.noticeContent }"/></div>
                <div class="button">
                <button class="btn btn-outline-secondary" onclick="backbutton();">목록으로</button>
            	</div>
            </div>
        </div>
    </section>
    
    <script>
    	const backbutton=()=>{
    		location.assign("${path}/notice/noticeList.do")
    	}
    	
    	 $(function(){
 
    			
    			  
    			  $(".list-group").children().eq(1).css({"backgroundColor" : "lightgrey"})
    			  
    				 	   
    			})
    </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>