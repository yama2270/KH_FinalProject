<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hy.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yh.css">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
    <title>열람실 예약</title>
</head>
<body id="ad_body">
    <div class="seathead">
        <h2>좌석정보</h2>
        <form class="d-flex" action="${path }/notice/redingroombooking.do" method="post">
        <table class="seattable">
            <tr>
                <th class="seattablehead" colspan="2">열람실C
                	<input type="hidden" name="studyroomtype" value="열람실C">
                </th>
            </tr>
            <tr>
                <td class="seattablehead">좌석번호</td>
                <td class="seattablehead">
                	<input type="hidden" name="seatno" value="${list.seatNo }">
                	<c:out value="${list.seatNo }"/>
                </td>
            </tr>
            <tr>
                <td class="seattablehead">시작시간</td>
                <td class="seattablehead">
               
                	<select class="fontsize" id="selStart" name="searchOption" aria-label="Default select example">
                		<option>시간선택</option>
                        <option value="09:00">09:00</option>
                        <option value="10:00">10:00</option>
                        <option value="11:00">11:00</option>
                        <option value="12:00">12:00</option>
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                        <option value="18:00">18:00</option>
                        <option value="19:00">19:00</option>
                        <option value="20:00">20:00</option>
                        <option value="21:00">21:00</option>
                        <option value="22:00">22:00</option>
                   	</select>
                </td>
            </tr>
            <tr>
                <td class="seattablehead">끝나는시간</td>
                <td class="seattablehead">
                	<select class="fontsize" id="selEnd" name="searchOption2" aria-label="Default select example">
                        <option>시간선택</option>
                        <option value="10:00">10:00</option>
                        <option value="11:00">11:00</option>
                        <option value="12:00">12:00</option>
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                        <option value="18:00">18:00</option>
                        <option value="19:00">19:00</option>
                        <option value="20:00">20:00</option>
                        <option value="21:00">21:00</option>
                        <option value="22:00">22:00</option>
                        <option value="23:00">23:00</option>
                   	</select>
                </td>
            </tr>
            <tr>
                <td class="seattablehead">이용상태</td>
                <td class="seattablehead">
                	<input type="hidden" name="usagestatus" value="${list.usageStatus }">
                	<input type="hidden" name="userid" value="${loginMember.userId }">
                	<c:out value="${list.usageStatus }"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="seatcall">
                <button onclick="booking();">예약하기</button>
		        <button onclick="test();" >닫기</button>
                </td>
            </tr>
        </table>
        </form>
    </div>

<script>
    function test(){
        close();
    }
    
    $("#selStart").prop("selected",true);
	$("#selEnd").prop("selected",true);
	
	const today = new Date();
	
	// 시작시간 - 현재시간
	for(i=0;i<14;i++){
		const timeOp = $("#selStart").children().eq(i);
		if(timeOp.val().substring(0,2)<today.getHours()){
			timeOp.prop("disabled",true);
			console.log(timeOp);
		}
	}
	
	// 시작시간 - 예약테이블 
	let stGap;
	<c:forEach var="t" items="${time}">
		stGap = Number('${t.endTime}'.substring(0,2) - '${t.startTime}'.substring(0,2));
		for(i=0;i<14;i++){
			const timeOp = $("#selStart").children().eq(i);
			if(timeOp.val()=='${t.startTime}'){
				for(j=0;j<stGap;j++){
					timeOp.prop("disabled",true);
					i++;
				}
			}
		}		
	</c:forEach>
	
	
	// 시작시간 - 현재이용
	const usingStart = '${list.startTime}';
	const usingEnd = '${list.endTime}';
	const usingGap = Number(usingEnd.substring(0,2) - usingStart.substring(0,2));
	
	for(i=0;i<14;i++){
		if($("#selStart").children().eq(i).val()==usingStart){
			for(j=0;j<usingGap;j++){
				$("#selStart").children().eq(i).prop("disabled",true);
				i++;
			}
		}
	}
	
	
	// 종료시간 
	
	// 종료시간 - 현재시간 기준 
	
	for(i=13;i>-1;i--){
		let comHour = $("#selEnd").children().eq(i).val().substring(0,2);
		if(comHour<=today.getHours()){
			$("#selEnd").children().eq(i).prop("disabled",true);
		}
	}
	
	
	// 종료시간 - 예약테이블 
	let endGap;
	<c:forEach var="b" items="${time}">
	endGap = Number('${b.endTime}'.substring(0,2) - '${b.startTime}'.substring(0,2));
		for(i=13;i>-1;i--){
			if($("#selEnd").children().eq(i).val()=='${b.endTime}'){
				for(j=0;j<endGap;j++){
					$("#selEnd").children().eq(i).prop("disabled",true);
					i--;
				}
			}
		}	
	</c:forEach>
	
	// 종료시간 - 현재이용
	
	endGap = Number('${list.endTime}'.substring(0,2)-'${list.startTime}'.substring(0,2));
	for(i=13;i>-1;i--){
		if($('#selEnd').children().eq(i).val()=='${list.endTime}'){
			for(j=0;j<endGap;j++){
				$("#selEnd").children().eq(i).prop("disabled",true);
				i--;
			}
		}
	}
    
  
    
</script>

</body>
</html>