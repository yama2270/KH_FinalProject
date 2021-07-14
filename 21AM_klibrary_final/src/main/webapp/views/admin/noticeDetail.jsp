<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="공지사항 상세"/>
</jsp:include>
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
            <div id="contHeader">공지사항 작성</div>
            <div id="contbody">
        
        </div>

        <div id="contents" class="container" style="margin-top:30px;margin-left:60px;">
            <div class="form-group">
            <label for="ca_name">분류</label>
             <select class="form-control form-control-sm w-auto" id="ca_name" name="ca_name" required>
                    <option value="">선택하세요</option>
                    <option value="일정">일정</option>
                    <option value="행사">행사</option>
                    <option value="신간">신간</option>
            </select>
            
            </div>
            <div class="form-group">
                <label for="wr_subject">제목</label>
                <input class="title" type="text" name="wr_subject" value="" id="wr_subject" required size="100" maxlength="200" placeholder="제목">
            </div>

            <div class="form-group d-cke-none">
                <textarea id="wr_content" name="wr_content" class="smarteditor2" maxlength="1000" style="width:900px; height: 400px;"
                placeholder="내용을 입력해주세요">
                </textarea>
            </div>
            <input type="file" style="width:200px;height:30px;"></a></td></button>
            
            <div class="write" style="margin-left:24%">
            <button id="image_upload" style="width:100px;height:30px;margin-left:400px;">취소</a></td></button>
            <button id="image_upload" style="width:100px;height:30px;">작성</a></td></button>
            </div>
    </div>



        </section>
        <!--section에 적용될 style, script 내용 넣어주세요-->
   <style>
            .form-group{
                font-family: "S-Core";
                font-weight: 300;
                margin: 4px;

            }
            h1{
                font-family: "S-Core";
                font-weight: 500;
                
            }
            label{
                font-family: "S-Core";
                font-weight: 300;
                padding:3px;
            }
            option{
                font-family: "S-Core";
                font-weight: 300;
            }


            button{
                display:flex;
                align-items: center;
                justify-content: center;                
                appearance: auto;
                text-rendering: auto;
                display: inline-block;
                text-align: center;
                align-items: flex-start;
                box-sizing: border-box;
              

            }
            .btn-box>ul{
                list-style:none;
            }
            .btn-box>ul>li{
                float:left;
                margin: 5px;
            }
            .btn-box{
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 10px;
                border-radius: 50%;
            }
            .pb{
                font-family: "Noto Sans KR";
                font-weight: 300;
            }
            .cancel-btn>a{
                text-decoration: none;
            }
            .complete-btn>a{
                text-decoration: none;
            }
            .cancel-btn{
                width:50px;
                height:30px;
                border: 1px solid gray;
                text-align: center;
                font-size: 20px;
            }
            .complete-btn{
                width:100px;
                height:30px;
                border: 1px solid gray;
                text-align: center;
                font-size: 20px;
            }
            #wr_content{
                margin-top: 10px;
                
            }
        
            @font-face { 
    font-family: 'S-Core'; 
    src: url("./S-CoreDream-4Regular.woff") format("woff"); 
  }

*{
    font-family : 'S-Core';
}

#ad_body {
  background-color : #E3E7EA;
}

/* 관리자 header */
#ad_header {
  width : 1500px;
  height : 100px;
  margin : auto;
  display : flex;
  justify-content : space-between;
  align-items:flex-end;
}

#header_title {
  float : left;
  font-size : 45px;
  text-align : center;
}

#header_options {
  float : right;
  font-size : 12px;
  display : flex;
  padding-bottom : 5px;
  margin-right : 5px;
}

#header_logout {
  margin-left : 10px;
  cursor: pointer;
}

/* 관리자 body */

#ad_container {
  width : 1500px;
  height : 800px;
  margin:auto;
  background-color : white;
}

/* 관리자 navigation */

#ad_left {
  width : 200px;
  height : 800px;
  float:left;
  background-color: #34495E;
  color : white;
}

#lefNavList {
  margin-top : 0px;
}

#lefNavList,.navOptions  {
  list-style: none;
  padding-left : 0px;
}

#lefNavList>li {
    width : 200px;
    border-bottom : 1px solid black;
    min-height : 50px;
    line-height : 50px;
    text-align: center;
    /* background-color: #2E353B; */
    background-color: #34495E;
    cursor: pointer;
}

#lefNavList>li i {
  float:right;
  line-height:50px;
  padding-right:30px;
}

.navOptions {
  display : none;
  padding-left : 0px;
}

.navOptions li {
    width : 200px;
    height : 50px;
    line-height : 50px;
    background-color: #9BC3FF;
}

/* 관리자 Contents */


/* 관리자 Contents 아웃라인 */

#ad_right {
  width : 1300px;
  float : right;
}

#contHeader{
  width : 1150px;
  margin : auto;
  margin-top : 40px;
  border-bottom : 2px gray solid;
  /* padding-left : 10px; */
  font-size : 30px;
}

#contBody {
  width : 1150px;
  height : 670px;
  margin : auto;
  margin-top : 20px;
}

/* 관리자 - 메인페이지 */

#mainWrap {
  width : 1150px;
  height : 700px;
  margin : auto;
  text-align : center;
  line-height : 700px;
}

/* 관리자 - cotents - 헤더 */

#contentTitle {
  width : 1150px;
  height : 50px;
  margin : auto;
  margin-top : 25px;
  margin-bottom : 5px;
  font-size : 30px;
  text-align : center;
  line-height : 50px;
}

/* 관리자 - cotents - 검색 */

#searchWrap {
  font-size : 10px;
  float : right;
}

#searchOption , #searchWord {
  width : 160px;
  height : 35px;
}

#searchBtn {
  height:35px;
  width : 75px;
  line-height:15px;
}

/* 관리자 - cotents - 테이블 */

/* commons */

#contentTabWrap {
  margin-top : 50px;
  width : 1150px;
  height : 550px;
}

/* 관리자 - content - memberList 테이블 */

#memListTab {
  width: 1150px;
  margin : auto;
  font-size : 13px;
}


#memListTab th , #memListTab td {
  border : 1px solid black;
  text-align : center;
}

#memListTab th {
  background-color : #DADADA;
}

#memListTab td {
  height : 45px;
  text-align : center;
  line-height : 30px;
}

#memListTab tr:first-child {
  height : 35px;
}

#memListTab tr button {
  width:60px;
  height:30px;
  font-size : 13px;
}

#memListBtn {
  margin-top : 8px;
  float : right;
}

#memListBtn button {
  width : 100px;
  height : 30px;
  line-height : 12px;
}

/* 관리자 - content - memberDelete 테이블 */

#memDelTab {
  width: 1150px;
  margin : auto;
  font-size : 13px;
}


#memDelTab th , #memDelTab td {
  border : 1px solid black;
  text-align : center;
}

#memDelTab th {
  background-color : #DADADA;
}

#memDelTab td {
  height : 45px;
  text-align : center;
  line-height : 30px;
}

#memDelTab tr:first-child {
  height : 35px;
}

#memDelTab tr button {
  width:60px;
  height:30px;
  font-size : 13px;
}

#memDelBtn {
  margin-top : 8px;
  float : right;
}

#memDelBtn button {
  width : 100px;
  height : 30px;
  line-height : 12px;
}
        
        
        
        
        </style>





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