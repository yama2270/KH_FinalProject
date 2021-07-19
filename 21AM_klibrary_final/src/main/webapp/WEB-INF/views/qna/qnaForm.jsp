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
    <title>QnA 작성 폼</title>
</head>
<body id="ad_body">
    <header id="ad_header">
        <div id="header_title">K-도서관</div>
    </header>
    <section id="ad_container">
        <div class="leftmenu" >
            <ul class="list-group">
              <li class="list-group-item" id="menutitle">이용안내</li>
              	<li class="list-group-item"><a href="${path }/notice/noticeList.do">공지사항 </a></li>
              	<li class="list-group-item"><a href="${path }/faq/faqList.do">자주묻는질문</a></li>	
              	<li class="list-group-item"><a href="${path }/qna/qnaList.do">QNA</a></li>
            </ul>
          </div>
        <div id="he_right">
            <div id="contHeader">QNA 묻고답하기 -> 글작성</div>
            <div id="contbody" class="sech"></div>
                <div class="borderbody">
                    <form>
                        <table class="table2">
                            <tr>
                                <td class="title">제목</td>
                                <td class="nameq"><input type="text" class="titlename2"></td>
                            </tr>
                            <tr>
                                <td class="title">분류</td>
                                <td class="nameq">
                                    <select name="katagori">
                                        <option value="도서">도서</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="title">작성자</td>
                                <td class="nameq"></td>
                            </tr>
                            <tr>
                                <td class="title">공개여부</td>
                                <td class="nameq">
                                    <input type="radio" value="공개">공개
                                    <input type="radio" value="비공개">비공개
                                </td>
                            </tr>
                        </table>
                        <textarea name="" id="" cols="110" rows="10" class="textarea"></textarea>
                        <input type="submit" value="등록" class="newtext" style= "margin-left: 35%;">
                        <a href="${path }/qna/qnaList.do">	
                        	<button class="qf-cancel" >취소</button>
                        </a>		
                    </form>
                </div>
            </div>
</section>        

<script>
</script>  
</body>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>