<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    	<!-- totalContents 선언 -->
    	
    	<c:set var="totalContents" value="${requestScope.list.size() }"/>
		     <div class="leftmenu">   
		            <ul class="list-group">
		              <li class="list-group-item" id="menutitle">이용안내</li>
			            <a href="${path}/notice/noticeList.do">              
			              	<li class="list-group-item">공지사항</li>
			            </a>  	
			            <a href="${path }/faq/faqList.do">
			            	<li class="list-group-item">자주묻는질문</li>
			            </a>	
			            <a href="${path }/qna/qnaList.do">	
			            	<li class="list-group-item">QNA</li>
			            </a>	
		            </ul>  
		     </div>  
		   <div id=he_right>
		        <div id="ad_right_fq">
		            <div id="titleheadname">Q&A 묻고답하기</div>
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
		            <button class="writing" onclick="fn_moveQnaForm();"<%-- "Location.assign('${path}/qna/qnaForm.do')" --%>>글쓰기</button>
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
		                    <c:choose>
			                     <c:when test="${not empty requestScope.list }">
			                     	<c:forEach var="q" items="${requestScope.list }">
			                     		<tr onclick="fn_qnaView(event);">
			                     			<td class="qnaNo"><c:out value="${q.qnaNo }"/></td>
			                     			<td><c:out value="${q.qnaTitle }"/></td>
			                     			<td><c:out value="${q.attachments.size() }"/></td>
			                     			<td><c:out value="${q.qnaDate }"/></td>
			                     			<td><c:out value="${q.qnaCount }"/></td>
			                     			<td><c:out value="${q.qnaState }"/></td>
			                     		</tr>	
			                     	</c:forEach>
			                     </c:when>
			                     <c:otherwise>
			                     	<tr colspan="6">
			                     		<td> 조회된 자료가 없습니다 </td>
			                     	</tr>
			                     </c:otherwise>	
		                    </c:choose>
		                </table>
		                <div id="pagebar-container">
		    				${ pagebar }
		    			</div>
		            </div>
	        	</div>
	      </div>  
        <script>
        	var fn_moveQnaForm =()=>{
        		location.assign("${path}/qna/qnaForm.do")}
        	const fn_qnaView = (e) => {
        		let qnaNo =$(e.target).parent().find("td.boardNo").text();
        		location.assign("${path}/qna/qnaView.do?no=" + qnaNo);
        	}
        </script>
</section>        
</body>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>