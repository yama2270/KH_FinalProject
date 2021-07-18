<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="공지사항관리"/>
</jsp:include>
	        <div id="ad_right">
            <div id="contHeader">공지사항 관리</div>
            <div id="contbody">
            
        <div id="notice_box">
            <div id="notice_table_box">
                <div id="total_notice" style="margin-left:-3%;">
                    <div>
                        <input type="button" id="button" name="button" value="전체" class="btn btn btn-secondary btn-bg" style="margin-bottom:3%;margin-right:2%;"/>
                        <input type="button" id="button" name="button" value="일정" class="btn btn btn-secondary btn-bg" style="margin-bottom:3%;margin-right:2%;"/>
						<input type="button" id="button" name="button" value="행사" class="btn btn btn-secondary btn-bg" style="margin-bottom:3%;margin-right:2%;"/>
						<input type="button" id="button" name="button" value="신간" class="btn btn btn-secondary btn-bg" style="margin-bottom:3%;margin-right:2%;"/>
						<input type="button" id="button" name="button" value="모집" class="btn btn btn-secondary btn-bg" style="margin-bottom:3%;margin-right:2%;"/>
                        <div class="dropdown">
                          <div id="dropdown_category">
                              <select class="odfselect" style="height:30px;margin-left:10%;margin-top:1%">
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
                <table id="notice_table" class="pa" border style="margin-left:-3%;">
                    <thead>
                        <tr style="background-color: #eaeaea;">
                            <th><input type="checkbox" id="allCheck" value="yyy" checked></td>
                            <th width=100>번호</th>
                            <th width=100>분류</th>
                            <th width=450>제목</th>
                            <th width=150>작성자</th>
                            <th width=150>작성일</th>
                            <th width=100>조회수</th>
                        </tr>
                        <c:choose> 
   					<c:when test="${not empty list }">
   					<c:forEach var="notice" items="${list }">
   						<tr>
   							<td class="cols"><input type="checkbox"/>
   							<td class="cols"><c:out value="${notice.noticeNo }"/></td>
   							<td class="cols"><c:out value="${notice.noticeCate }"/></td>
   							<td class="cols">
   								<a href="${path }/admin/notice/noticeView.do?no=${notice.noticeNo}">
   									<c:out value="${notice.noticeTitle }"/>
   								</a>
   							</td>
   							<td class="cols"><c:out value="관리자"/></td>
   							<td class="cols"><c:out value="${notice.noticeDate }"/></td>					
   							<td class="cols"><c:out value="${notice.noticeCount }"/></td>
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
            <a href='<c:url value='/admin/notice/noticeForm.do'/>' role="button" class="btn btn-outline-dark" style="margin-left:84%;margin-top:2%;">작성</a>
        	<input type="button" value="삭제" class="btn btn-outline-dark" style="margin-left:1%;margin-top:2%; onclick="del(${noticeNo })">
            <div id="c_pagebar" class="pagebar">
                <span><a href="">1</a></span>
                <span><a href="">2</a></span>
                <span><a href="">3</a></span>
                <span><a href=""></a></span>
                <!--출력할 데이터 개수에 따라 페이지가 추가되도록 함-->
            </div>
        </div>

    </section>
    <!--section에 적용될 style, script 내용 넣어주세요-->


    <script>
    
 
	function del(noticeNo) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete?noticeNo='+noticeNo;
		}
	}	


    $(function(){
        // ul show()
        $(".navOptions").eq(2).show();
        // ul li 배경화면 
        $(".navOptions").eq(2).children().eq(0).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
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