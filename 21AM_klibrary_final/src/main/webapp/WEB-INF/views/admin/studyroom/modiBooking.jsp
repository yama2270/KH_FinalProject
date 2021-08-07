<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
    <title>열람실 예약 수정</title>
</head>
<body width="500px;">
    <div id="modiWrap">
        <div id="moTitle">열람실 예약수정</div>
        <table id="studyTab">
            <tr>
                <td>열람실</td>
                <td>
                <select id="selRoom">
                    <option value="열람실A" ${bookingInfo.roomName=='열람실A'?'selected':'' }>열람실A</option>
                    <option value="열람실B" ${bookingInfo.roomName=='열람실B'?'selected':'' }>열람실B</option>    
                    <option value="열람실C" ${bookingInfo.roomName=='열람실C'?'selected':'' }>열람실C</option>    
                    <option value="열람실D" ${bookingInfo.roomName=='열람실D'?'selected':'' }>열람실D</option>        
                </select>
            </td>
            </tr>
            <tr>
                <td>좌석</td>
                <td>
                    <select id="selSeat"></select>
                </td>
            </tr>
            <tr>
                <td>시작시간</td>
                <td>
                    <select id="selStart">
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
                <td>종료시간</td>
                <td>
                    <select id="selEnd">
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
        </table>
        <div id="moBtnWrap">
            <input type="submit" name="conModi" onclick="javascript:alert('수정');" value="수정">
            <input type="button" name="conExit" onclick="javascript:alert('닫기');" value="닫기"> 
        </div>
    </div>

</body>
</html>

<style>

    #moTitle {
        margin-top : 30px;
        margin-bottom : 20px;
        text-align : center;
        font-size : 35px;
    }

    #studyTab {
        margin : auto;
        border : 5px #dcdcdc solid;
        border-collapse: collapse;
        
        width : 480px;
        height : 300px;
    }

    #studyTab td {
        font-size : 15px;
    }

    #studyTab tr td:first-of-type {
        border-right : 2px white solid;
        text-align : center;
        width : 200px;
    }

    #studyTab tr td:last-of-type {
        text-align : left;
    }

    #studyTab tr td:last-of-type select {
        margin-left : 80px;
        font-size : 15px;
        height:22px;
    }

    #moBtnWrap {
        margin-top : 10px;
        text-align:center;
    }

    #moBtnWrap input{
        font-size : 15px;
        height : 25px;
    }

</style>
	
	
<script>

	
	// 좌석 생성 
	switch('${bookingInfo.roomName}'){
	
	case '열람실A':
		
		for(i=1;i<41;i++){
			$('#selSeat').append('<option value="A'+i+'">A'+i+'</option>');
		}
		break;
		
	case '열람실B':
		
		for(i=1;i<41;i++){
			$('#selSeat').append('<option value="B'+i+'">B'+i+'</option>');
		}
		break;
		
	case '열람실C':
		
		for(i=1;i<41;i++){
			$('#selSeat').append('<option value="C'+i+'">C'+i+'</option>');
		}
		break;
		
	default:
		
		for(i=1;i<41;i++){
			$('#selSeat').append('<option value="D'+i+'">D'+i+'</option>');
		}
		break;
					
	}
	
	// 좌석 selected
	$("#selSeat").find('option[value=${bookingInfo.seatNo}]').prop("selected",true);
	
	// 시간 selected
	$("#selStart").find('option[value="${bookingInfo.startTime}"]').prop("selected",true);
	$("#selEnd").find('option[value="${bookingInfo.endTime}"]').prop("selected",true);
	
	const today = new Date();
	
	// 시작시간 - 현재시간
	for(i=0;i<14;i++){
		const timeOp = $("#selStart").children().eq(i);
		if(timeOp.val().substring(0,2)<today.getHours()){
			timeOp.prop("disabled",true);
		}
	}
	
	// 시작시간 - 예약테이블 
	let stGap;
	<c:forEach var="t" items="${bookingTime}">
		stGap = Number('${t.ENDTIME}'.substring(0,2) - '${t.STARTTIME}'.substring(0,2));
		for(i=0;i<14;i++){
			const timeOp = $("#selStart").children().eq(i);
			if(timeOp.val()=='${t.STARTTIME}'){
				for(j=0;j<stGap;j++){
					timeOp.prop("disabled",true);
					i++;
				}
			}
		}		
	</c:forEach>
	
	// 시작시간 - 현재이용
	const usingStart = '${usingTime.STARTTIME}';
	const usingEnd = '${usingTime.ENDTIME}';
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
		const comHour = $("#selEnd").children().eq(i).val().substring(0,2);
		if(comHour<=today.getHours()){
			$("#selEnd").children().eq(i).prop("disabled",true);
		}
	}
	
	// 종료시간 - 예약테이블 
	let endGap;
	<c:forEach var="b" items="${bookingTime}">
	endGap = Number('${b.ENDTIME}'.substring(0,2) - '${b.STARTTIME}'.substring(0,2));
		for(i=13;i>-1;i--){
			if($("#selEnd").children().eq(i).val()=='${b.ENDTIME}'){
				for(j=0;j<endGap;j++){
					$("#selEnd").children().eq(i).prop("disabled",true);
					i--;
				}
			}
		}	
	</c:forEach>
	
	// 종료시간 - 현재이용
	endGap = Number('${usingTime.ENDTIME}'.substring(0,2)-'${usingTime.STARTTIME}'.substring(0,2));
	for(i=13;i>-1;i--){
		if($('#selEnd').children().eq(i).val()=='${usingTime.ENDTIME}'){
			for(j=0;j<endGap;j++){
				$("#selEnd").children().eq(i).prop("disabled",true);
				i--;
			}
		}
	}
	
    // 열람실 선택 
    $("#selRoom").on("input",(e)=>{
        
    });

</script>