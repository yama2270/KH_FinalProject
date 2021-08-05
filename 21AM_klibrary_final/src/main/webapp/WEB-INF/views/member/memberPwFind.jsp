<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<link rel="stylesheet" href="${path }/resources/css/dg.css" type="text/css"> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="비밀번호 찾기"/>
</jsp:include>

	<div id="login-nav">
        <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
            <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">비밀번호 재발급</span>
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
            <form action="${path }/member/memberPwCheck.do" method="post">
                <input type="text" name="userId" class="login-input" placeholder="아이디 입력"><br>
                <input type="text" name="userName" class="login-input" placeholder="이름 입력"><br>
                <input type="email" name="email" class="login-input" placeholder="이메일 입력">
                <input type="button" value="이메일 인증" class="login-btn"><br>
                <input type="submit" value="비밀번호 재발급" class="findId-btn">

            </form>
            </div>
        </div>
    
    <!-- As a heading -->
    
    



    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
    
    <script>
        
        $(function(){
   $('.list-group-item').click(function(){
      $('.list-group-item').removeClass('on')
        $(this).addClass('on')
   })
   
})
</script>  
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>