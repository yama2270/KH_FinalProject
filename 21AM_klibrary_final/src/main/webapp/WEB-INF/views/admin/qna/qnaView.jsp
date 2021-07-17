	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="문의사항 등록"/>
</jsp:include>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sh.css">
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <title>공지사항 관리</title>
</head>
        <div id="ad_right">
            <div id="contHeader">문의사항 답변</div>
            <div id="contbody">
        <div id="QnA_box">
                <table id="QnA_table" class="pa" border>
                    <thead>
                        <tr style="background-color: #eaeaea;">
                            <th width=100>질문유형</th>
                            <th width=450>제목</th>
                            <th width=150>작성자</th>
                            <th width=150>작성일</th>
                        </tr>
                        <tr>
                           
                            <td>대출</td>
                            <td>대출문의입니다</td>
                            <td>박유현</td>
                            <td>21.07.01</td>

                    </thead>
                    <tbody>
                    </tbody>
                </table>

                <div class="rv_write">
                    <textarea class="rv_write_txt" maxlength="5000" placeholder="문의사항 내용이 보여질 공간입니다" style="width:1000px;height:200px;margin-top:3%"></textarea>
                </div>

                <div class="rv_write">
                    <textarea class="rv_write_txt" maxlength="5000" placeholder="답변을 작성할 공간입니다" style="width:1000px;height:200px;margin-top:3%"></textarea>
                </div>
                <button style="width:50px;height:30px;margin-top:2%;margin-left:88%">이전</button>
                <button style="width:50px;height:30px;margin-left:1%">완료</button>
            </div>
  </div>
        </div>
    </section>

    
    <script>

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
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>