<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<link rel="stylesheet" href="${path }/resources/css/dg.css" type="text/css"> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="회원가입"/>
</jsp:include>

    <div id="login-nav">
        <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
            <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">회원가입</span>
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
        <section>
            <div class="container-regiester">
                  <form action="${path }/member/memberEnrollEnd.do" method="post" id="memberForm" name="memberEnrollFrm" >
                  <div class="wrapper-regiester">
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>아이디</label>
                        <p class="mark-required">*</p>
                      </div>
                      <input type="text" class="regiester-form" maxlength="20" id="userId" name="userId">
                      <input type="hidden" id="memberPwYn" name="memberPwYn">
                      <input type="button" class="regiester-btn-frame basic" value="중복확인" onclick="">
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>비밀번호</label>
                        <p class="mark-required">*</p>
                      </div>
                      <div>
                        <input type="password" name="userPassword" id="userPassword" class="regiester-form" maxlength="20">
                        <p class="regiester-guide">(영문자/숫자 중 2가지 이상 조합, 8자~20자)</p>
                      </div>
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>비밀번호 확인</label>
                        <p class="mark-required">*</p>
                      </div>
                      <input type="password" name="userPasswordCheck" id="userPasswordCheck" class="regiester-form" maxlength="20">
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>이름</label>
                        <p class="mark-required">*</p>
                      </div>
                      <input type="text" name="userName" id="userName" class="regiester-form" >
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>이메일</label>
                        <p class="mark-required">*</p>
                      </div>
                      <div>
                        <input type="email" name="email" id="email" class="regiester-email regiester-form">
                      </div>
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>생년월일</label>
                        <p class="mark-required">*</p>
                      </div>
                      <input type="text" name="birthDate" id="birthDate" class="regiester-form" >
                    </div>
                    <div class="regiester-container-no-margin">
                      <div class="container-label">
                        <label>주소</label>
                        <p class="mark-required">*</p>
                      </div>
                      <div>
                        <div class="regiester-container-address">
                          <!-- <input type="text" name="memberPostNo" id="address1" class="postal-code regiester-form" maxlength="6"> --> 
                          <input type="text" name="address" id="address1" class="regiester-form address">
                          <button type="button" class="regiester-btn-frame basic" onclick="findAddr();">우편번호</button>
                        </div>
                        <div class="regiester-container-address">
                          <input type="text" name="address" id="address2" class="regiester-form address">
                          <p class="guide">상세주소</p>
                        </div>
                        <!-- <div class="regiester-container-no-margin">
                          <input type="text" name="memberAddressEnd" id="memberAddressEnd" class="regiester-form address">
                          <p class="guide">나머지 주소</p>
                          <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                        </div> -->
                      </div>
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>휴대폰 번호</label>
                        <p class="mark-required">*</p>
                      </div>
                      <div>                      
                        <input type="text" class="regiester-phone" id="phone" name="phone">
                      </div>
                    </div>
                  </div>   
                  <div class="regiester-container-button">
                    <input type="submit" class="regiester-btn-frame primary" value="회원가입">
                    <input type="reset" class="regiester-btn-frame basic" value="취소">
                  </div>
                  </form>
                </div>
          </section>
    
    <!-- As a heading -->
    
    <script>
    
    function findAddr(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	var addr="";
	        	//지번인지 도로명인지 분기처리
	        	if(data.userSelectedType =='R'){ //도로명 선택
	        		addr=data.roadAddress;
	        	}else{ //지번선택
	        		addr=data.jibunAddress;
	        	}
	       		document.getElementById('address1').value = addr;
	       		document.getElementById('address2').focus();
	        }
	    }).open();
	}
    
   
    
    $(function(){
$('.list-group-item').click(function(){
  $('.list-group-item').removeClass('on')
    $(this).addClass('on')
})

})
 
    
    </script>



    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>