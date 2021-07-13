<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hy.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dg.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hj.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sy.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/cg.css">
    <!-- fontawsome CDN 불러오기 -->
   
    <title>희망도서안내</title>

 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
  <script src="../js/jquery-3.6.0.min.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
</head>
<body>
  
  <div class="divcontainer1">
    <br>
    <h2 id="wishbooktitle1">희망도서신청</h2>
    <br>
  </div>

<div class="menuContainer" >
  <!-- <h2 id="title">자료검색</h2> -->
  <ul class="list-group">
    <li class="list-group-item" id="menutitle">자료검색</li>
    <li class="list-group-item">통합검색</li>
    <li class="list-group-item">상세검색</li>
    <li class="list-group-item">주제별검색</li>
    <li class="list-group-item">희망도서신청</li>
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
            홈페이지 내서재>나의신청정보>희망도서신청조회에서 확인 가능<br>
            각 진행상태는 아래와 같습니다.<br>
            신청중 : 담당자가 검토중인 상태<br>
            처리중 : 구입하여 정리하고 있는 상태<br>
            소장중 : 희망도서를 자료실에 비치한 상태<br>
            취소됨 : 구입에서 제외된 상태(희망도서명을 클릭하면 취소사유 확인가능)
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
<button id="button24" type="submit">신청조회</button>
<button id="button24" type="submit">신청하기</button>
</div>
</div>
<br><br><br>


</body>

</html>	
	
