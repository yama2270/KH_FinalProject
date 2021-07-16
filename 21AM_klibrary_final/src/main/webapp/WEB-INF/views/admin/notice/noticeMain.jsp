<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
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
                        <span class="category"><a href="">전체</a></span>
                        <span class="category"><a href="">일정</a></span>
                        <span class="category"><a href="">행사</a></span>
                        <span class="category"><a href="">신간</a></span>
                        <span class="category"><a href="">이벤트</a></span>
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
                <table id="notice_table" class="pa" border style="margin-left:-3%;">
                    <thead>
                        <tr style="background-color: #eaeaea;">
                            <th><input type="checkbox" id="allCheck" value="yyy" checked></td>
                            <th width=225>번호</th>
                            <th width=450>제목</th>
                            <th width=150>글쓴이</th>
                            <th width=150>작성일</th>
                            
                        </tr>
                        <tr>
                          <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                          <td>10</td>
                          <td class="notice_title"><a href="">7월 신간 안내</a></td>
                          <td>도서관 관리자</td>
                          <td>21.07.01</td>
                         
                      </tr>
                      <tr>
                          <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                          <td>9</td>
                          <td><a href="">7월의 행사</a></td>
                          <td>도서관 관리자</td>
                          <td>21.07.01</td>
                        
                      </tr>
                      <tr>
                          <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                          <td>8</td>
                          <td><a href="">대출공지</a></td>
                          <td>도서관 관리자</td>
                          <td>21.07.01</td>
                         
                      </tr>
                      <tr>
                          <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                          <td>7</td>
                          <td><a href="">홈페이지 점검 안내입니다</a></td>
                          <td>운영자</td>
                          <td>21.06.27</td>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>6</td>
                            <td><a href="">7월 신간 안내</a></td>
                            <td>도서관 관리자</td>
                            <td>21.07.01</td>
                           
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>5</td>
                            <td><a href="">7월의 행사</a></td>
                            <td>도서관 관리자</td>
                            <td>21.07.01</td>
                          
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>4</td>
                            <td><a href="">대출공지</a></td>
                            <td>도서관 관리자</td>
                            <td>21.07.01</td>
                           
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>3</td>
                            <td><a href="">홈페이지 점검 안내입니다</a></td>
                            <td>운영자</td>
                            <td>21.06.27</td>
                          
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>2</td>
                            <td><a href="">대출 연장 관련 공지</a></td>
                            <td>도서관 관리자</td>
                            <td>21.06.26</td>
                            
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>1</td>
                            <td><a href="">도서관 주말오픈시간 안내</a></td>
                            <td>도서관 관리자</td>
                            <td>21.06.25</td>

                        </tr>

                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <td>
                    <button style="margin-left: 92%;margin-top:1%">삭제</button>
            </td>
            <div id="c_pagebar" class="pagebar">
                <span><a href="">1</a></span>
                <span><a href="">2</a></span>
                <span><a href="">3</a></span>
                <span><a href=""></a></span>
                <!--출력할 데이터 개수에 따라 페이지가 추가되도록 함-->
            </div>
        </div>
	</div>
	</div>
    </section>

    <script>

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
    
    <script>
	
    // navigation 고정 
    $(function(){
        // ul show()
        $(".navOptions").eq(2).show();
        // ul li 배경화면 
        $(".navOptions").eq(2).children().eq(0).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
	</script>
    
 <jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>