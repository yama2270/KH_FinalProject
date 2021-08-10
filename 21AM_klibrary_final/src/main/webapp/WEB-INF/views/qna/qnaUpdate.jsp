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
<body id="ad_body1">
    <header id="ad_header"style="background-color:lightblue;">
        <div id="header_title"style="color:blue;margin-bottom: 19px;margin-left: 70px;">QNA</div>
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
                    <form name="qnaForm" action="${path }/qna/updateQna.do" method="post" enctype="multipart/form-data">
                        <table class="table2">
                            <input type="hidden" name="qnaNo" value="${qna.qnaNo}">
                            <tr>
                                <td class="title">제목</td>
                                <td class="nameq"><input type="text" class="titlename2" name="qnaTitle" readonly="readonly" value="${qna.qnaTitle }"></td>
                            </tr>
                            <tr>
                                <td class="title" >분류</td>
                                <td class="nameq">
                                    <select name="qnaCate" >
                                        <option value="도서">도서</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="title">작성자</td>
                                <td><input type="text" name="userId" readonly="readonly" value="${qna.userId}"></td>
                            </tr>
				<!-- 			<tr>
                                <td class="title">작성일</td>
                                <td><input type="date" name="qnaDate" value="2020-07-22"min="2018-01-01" max="2021-12-31"></td>
                            </tr> -->
                            </tr> 
                            <tr>
                            	<td class="title">첨부파일</td>
                            	<td class="custom-file">
								  <div class="custom-file">                          	
                            		<input type="file" class="custom-file-input" name="upFile" id="upFile=1">
                            		<label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
                            	  </div>	
                            </tr>
                            <tr>
                            	<td class="title">첨부파일2</td>
                            	<td class="custom-file">
								  <div class="custom-file">                          	
                            		<input type="file" class="custom-file-input" name="upFile" id="upFile=1">
                            		<label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
                            	  </div>	
                            </tr>		
                        </table>
                        <textarea name="qnaContent" id="" cols="110" rows="10" class="textarea"><c:out value="${qna.qnaContent}"/></textarea>
                        <input type="submit" value="수정" class="btn btn-outline-info" style= "margin-left: 35%;">                        	                        		
                    </form>
                        <!-- <button class="qf-cancel" onclick="fn_moveQnaList();" >취소</button> -->
                </div>
            </div>
</section>        

<script>
	const fn_moveQnaList =()=>{
		location.assign("${path}/qna/qnaList.do")}
	
	$(function(){
		if(window.location.href=='http://localhost:9090/klibrary/qna/qnaUpdate.do'){
			
			document.getElementsByClassName('list-group-item')[3].style.background="lightgrey";
		
		}else if(window.location.href=='http://localhost:9090/klibrary/notice/noticeList.do'||pageId=="공지사항"){
		
			document.getElementsByClassName('list-group-item')[1].style.background="lightgrey";
			
		}else if(window.location.href=='http://localhost:9090/klibrary/faq/faqList.do'||pageId=="자주묻는질문"){
			
			document.getElementsByClassName('list-group-item')[2].style.background="lightgrey";
		}
		
	})
</script>  
</body>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>