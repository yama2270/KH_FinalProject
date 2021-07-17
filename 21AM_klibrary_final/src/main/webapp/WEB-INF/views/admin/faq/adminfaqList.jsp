<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="공지사항상세"/>
</jsp:include>

        <div id="ad_right">
            <div id="contHeader">공지사항 작성</div>
            <div id="contbody">
        </div>
        	<form name="noticeFrm" action="${path }/admin/notice/insertNotice.do" method="post" enctype="multipart/form-data" >
            <div class="form-group" style="margin-left:95px;margin-top:30px;">
                <label for="userId">작성자</label>
                <input class="userId" type="text" name="user_id" value="${loginMember.userId }" id="userId" placeholder="작성자명" readonly required>
            </div>

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
                <input class="title" type="text" name="notice_title" value="" id="wr_subject" required size="100" maxlength="200" placeholder="제목">
            </div>

            <div class="form-group d-cke-none">
                <textarea id="wr_content" name="notice_content" class="smarteditor2" maxlength="1000" style="width:900px; height: 400px;"
                placeholder="내용을 입력해주세요">
                </textarea>
            </div>
            <input type="file" style="width:200px;height:30px;"></a></td></button>
            
            <div class="write" style="margin-left:24%">
            <a href='<c:url value='/admin/notice/noticeList.do'/>' role="button" class="btn btn-outline-dark" style="margin-left:60%;margin-top:1%;">취소</a>
            <input type="submit" class="btn btn-outline-dark" style="margin-left:1%;margin-top:1%;" value="작성">
            </div>
            </form>
    </div>



        </section>
        <!--section에 적용될 style, script 내용 넣어주세요-->
  
        <script>



        </script>
        
        <jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>