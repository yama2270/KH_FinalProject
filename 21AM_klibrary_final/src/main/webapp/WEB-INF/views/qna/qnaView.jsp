<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="qna묻고답하기확인"/>
</jsp:include> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/HW.css">
    <link rel="stylesheet" href="../css/yh.css">
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="../js/jquery-3.6.0.min.js"></script>
    <title>묻고답하기확인</title>
</head>
<body id="ad_body1">
    <header id="ad_header"style="background-color:lightblue;">
            <div id="header_title" style="color:blue;margin-bottom: 19px;margin-left: 70px;">QNA</div>
    </header>

    <section id="ad_container">
        <div class="leftmenu" >
            <ul class="list-group">
              	<li class="list-group-item" id="menutitle">이용안내</li>             
              	<li class="list-group-item"><a href="${path}/notice/noticeList.do">공지사항</a></li>
            	<li class="list-group-item"><a href="${path }/faq/faqList.do">자주묻는질문</a></li>	
            	<li class="list-group-item"><a href="${path }/qna/qnaList.do">QNA</a></li>
            </ul>	
          </div>
	        <div id="he_right">
	            <div id="contHeader">Q&A 묻고답하기</div>
	            <div id="contbody">
	                <div class="titlebody">
	                    <div class="titlename">
	                        <table>
	                            <tr>
	                                <td class="tabletitle">제목 : <c:out value="${qna.qnaTitle }"/></td>
	                                <td class="tabletitle">작성일 : <fmt:formatDate value="${qna.qnaDate }" pattern="yy/MM/dd/(E)hh:mm"/></td>
	                            </tr>
	                            <tr>
	                                <td class="tabletitle">작성자 : <c:out value ="${qna.userId }"/></td>
	                                <td class="tabletitle">조회수 : <c:out value ="${qna.qnaCount }"/></td>
	                            </tr>
	                        </table>
	                        <div class="border" style="background-color:#e6f2fb; height:150px">내용: <c:out value="${qna.qnaContent }"/></div>
	                        	<c:if test="${qna.attachments.size()>0 }">
									<c:forEach var="a" items="${qna.attachments }" varStatus="vs">
						                    <button type="button" 
						                    class="btn btn-outline-success btn-block"
						                    onclick="location.assign('${path}/qna/fileDownload.do?oriname=${a.originalFileName }&rename=${a.originalFileName }')">
						                    <c:out value="첨부파일 ${vs.count }-${a.originalFileName }"/>
						            </button>
						        </c:forEach>
						        </c:if>
	                        <div class="coment" style="background-color:#b6cde8; height:200px;">답글: <c:out value="${qna.qnaAnswerContent }"/></div>
	                        <div class="newcoment">
<!-- 	                            <div>
	                                작성자
	                                <input type="text" class="comenttext">
	                                <input type="submit" value="등록" class="submitbutton">
	                            </div> -->
	                            	<%-- <div class="qna_update">
	                            	 <a href="${path }/qna/updateQna.do?no=${qna.qnaNo}">	
	                            		<button class="qna_update_bt" style="margin-left:45%;">수정</button>
									 </a>	
	                            	</div> --%>
	                            	<div class="qna_btn_v" style="display:flex;">
		                            	<div class="qna_update">
		                            		<a href="${path }/qna/updateQna.do?no=${qna.qnaNo}" role="button" class="btn btn-outline-info" style="margin-right:5px">수정</a>
		                            	</div>
		                            	<div class="qna_delete">
		                            		<a href="${path }/qna/qnaDelete.do?no=${qna.qnaNo}" role="button" class="btn btn-outline-info" style="margin-left:5px">삭제</a>
		                            	</div>
		                            </div>	 
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
    </section>

<script>
    fuction 
    
    // navigation 이벤트
    
    $(function(){

    const naviList = $("#lefNavList").children();
    const options = $(".navOptions")
    
    $(naviList).click((e)=>{
        $(naviList).children().not('i').hide();
        $(naviList).children().filter('i').attr("class","fas fa-plus");
        $(options).children().css({"font-size":"15px","backgroundColor":"#9BC3FF","fontWeight":"normal"})
        $(e.target).find("ul").show();
        $(e.target).find("i").attr("class","fas fa-minus");
    })

    // navigation - option 이벤트 

    $(options).mouseover((e)=>{
        $(e.target).css("textDecoration","underline");
    })

    $(options).mouseout((e)=>{
        $(e.target).css("textDecoration","");
    })

    $(options).click((e)=>{
        
        $(options).children().css({"font-size":"15px","backgroundColor":"#9BC3FF","fontWeight":"normal"})
        $(e.target).css({"font-size":"20px","fontWeight":"bold","backgroundColor":"#7DA5E1"})
        return false;
    })

})

</script>

</body>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>
