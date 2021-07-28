<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="회원관리"/>
</jsp:include>

	<div id="ad_right">
            <div id="contHeader">회원관리>회원목록>회원수정</div>
            <div id="contBody">
                <div id="contentTitle">회원정보</div>
                <form action="${path }/admin/member/memberUpdateEnd.do" method="post">
			<table id="Info_Update_tablenew">
				<tr>
					<th><p style="margin-top:10px;" >성 명</p></th>
					<td><input type="text" id="name" name="userName" class="InfoInput" value="${list.userName }"></td>
				</tr>
				<tr>
					<th><p style="margin-top:10px;">회원 아이디</p></th>
					<td><input type="text" id="userId" name="userId" class="InfoInput" value="${list.userId }" readonly></td>
				</tr>
				<tr>
					<th><p style="margin-top:10px;">비밀번호 변경</p></th>
					<td><input type="password" id="password" name="userPassword" value="${list.userPassword }" placeholder="비밀번호를 입력하세요." class="InfoInput"></td>
				</tr>
				<tr>
					<th><p style="margin-top:10px;">휴대폰 전화</p></th>
					<td>
						<input type="text" id="phone" name="phone" value="${list.phone }">
					</td>
				</tr>
				<tr >
					<th><p style="margin-top:10px;">생년월일</p></th>
					<td><input type="date" id="date" name="birthDate" class="InfoInput" value="${list.birthDate }"></td>
				</tr>
				<tr>
					<th><p style="margin-top:10px;">주 소</p></th>
					<td>
						<input type="text" id="address1" name="address" placeholder="주소를 입력하세요." class="InfoInput" value="${list.address }">
						<button type="button" class="btn btn-outline-success" style="height:30px;" onclick="findAddr();">우편번호 검색</button>
					</td>
				</tr>
				<%-- <tr>
					<th></th>
					<td><input type="text" id="address2" placeholder="상세주소를 입력하세요." class="InfoInput" value="${loginMember.address }"></td>
				</tr> --%>
				<tr>
					<th><p style="margin-top:10px;">이메일</p></th>
					<td><input type="email" id="email" name="email" placeholder="이메일 입력하세요." class="InfoInput" value="${list.email }"></td>
				</tr>
				<tr>
					<th><p style="margin-top:10px;">가입일</p></th>
					<td><input type="date" id="date" name="signupDate" class="InfoInput" value="${list.signupDate }" readonly></td>
				</tr>
			</table>
			<div id="Ok_Cancel_btn">
				<button type="submit" class="btn btn-outline-primary">확인</button>
				<button type="button" class="btn btn-outline-danger" onclick="location.assign('${path }/admin/member/memberList.do')">취소</button>
			</div>
		</form>
                
            </div>
            </div>



<script>
//우편 주소 API
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
       		document.getElementById('address1').value = addr+",";
       		document.getElementById('address2').focus();
        }
    }).open();
}
$(function(){
         // ul show()
         $(".navOptions").eq(0).show();
         // ul li 배경화면 
         $(".navOptions").eq(0).children().eq(0).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
     })	
	
</script>
	
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>