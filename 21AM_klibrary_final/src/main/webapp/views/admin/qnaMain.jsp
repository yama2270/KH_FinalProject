<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sh.css">
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <title>공지사항 관리</title>
</head>
<body id="ad_body">
    <header id="ad_header">
            <div id="header_title">K-도서관</div>
            <div id="header_options">
                <div id="header_moveMain">메인페이지</div>
                <div id="header_logout">로그아웃</div>
        </div>
    </header>
    <section id="ad_container">
        <div id="ad_left">
            <div id="leftNav">
                <ul id="lefNavList">
                    <li>회원관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li>회원정보</li>
                            <li>탈퇴요청</li>
                        </ul>
                    </li>                            
                    <li>도서관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li>전체도서목록</li>
                            <li>도서등록</li>
                            <li>도서대출현황</li>
                            <li>도서예약현황</li>
                        </ul>
                    </li>
                    <li>게시글 관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li>공지사항 관리</li>
                            <li>문의사항 관리</li>
                            <li>자주하는 질문</li>
                        </ul>
                    </li>
                    <li>열람실 관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li>전체조회</li>
                            <li>열람실A</li>
                            <li>열람실B</li>
                            <li>열람실C</li>
                            <li>열람실D</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        
        <div id="ad_right">
            <div id="contHeader">문의사항 관리</div>
            <div id="contbody">
         
        </div>
 
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
                            <th><input type="checkbox" id="allCheck" value="yyy" checked></td>
                            <th width=225>번호</th>
                            <th width=450>제목</th>
                            <th width=150>글쓴이</th>
                            <th width=150>작성일</th>
                            <th width=150>답변상태</th>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>6</td>
                            <td><a href="">대출문의입니다</a></td>
                            <td>박유현</td>
                            <td>21.07.01</td>
                            <td>답변 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>6</td>
                            <td><a href="">대출문의입니다</a></td>
                            <td>박유현</td>
                            <td>21.07.01</td>
                            <td>답변 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>6</td>
                            <td><a href="">대출문의입니다</a></td>
                            <td>박유현</td>
                            <td>21.07.01</td>
                            <td>답변 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>6</td>
                            <td><a href="">대출문의입니다</a></td>
                            <td>박유현</td>
                            <td>21.07.01</td>
                            <td>답변 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>6</td>
                            <td><a href="">대출문의입니다</a></td>
                            <td>박유현</td>
                            <td>21.07.01</td>
                            <td>답변 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>5</td>
                            <td><a href="">대출문의입니다</a></td>
                            <td>최찬규</td>
                            <td>21.07.01</td>
                            <td>답변 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>4</td>
                            <td><a href="">대출문의입니다</a></td>
                            <td>김동규</td>
                            <td>21.07.01</td>
                            <td>답변 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>3</td>
                            <td><a href="">대출문의입니다</a></td>
                            <td>곽승혁</td>
                            <td>21.06.27</td>
                            <td>답변 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>2</td>
                            <td><a href="">대출 연장문의</a></td>
                            <td>양화영</td>
                            <td>21.06.26</td>
                            <td>답변 대기중</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="xxx" value="yyy" checked></td>
                            <td>1</td>
                            <td><a href="">도서관 주말오픈시간 문의</a></td>
                            <td>권설영</td>
                            <td>21.06.25</td>
                            <td>답변 완료</td>
                        </tr>

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
             
                <!--출력할 데이터 개수에 따라 페이지가 추가되도록 함-->
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