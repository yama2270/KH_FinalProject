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
                      <div>
                        <input type="text" name="userId" id="userId" class="regiester-form" maxlength="20" onchange="check_id()" required>
                        <button type="button" class="regiester-btn-frame basic" onclick="id_check()">중복확인</button>
                        <p class="regiester-guide">(아이디는 6글자이상 20글자 이하로 작성해주세요)</p>
                      </div>
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>비밀번호</label>
                        <p class="mark-required">*</p>
                      </div>
                      <div>
                        <input type="password" name="userPassword" id="userPassword" class="regiester-form" maxlength="20" onchange="check_pw()" required>
                        <p class="regiester-guide">(영문자/숫자 중 2가지 이상 조합, 8자~20자)</p>
                      </div>
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>비밀번호 확인</label>
                        <p class="mark-required">*</p>
                      </div>
                      <input type="password" name="userPasswordCheck" id="userPasswordCheck" class="regiester-form" maxlength="20" onchange="check_pw()" required><span id="check"></span>
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>이름</label>
                        <p class="mark-required">*</p>
                      </div>
                      <input type="text" name="userName" id="userName" class="regiester-form" required >
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>이메일</label>
                        <p class="mark-required">*</p>
                      </div>
                      <div>
                        <input type="email" name="email" id="email" class="regiester-email regiester-form" required>
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
                          <input type="text" name="address" id="address1" class="regiester-form address" required>
                          <button type="button" class="regiester-btn-frame basic" onclick="findAddr();">우편번호</button>
                        </div>
                        <div class="regiester-container-address">
                          <input type="text" name="address" id="address2" class="regiester-form address" required>
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
                        <input type="text" class="regiester-phone" id="phone" name="phone" required>
                      </div>
                    </div>
                  </div>   
                  <div class="regiester-container-button">
                    <input type="submit" class="regiester-btn-frame primary" name="frm" id="frm" value="회원가입" onclick="enrollCheck()">
                    <input type="reset" class="regiester-btn-frame basic" value="취소">
                  </div>
                  </form>
                </div>
          </section>
    
    <!-- As a heading -->
    
    <script>
    
    function check_id(){
    	var id = document.getElementById('userId').value;

        if(id.length < 6 || id.length>20){
            window.alert('아이디는 6글자 이상 20글자 이하로 입력해주세요.');
            document.getElementById('userId').value='';
            $("#userId").focus();
        }
    }
  
    
    function check_pw(){
        var pw = document.getElementById('userPassword').value;

        if(pw.length < 8 || pw.length>20){
            window.alert('비밀번호는 8글자 이상, 20글자 이하만 이용 가능합니다.');
            document.getElementById('userPassword').value='';
            $("#userPassword").focus();
        }
        if(document.getElementById('userPassword').value !='' && document.getElementById('userPasswordCheck').value!=''){
            if(document.getElementById('userPassword').value==document.getElementById('userPasswordCheck').value){
                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check').style.color='blue';
            }
            else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
                document.getElementById('userPasswordCheck').value='';
                $("#userPasswordCheck").focus();
                
            }
        }
    }
    
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