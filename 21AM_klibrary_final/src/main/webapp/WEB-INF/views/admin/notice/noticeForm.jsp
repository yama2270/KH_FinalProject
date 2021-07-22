<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="공지사항상세"/>
</jsp:include>
</head>
        <div id="ad_right">
            <div id="contHeader">공지사항 작성</div>
            <div id="contbody">
        </div>
        	<form name="noticeForm" action="${path }/admin/notice/insertNotice.do" method="post" enctype="multipart/form-data" >
	            <div class="form-group" style="margin-left:95px;margin-top:30px;">
	                <label for="userId">작성자</label>
	                <input class="userId" type="text" value="관리자" placeholder="작성자명" readonly required>
	            </div>
	
	       	 <div id="contents" class="container" style="margin-left:85px;">
	            <div class="form-group">
	            <label for="ca_name">분류</label>
	             <select class="form-control form-control-sm w-auto" name="noticeCate" required>
	                    <option value="선택">선택하세요</option>
	                    <option value="일정">일정</option>
	                    <option value="행사">행사</option>
	                    <option value="신간">신간</option>
	                    <option value="모집">모집</option>
	            </select>
	            
	            </div>
	            <div class="form-group">
	                <label for="wr_subject">제목</label>
	                <input class="title" type="text" name="noticeTitle"  id="wr_subject" required size="100" maxlength="200" placeholder="제목" style="width:865px;margin-top:10px;">
	            </div>
	
	            <div class="form-group d-cke-none">
	                <textarea id="wr_content" name="noticeContent"  maxlength="1000" style="width:900px; height: 400px;margin-top:10px;"
	                placeholder="내용을 입력해주세요"></textarea>
	            </div>
	            <input type="file" name="originalFile" style="width:200px;height:30px;">
	            
	            
	            <div class="write" style="margin-left:24%">
            <a href='<c:url value='/admin/notice/noticeList.do'/>' role="button" class="btn btn-outline-dark" style="margin-left:59%;margin-top:-7%;">취소</a>
	            <input type="submit" class="btn btn-outline-dark" style="margin-left:1%;margin-top:-7%;" value="작성">
	            </div>
          	</form>
    </div>



        </section>
        <!--section에 적용될 style, script 내용 넣어주세요-->
  
        <script>

            
        $(function(){
            // ul show()
            $(".navOptions").eq(2).show();
            // ul li 배경화면 
            $(".navOptions").eq(2).children().eq(0).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
        })
    
        
    
		$(function(){
			$("[name=originalFile]").change(e=>{
				const fileName=$(e.target).prop('files')[0].name;
				$(e.target).next(".custom-file-label").html(fileName);
			});
		})
	
        
/*             $(function(){

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
             */


        </script>
        
        <jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>