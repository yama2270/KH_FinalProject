e<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="문의사항 관리"/>
</jsp:include>
<head>

</head>	        
        <div id="ad_right">
            <div id="contHeader">문의사항 관리</div>
            <div id="contbody">
         

        <div id="QnA_box">
            <div id="QnA_table_box">
                <div id="total_QnA" style="margin-left:-3%;">
                    <div>
                        <span class="category"><a href="">전체</a></span>
                        <span class="category"><a href="">대출</a></span>
                        <span class="category"><a href="">건의사항</a></span>
                        <span class="category"><a href="">열람실</a></span>
                        <span class="category"><a href="">희망도서</a></span>
                        <div class="dropdown">
                            <div id="dropdown_category">
                                <select class="odfselect" style="height:30px;margin-left:10%;margin-top:-5%">
                                    <option selected>제목</option>
                                    <option>내용</option>
                                    <option>글쓴이</option>
                                </select>
                            </div>
                        </div>
                        <span>
                            <form id="search" action="" method="get">
                                <input type="search" name="searchheader">
                                <input type="submit" value="검색">
                            </form>
                        </span>
                    </div>
                </div>
                <table id="QnA_table" class="pa" border style="margin-left:-3%;">
                    <thead>
                        <tr style="background-color: #eaeaea;">
                            <th width=50><input type="checkbox" id="allCheck" value="yyy" checked></td>
                            <th width=100>번호</th>
                            <th width=450>제목</th>
                            <th width=150>글쓴이</th>
                            <th width=150>작성일</th>
                            <th width=150>답변상태</th>
                            <th width=75>조회수</th>
                        </tr>
                         <c:choose> 
   					<c:when test="${not empty list }">
   					<c:forEach var="q" items="${list }">
   						<tr>
   							<td class="cols"><c:out value="${q.qnaNo }"/></td>
   							<td class="cols">
   								<a href="${path }/admin/notice/qnaView.do?no=${q.qnaNo}">
   									<c:out value="${q.qnaTitle }"/>
   								</a>
   							</td>
   							<td class="cols"><c:out value="${q.qnaTitle }"/></td>
   							<td class="cols"><c:out value="${q.userId }"/></td>
   							<td class="cols"><c:out value="${q.qnaDate }"/></td>
   							<td class="cols"><c:out value="${q.qnaState }"/></td>   	  							
   							<td class="cols"><c:out value="${q.qnaCount }"/></td>
   						</tr>
   					</c:forEach>
   				</c:when>
   				<c:otherwise>
   					<tr>
   					<td colspan="6">조회된 자료가 없습니다</td>
   					</tr>
   				</c:otherwise>       		
          	</c:choose>
                       

                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <td>
                    <button style="margin-left: 92%; margin-top:1%;">삭제</button>
            </td>
            <div id="c_pagebar" class="pagebar">
                <span><a href="">1</a></span>
                <span><a href="">2</a></span>
                <span><a href="">3</a></span>
             
            </div>
                <!--출력할 데이터 개수에 따라 페이지가 추가되도록 함-->
            </div>
        </div>

    </section>
    
    <script>

    $(function(){
        // ul show()
        $(".navOptions").eq(2).show();
        // ul li 배경화면 
        $(".navOptions").eq(2).children().eq(1).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
/*     $(function(){

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

}) */

$(function(){ //전체선택 체크박스 클릭 
  $("#allCheck").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
    if($("#allCheck").prop("checked")) { 
      //해당화면에 전체 checkbox들을 체크해준다 
      $("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
    } else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
      $("input[type=checkbox]").prop("checked",false); } 
    })
   })
    

    </script>
    
        <jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>