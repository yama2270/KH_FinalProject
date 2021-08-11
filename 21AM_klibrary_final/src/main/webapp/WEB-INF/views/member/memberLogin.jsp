<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<link rel="stylesheet" href="${path }/resources/css/dg.css" type="text/css"> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="로그인"/>
</jsp:include>
	<div id="login-wraper">
	    <div id="login-nav">
	        <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
	            <div class="container-fluid">
	            <span class="navbar-brand mb-0 h1">로그인</span>
	            </div>
	        </nav>
	    </div>
	    
	    <div id=login-content>
	        <div class="list-group-container" >
			  <!-- <h2 id="title">회원정보</h2> -->
			  <ul class="list-group">
			    <li class="list-group-item" id="menutitle">회원정보</li>
			    <li class="list-group-item"><a href="${path }/member/memberLogin.do">로그인</a></li>
			    <li class="list-group-item"><a href="${path }/member/memberIdFind.do">아이디 찾기</a></li>
			    <li class="list-group-item"><a href="${path }/member/memberPwFind.do">비밀번호 재발급</a></li>
			    <li class="list-group-item"><a href="${path }/member/memberEnroll.do">회원가입</a></li>
			  </ul>
			</div>
		</div>
	
	        <div id="login-container">
	            <div id="login-input">
	            <form action="${path }/member/memberLoginCheck.do" method="post">
	                <input type="text" name="userId" class="login-input" placeholder="아이디 입력"><br>
	                <input type="password" name="userPassword" class="login-input" placeholder="비밀번호 입력">
	                <input type="submit" value="로그인" class="login-btn">
	            </form>
	                <div class="login-member"> 
	                    <a class="memberBtn" href="${path }/member/memberIdFind.do">아이디 찾기</a>
	                    <a class="memberBtn" href="${path }/member/memberPwFind.do">비밀번호 찾기</a>
	                    <a class="memberBtn" href="${path }/member/memberEnroll.do">회원가입</a>
	                </div>
	            
	            </div>
	        </div>
        </div>
        <script>
        
        $(function(){
   $('.list-group-item').click(function(){
      $('.list-group-item').removeClass('on')
        $(this).addClass('on')
   })
   
})
</script>  

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    