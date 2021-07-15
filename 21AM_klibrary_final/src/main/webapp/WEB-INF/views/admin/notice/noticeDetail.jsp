<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="공지사항상세"/>
</jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sh.css">
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <title>공지사항 상세</title>
</head>
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