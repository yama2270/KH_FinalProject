<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<link rel="stylesheet" href="${path }/resources/css/cg.css" type="text/css">  
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="개인정보확인"/>
</jsp:include>

<section id="container">
<div>
	<div id="TitleContainer">
		<h2>개인 정보 확인</h2>
	</div>

	<div class="list-group-container" >
	  <ul class="list-group">
	    <li class="list-group-item" id="menutitle">
	    	마이페이지
	   	</li>
	    <li class="list-group-item">
	    	<button type="button" onclick="location.assign('${path }/member/memberInfo.do')">개인정보확인</button>
	   	</li>
	    <li class="list-group-item">
	    	<button type="button" data-toggle="collapse" data-target="#borrow">도서이용내역</button>
			<div id="borrow" class="collapse">
				<a class="dropdown-item" href="${path }/member/memberBorrowing.do">▷대출현황조회</a>
		      	<a class="dropdown-item" href="${path }/member/memberBorrowed.do">▷대출이력조회</a>
		      	<a class="dropdown-item" href="${path }/member/memberBooking.do">▷예약현황조회</a>
			</div>
		</li>
	    <li class="list-group-item">
	    	<button type="button" data-toggle="collapse" data-target="#hope">희망 도서</button>
			<div id="hope" class="collapse">
				<a class="dropdown-item" href="${path }/searchpage/wishbook.do">▷희망도서 신청</a>
		      	<a class="dropdown-item" href="${path }/member/memberHopeBookRecord.do">▷희망도서 신청/이력 조회</a>
			</div>
	    </li>
	    <li class="list-group-item">
		    <button type="button" onclick="location.assign('${path }/member/memberBookMark.do')">관심 도서</button>
	    </li>
	    <li class="list-group-item">
			<button type="button" onclick="location.assign('${path }/member/memberReadingRoom.do')">열람실 이용내역</button>
	    </li>
	    <li class="list-group-item">
			<button type="button" onclick="location.assign('${path }/member/membershipCard.do')">모바일 회원증</button>
	    </li>
	    <li class="list-group-item">
			<button type="button" onclick="location.assign('${path }/member/memberDelete.do')">회원 탈퇴</button>
	    </li>
	  </ul>
	</div>
	<div id="UserInfo_Container">
		<div>
			<h2>개인정보확인</h2>
			<hr id="h2_line2" >
		</div>
		<form action="${path }/member/memberInfoUpdateEnd.do" method="post">
			<table id="Info_Update_table">
				<tr>
					<th><p style="margin-top:10px;" >성 명</p></th>
					<td><input type="text" id="name" name="userName" class="InfoInput" value="${loginMember.userName}" readonly></td>
				</tr>
				<tr>
					<th><p style="margin-top:10px;">회원 아이디</p></th>
					<td><input type="text" id="userId" name="userId" class="InfoInput" value="${loginMember.userId}" readonly></td>
				</tr>
				<tr>
					<th><p style="margin-top:10px;">비밀번호 변경</p></th>
					<td><input type="password" id="password" name="userPassword" placeholder="비밀번호를 입력하세요." class="InfoInput" required></td>
				</tr>
				<tr>
					<th><p style="margin-top:10px;">비밀번호 변경확인</p></th>
					<td><input type="password" id="passwordCheck" placeholder="비밀번호를 재입력하세요." class="InfoInput" required></td>
				</tr>
				<tr>
					<th><p style="margin-top:10px;">휴대폰 전화</p></th>
					<td>
						<input type="text" id="phone" name="phone" value="${loginMember.phone}">
					</td>
				</tr>
				<tr >
					<th><p style="margin-top:10px;">생년월일</p></th>
					<td><input type="date" id="date" name="birthDate" class="InfoInput" value="${loginMember.birthDate }"></td>
				</tr>
				<tr>
					<th><p style="margin-top:10px;">주 소</p></th>
					<td>
						<input type="text" id="address1" name="address" placeholder="주소를 입력하세요." class="InfoInput" value="${loginMember.address }">
						<button type="button" class="btn btn-outline-success" style="height:30px;" onclick="findAddr();">우편번호 검색</button>
					</td>
				</tr>
				<%-- <tr>
					<th></th>
					<td><input type="text" id="address2" placeholder="상세주소를 입력하세요." class="InfoInput" value="${loginMember.address }"></td>
				</tr> --%>
				<tr>
					<th><p style="margin-top:10px;">이메일</p></th>
					<td><input type="email" id="email" name="email" placeholder="이메일 입력하세요." class="InfoInput" value="${loginMember.email }"></td>
				</tr>
			</table>
			<div id="Ok_Cancel_btn">
				<button type="submit" class="btn btn-outline-primary">확인</button>
				<button type="button" class="btn btn-outline-danger" onclick="location.assign('${path }/member/memberInfo.do')">취소</button>
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
	//비밀번호 값 일치 check
	$(function(){
		$("#passwordCheck").blur((e)=>{
			const passwordCheck=$(e.target).val();
			const password=$("#password").val();
			if(passwordCheck!=password){
				alert("패스워드가 일치하지 않습니다.");
				$("#password").focus();
			}
		});
	});
</script>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>