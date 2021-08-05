<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<link rel="stylesheet" href="${path }/resources/css/cg.css" type="text/css">   
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="개인정보확인"/>
</jsp:include>

<section id="container">
<div>
	<div id="TitleContainer">
		<h2>마이페이지</h2>
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
	
	<form action="${path }/member/memberPwck.do" method="post">
		<div id="UserInfo_Container">
			<table id="Pw_Check_table">
				<tr>
					<th><p>비밀번호 입력</p></th>
					<td><input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요." required></td>
				</tr>
			</table>
		</div>
		<div id="Ok_Cancel_btn">
			<button type="submit" class="OKCCbtn">확인</button>
			<button type="button" class="OKCCbtn" onclick="location.assign('${path }/')">취소</button>
		</div>
	</form>
	<%-- <div id="Ok_Cancel_btn">
		<button type="button" class="btn btn-outline-primary" onclick="location.assign('${path }/member/memberTestLogin.do')">TEST로그인</button>
		<button type="button" class="btn btn-outline-danger" onclick="location.replace('${path }/member/memberTestlogout.do')">로그아웃</button>
		<P>현재 TEST 로그인 : ${loginMember.userName}</P>
	</div> --%>
</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>