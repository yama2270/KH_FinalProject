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
                    <form name="qnaForm" action="${path}/qna/insertQna.do" method="post" enctype="multipart/form-data">
                        <table class="table2">
                            <tr>
                                <td class="title">제목</td>
                                <td class="nameq"><input type="text" class="titlename2" name="qnaTitle"></td>
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
                                <td><input type="text" name="userId" value="${loginMember.userId}" readonly required></td>
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
                        <textarea name="qnaContent" id="" cols="110" rows="10" class="textarea"></textarea>
                        <input type="submit" value="등록" class="btn btn-outline-info" style= "margin-left: 35%;">                        	                        		
                        <button class="btn btn-outline-info"><a href="${path}/qna/qnaList.do">취소</a></button>
                    </form>
                </div>
            </div>
</section>        

<script>
/* 	const fn_moveQnaList =()=>{
		location.assign("${path}/qna/qnaList.do")} */
	
	$(function(){
		$("[name=upFile]").change(e=>{
			const fileName=$(e.target).prop('files')[0].name;
			$(e.target).next(".custom-file-label").html(fileName);
		});		
	})
</script>  
</body>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>