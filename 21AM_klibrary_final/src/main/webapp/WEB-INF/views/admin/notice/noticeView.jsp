<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="공지사항상세"/>
</jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sh.css">
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <title>공지사항 상세</title>
</head>
        <div id="ad_right">
            <div id="contHeader">공지사항	상세</div>
            <div id="contbody">
        </div>
        
            <div class="form-group" style="margin-left:95px;margin-top:30px;">
                <label for="user_id">작성자</label>
                <input class="user_Id" type="text" name="user_id" value="" id="user_id" placeholder="작성자명" disabled>
            </div>


		<form action='<c:url value='/notice/noticeList'/>' method="post">
        <div id="contents" class="container">
            <div class="form-group">
            <label for="ca_name">분류</label>
             <select class="form-control form-control-sm w-auto" id="ca_name" name="ca_name" required>
                    <option value="">선택하세요</option>
                    <option value="일정">일정</option>
                    <option value="행사">행사</option>
                    <option value="신간">신간</option>
                    <option value="모집">모집</option>
            </select>
            
            </div>
            <div class="form-group">
                <label for="wr_subject">제목</label>
                <input class="title" type="text" name="notice_title" value="${notice.noticeTitle}" id="wr_subject" required size="100" maxlength="200" placeholder="제목">
            </div>

            <div class="form-group d-cke-none">
                <textarea id="wr_content" name="notice_content" value="${notice.noticeContent}" class="smarteditor2" maxlength="1000" style="width:900px; height: 400px;"
                placeholder="내용을 입력해주세요">
                </textarea>
            </div>
            <input type="file" style="width:200px;height:30px;"></a></td></button>
            
            <div class="write" style="margin-left:24%">
            <a href='<c:url value='/admin/notice/noticeList.do'/>' role="button" class="btn btn-outline-dark" style="margin-left:60%;margin-top:1%;">취소</a>
            <a href='<c:url value='/admin/notice/noticeList.do'/>' role="button" class="btn btn-outline-dark" style="margin-left:1%;margin-top:1%;">작성</a>
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