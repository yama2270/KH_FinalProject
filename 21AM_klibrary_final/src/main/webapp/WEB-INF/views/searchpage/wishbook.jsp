<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="희망도서신청안내"/>
</jsp:include>
<%-- <%   request.setCharacterEncoding("UTF-8");
String pageId = request.getParameter("pageId");

%> --%>
<body>
  
  <div class="divcontainer1">
    <br>
    <h2 id="wishbooktitle1">희망도서신청</h2>
    <br>
  </div>

<div class="list-group-container" >
  <!-- <h2 id="title">자료검색</h2> -->
  <ul class="list-group">
    <li class="list-group-item" id="menutitle">자료검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/bookSearch.do')">통합검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/detailSearch.do')">상세검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/categorySearch.do')">주제별검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/wishbook.do')">희망도서신청</li>
  </ul>
</div>

<div id="divContainer">
        <table id="textContainerTable">
            <tr>
                <th>
            <h3>희망도서 신청안내</h3>
                </th>
            </tr>
            <tr>
              <td>
            신청대상 : 회원증 소지자<br>
            신청방법 : 희망하는 도서가 도서관 소장자료인지 먼저 확인 후,<br>
             없을 경우 신청하기 메뉴에서 도서정보 및 신상정보 정확히 입력하고 신청버튼 클릭<br>
            처리주기 : 주 1회<br>
            원서처리주기 : 월 1회 (영어원서도서의 경우 매달 22일 마감되어 해당 월 도서구매에 반영됩니다.<br>
             통상 한 달 정도 소요되나, 입고지연 및 품절될 수 있는 점 참고 바랍니다)<br>
            신청권수 : 1인 월 2권<br>
            통보방법 : SMS 전송<br>
            유의사항 : 신청완료후 희망도서 도착시 해당 회원이 대출정지 및 대출도서<br>
             초과된 경우 신청하신 희망도서 예약이 불가하오니 참고해주시기 바랍니다
                </td>
             </tr>
             <tr>
                <th>
            <h3>희망도서 신청결과 확인</h3>
                </th>
              </tr>
              <tr>
                <td>
            홈페이지 마이페이지>희망도서 에서 확인 가능
            
                </td>
            </tr>
            <tr>
                <th>
            <h3>희망도서 선정 제외 기준</h3>
                </th>
            </tr>
            <tr>
                <td>
            소장도서 및 구입중 및 정리중인 자료, 중복신청도서<br>
            서지사항이 불분명한 도서 (서명, 저자명, 출판사명 등)<br>
            출판년이 5년을 경과한 자료(컴퓨터, 과학, 신학문 분야는 2년)<br>
            신판이 출판된 구판도서<br>
            서양서, 수험서, 문제집, 워크북, 소형 문고판<br>
            무협지, 판타지소설, 인터넷소설, 로맨스 소설, 만화류<br>
            대학교재 및 전문학술서적<br>
            희귀도서, 미풍양속, 정서에 문제를 유발할 수 있는 유해도서<br>
            품절이거나 절판된 도서<br>
            고가의 도서(5만원 이상) 및 전집<br>
            영리 또는 정치 목적의 신청도서<br>
            유사자료가 많이 소장되어 있는 경우<br>
            기관의 자료선정기준에 맞지 않는 도서
                </td>
            </tr>


        </table>
        <br><br><br>
<div id="buttonContainer">
<button id="button24" type="button" onclick="location.assign('${path}/member/memberHopeBookRecord.do')">신청조회</button>
<button id="button24" type="button" onclick="location.assign('${path}/searchpage/wishbookRequest.do')">신청하기</button>
</div>
</div>
<br><br><br>


</body>

</html>	
<script>

$(function(){
	console.log(window.location.href );
	
	  
	  $(".list-group").children().eq(4).css({"backgroundColor" : "lightgrey"})
	  
		 	   
	})

</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>